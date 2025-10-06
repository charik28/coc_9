package alpass.ipt.coc.rprt.service;

import alpass.com.cstm.vo.ComCstmOrgnVo;
import alpass.ipt.coc.mgmt.emp.vo.CocMgmtEmpVo;
import alpass.ipt.coc.rprt.mapper.CocRprtMapper;
import alpass.ipt.coc.rprt.mapper.CocRprtPrntMapper;
import alpass.ipt.coc.rprt.vo.*;
import alpass.ipt.coc.rprt.vo.dto.CocReportRequest;
import alpass.ipt.coc.rprt.vo.dto.CocReportResultDto2;
import alpass.ipt.coc.rprt.vo.dto.HtmlUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class CocRprtPrntService {

    /**
     * COC RPRT PRNT mapper
     */
    private final CocRprtPrntMapper cocRprtPrntMapper;
    private final CocRprtMapper cocRprtMapper;

    /**
     * Récupérer un rapport unique par son numéro de référence.
     *
     * @param cocRprtVo CocRprtVo
     * @return L'objet CocRprtVo correspondant, ou null s'il n'existe pas.
     */
    public CocRprtVo selectRprt(CocRprtVo cocRprtVo) {
        CocRprtVo Vo = cocRprtPrntMapper.selectRprt(cocRprtVo);
        return Vo;
    }

    /**
     * Récupérer un rapport unique par son numéro de référence.
     *
     * @param requestData CocRprtIncVo
     * @return L'objet CocRprtVo correspondant, ou null s'il n'existe pas.
     */
    public CocRprtIncVo selectRprtInc(CocRprtIncVo requestData) {
        CocRprtIncVo Vo = cocRprtPrntMapper.selectRprtInc(requestData);
        return Vo;
    }

    /**
     * Récupérer la liste des cargaisons d'un rapport
     *
     * @param cocRprtVo CocRprtVo
     * @return List<CocRprtCagVo>
     */
    public List<CocRprtCagVo> selectRprtCagList(CocRprtVo cocRprtVo) {
        List<CocRprtCagVo> CagVoList = cocRprtPrntMapper.selectRprtCagList(cocRprtVo);
        return CagVoList;
    }

    /**
     * Récupérer la liste des personnes d'un rapport
     *
     * @param cocRprtVo CocRprtVo
     * @return List<CocRprtPrsnVo>
     */
    public List<CocRprtPrsnVo> selectRprtPrsnList(CocRprtVo cocRprtVo) {
        List<CocRprtPrsnVo> PrsnVoList = cocRprtPrntMapper.selectRprtPrsnList(cocRprtVo);
        return PrsnVoList;
    }

    /**
     * Récupérer la liste des transports d'un rapport
     *
     * @param cocRprtVo CocRprtVo
     * @return List<CocRprtTrnpVo>
     */
    public List<CocRprtTrnpVo> selectRprtTrnpList(CocRprtVo cocRprtVo) {
        List<CocRprtTrnpVo> TrnpVoList = cocRprtPrntMapper.selectRprtTrnpList(cocRprtVo);
        return TrnpVoList;
    }

    /**
     * Récupérer la liste des entreprises d'un rapport
     *
     * @param cocRprtVo CocRprtVo
     * @return List<CocRprtCmpnyVo>
     */
    public List<CocRprtCmpnyVo> selectRprtCmpnyList(CocRprtVo cocRprtVo) {
        List<CocRprtCmpnyVo> CmpnyVoList = cocRprtPrntMapper.selectRprtCmpnyList(cocRprtVo);
        return CmpnyVoList;
    }

    /**
     * Récupérer les détails de voyage d'un rapport
     *
     * @param cocRprtVo CocRprtVo
     * @return CocRprtVygVo
     */
    public CocRprtVygVo selectRprtVyg(CocRprtVo cocRprtVo) {
        return cocRprtPrntMapper.selectRprtVyg(cocRprtVo);
    }

    /**
     * Récupérer la liste des douaniers d'infraction
     *
     * @param cocRprtVo CocRprtVo
     * @return List<CocMgmtEmpVo>
     */
    public List<CocMgmtEmpVo> selectEmpRprtList(CocRprtVo cocRprtVo) {
        return cocRprtPrntMapper.selectEmpRprtList(cocRprtVo);
    }

    /**
     * Récupérer les parents d'un bureau
     *
     * @param requestVo ComCstmOrgnVo
     * @return List<ComCstmOrgnVo>
     */
    public List<ComCstmOrgnVo> selectCstmOrgn(ComCstmOrgnVo requestVo) {
        return cocRprtPrntMapper.selectCstmOrgn(requestVo);
    }

    public PrintVo2 getReports(CocReportRequest cocReportRequest) {
        PrintVo2 printVo = new PrintVo2();

        printVo.setT0Dttm("يومي 03 و04 سبتمبر 2025");


        //CocRprtVo cocRprtVo = new CocRprtVo();
/*

        cocRprtVo.setSrchOrgnCd(cocReportRequest.getSrchOrgnCd());
        cocRprtVo.setRprtTpCd(cocReportRequest.getSrchRprtTpCd());
        cocRprtVo.setOrgnCd(cocReportRequest.getOrgnCd());

        cocRprtVo.setRprtRqstDtFrom(cocReportRequest.getRprtRqstDtFrom());
        cocRprtVo.setRprtRqstDtTo(cocReportRequest.getRprtRqstDtTo());
*/


        List<CocReportResultDto2> cocReportDtos = cocRprtMapper.selectReportList2(cocReportRequest);

//        logger.debug(cocReportDtos.toString());

        printVo.setBrqSpsOtsList(cocReportDtos);


        return printVo;
    }

    public String buildReportHtml(){
        StringBuilder sb = new StringBuilder();

        sb.append(getFileContent("html\\brq-1.html"));

        return sb.toString();

    }
    public String buildReportHtml(CocReportRequest cocReportRequest) {

        PrintVo2 printVo = getReports(cocReportRequest);

        CocRprtVo cocRprtVo = new CocRprtVo();
        cocRprtVo.setRprtRqstDtTo("20250922");
        cocRprtVo.setOrgnCd(cocReportRequest.getOrgnCd());
        cocRprtVo.setRprtRqstDtFrom(cocReportRequest.getRprtRqstDtFrom());

        List<CocRprtVo> cocRprtVos = cocRprtMapper.selectRprtList(cocRprtVo);
//        cocRprtVos.get(0).getRprt
        StringBuilder html = new StringBuilder();
        log.info(cocRprtVos.toString());

        html.append(HtmlUtils.HEAD);
        html.append(HtmlUtils.A4CSS)
                .append("""
                             <body>
                             <!-- Contenu des rapports -->
                               <div id="reports-parent-container" class="rtl-box">
                                 <div id="report-container" class="rtl-box">
                        """)
                // .append("<div class='container'>")
                .append("<div style='text-align: center'>")
                .append("<h4>الجمهورية الجزائرية الديمقراطية الشعبية</h4>")
                .append("<h4>وزارة المالية</h4>")
                .append("<h4>المديرية العامة للجمارك</h4>")
                .append("<h4>مديرية الأمن والنشاط العملياتي للفرق</h4>")
                .append("<h3>كشف الاستعلامات اليومي</h3>")
                .append("<div style='text-align: left'>")
                .append("<h5>الجزائر، في: ")
                .append(printVo.getT0Dttm())
                .append("</h5>")
                .append("</div>")
                .append("<div class='section'>")
                .append("<div>السيد اللواء، المدير العام للجمارك</div>")
                .append("</div>")
                .append("</div>")
                .append("</div>");

        // sections
        //if (printVo.getSections() != null)


        // html.append(cocRprtVos.toString());


        int index = 0;
        if (cocRprtVos.isEmpty()) {
            html.append("<h5><u><b>لا يوجد نتائج ")
                    .append("</b></u></h5>");

        } else {

            for (CocRprtVo cocRprtVo1 : cocRprtVos) {

                CocReportResultDto2 resultDto2 = new CocReportResultDto2();
                resultDto2.setRprtTpCd(cocRprtVo1.getRprtTpCd());
                resultDto2.setOrgnCd(cocRprtVo1.getOrgnCd());
                resultDto2.setT1ReportNature(cocRprtVo1.getRprtInfNtr());
                resultDto2.setRprInfJrdqTxt(cocRprtVo1.getRprtInfJrdqTxt());
                resultDto2.setOrgnNm(resultDto2.getOrgnNm());

                // resultDto2.setT5TypeMarchandise(cocRprtVo1.get);


                //resultDto2.setT6TransportMarchandiseHelper(resultDto2.getT6TransportMarchandiseHelper());
//              resultDto2.setRprtInfDttm
//              resultDto2.setRprtInfPlc
//              resultDto2.set

                if (index++ > 4)
                    break;

                toHtml(html, cocRprtVo1);
            }
            /*for (CocReportResultDto2 item : printVo.getBrqSpsOtsList()) {
                toHtml(html, item);

            }*/

        }
        html.append("""
                    </div>
                </div>
                </body>
                </html>
                """);

        return html.toString();

    }

    private void toHtml(StringBuilder html, CocReportResultDto2 item) {
        int orgnIndex = 1;

        html.append("<h5><u><b>")
                .append(orgnIndex)
                .append(" - المصلحة المعاينة للمخالفة: </b></u> ")
                .append(item.getOrgnNm())
                .append("</h5>")

                .append("<h5><u><b>طبيعة المخالفة: </b></u>")
                .append(item.getRprtInfNtr())
                .append("</h5>")

                .append("<h5><u><b>مكان اكتشاف المخالفة: </b></u>")
                .append(item.getRprtInfPlc())
                .append("</h5>")

                .append("<h5><u><b>التاريخ والساعة: </b></u>")
                .append(item.getRprtInfDttm())
                .append("</h5>")

                .append("<h5><u><b>تعيين البضاعة محل الغش: </b></u>")
                .append(item.getT5TypeMarchandise())
                .append("</h5>")

                .append("<h5><u><b>وسيلة النقل المستعملة: </b></u>")
                .append(item.getT6TransportMarchandis())
                .append("</h5>")

                .append("<h5><u><b>قيمة وسيلة النقل المستعملة: </b></u>")
                .append(item.getT6TransportValue())
                .append("</h5>")

                .append("<h5><u><b>تقنية الكشف عن المخالفة: </b></u>")
                .append(item.getRprtInfTch())
                .append("</h5>")

                .append("<h5><u><b>البيانات المتعلقة بالأشخاص المسؤولين عن المخالفة: </b></u>")
                .append(item.getT8Personne())
                .append("</h5>")

                .append("<h5><u><b>قيمة الغرامة المستحقة: </b></u>")
                .append(item.getCagValTtl())
                .append("</h5>")

                .append("<h5><u><b>النصوص القانونية المجرمة والردعية: </b></u>")
                .append(item.getRprInfJrdqTxt())
                .append("</h5>")

                .append("<h5><u><b>الإجراءات المتخذة: </b></u>")
                .append(item.getRprtIntPRcd())
                .append("</h5>");
        orgnIndex++;
    }

    private void toHtml(StringBuilder html, CocRprtVo cocRprtVo) {
        int orgnIndex = 1;

        html.append("<h5><u><b>")
                .append(orgnIndex)
                .append(" - المصلحة المعاينة للمخالفة: </b></u> ")
//                .append(cocRprtVo.getOrgnNm())
                .append(cocRprtVo.getOrgnCd())
                .append("</h5>")

                .append("<h5><u><b>طبيعة المخالفة: </b></u>")
                .append(cocRprtVo.getRprtInfNtr())
                .append("</h5>");

        if (cocRprtVo.getRprtInfPlc() != null && !cocRprtVo.getRprtInfPlc().isEmpty()) {
            html.append("<h5><u><b>مكان اكتشاف المخالفة: </b></u>")
                    .append(cocRprtVo.getRprtInfPlc())
                    .append("</h5>");
        }

        if (cocRprtVo.getRprtInfDttm() != null && !cocRprtVo.getRprtInfDttm().isEmpty()) {
            html.append("<h5><u><b>التاريخ والساعة: </b></u>")
                    .append(cocRprtVo.getRprtInfDttm())
                    .append("</h5>");
        }

        if (cocRprtVo.getT5TypeMarchandise() != null && !cocRprtVo.getT5TypeMarchandise().isEmpty()) {
            html.append("<h5><u><b>تعيين البضاعة محل الغش: </b></u>")
                    // .append(cocRprtVo.getT5TypeMarchandise())
                    .append("</h5>");
        }

        if (cocRprtVo.getT6TransportMarchandis() != null && !cocRprtVo.getT6TransportMarchandis().isEmpty()) {
            html.append("<h5><u><b>وسيلة النقل المستعملة: </b></u>")
                    //.append(cocRprtVo.getT6TransportMarchandis())
                    .append("</h5>");
        }

        if (cocRprtVo.getT6TransportValue() != null && !cocRprtVo.getT6TransportValue().isEmpty()) {
            html.append("<h5><u><b>قيمة وسيلة النقل المستعملة: </b></u>")
                    //.append(cocRprtVo.getT6TransportValue())
                    .append("</h5>");
        }

        if (cocRprtVo.getRprtInfTch() != null && !cocRprtVo.getRprtInfTch().isEmpty()) {
            html.append("<h5><u><b>تقنية الكشف عن المخالفة: </b></u>")
                    .append(cocRprtVo.getRprtInfTch())
                    .append("</h5>");
        }

        if (cocRprtVo.getT8Personne() != null && !cocRprtVo.getT8Personne().isEmpty()) {
            html.append("<h5><u><b>البيانات المتعلقة بالأشخاص المسؤولين عن المخالفة: </b></u>")
                    //.append(cocRprtVo.getT8Personne())
                    .append("</h5>");
        }

        if (cocRprtVo.getCagValTtl() != null && !cocRprtVo.getCagValTtl().toString().isEmpty()) {
            html.append("<h5><u><b>قيمة الغرامة المستحقة: </b></u>")
                    .append(cocRprtVo.getCagValTtl())
                    .append("</h5>");
        }
        if (cocRprtVo.getRprInfJrdqTxt() != null && !cocRprtVo.getRprInfJrdqTxt().isEmpty()) {
            html.append("<h5><u><b>النصوص القانونية المجرمة والردعية: </b></u>")
                    //  .append(cocRprtVo.getRprInfJrdqTxt())
                    .append("</h5>");
        }

        if (cocRprtVo.getRprtIntPRcd() != null && !cocRprtVo.getRprtIntPRcd().isEmpty()) {
            {
                html.append("<h5><u><b>الإجراءات المتخذة: </b></u>")
                        //  .append(cocRprtVo.getRprtIntPRcd())
                        .append("</h5>");
            }
            orgnIndex++;
        }

    }

    public String getFileContent(String fileName) {

        Path path = Paths.get("C:\\wrk\\dist\\",fileName);
        try {
            return Files.readString(path);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

