package alpass.ipt.coc.rprt.web;

import alpass.com.cstm.vo.ComCstmOrgnVo;
import alpass.framework.report.jasper.JasperReportsService;
import alpass.framework.service.BizProcessException;
import alpass.ipt.coc.brq.vo.DtVo;
import alpass.ipt.coc.mgmt.emp.vo.CocMgmtEmpVo;
import alpass.ipt.coc.rprt.service.CocRprtPrntService;
import alpass.ipt.coc.rprt.vo.*;
import alpass.ipt.coc.rprt.vo.dto.CocReportRequest;
import alpass.ipt.coc.rprt.vo.dto.CocReportResultDto2;
import alpass.ipt.coc.rprt.vo.dto.HtmlUtils;
import lombok.RequiredArgsConstructor;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * @Author GHEZALI Abdelhak
 * Created on 2025/03/18.
 */
@RestController
@RequiredArgsConstructor
public class CocRprtPrntController {

    /** jasper report servie for printing info */
    private final JasperReportsService jasperReportsService;
    private static final String REPORT_COMPILED_PATH = "classpath:reports/coc/rprt/Rapport.jasper";
    private static final String REPORT_COMPILED_PATH_INC = "classpath:reports/coc/rprt/RapportInc.jasper";

    private static final String REPORT_COMPILED_PATH_GLOBAL = "classpath:reports/coc/brq/brq.jasper";

    private final CocRprtPrntService cocRprtPrntService;
    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * Imprimer le Bilan rapport OTS / SPS.
     *
     * @param requestData CocRprtVo
     * @return ResponseEntity<>(samplePdf, headers, HttpStatus.OK)
     */
    @PostMapping("/coc/rprt/selectReport")
    public ResponseEntity<byte[]> selectReport(@RequestBody CocRprtVo requestData){


        List<CocRprtVo> BrqList = new ArrayList<CocRprtVo>();
        ComCstmOrgnVo OrgnNm = new ComCstmOrgnVo();

        CocRprtVo rprtVo =cocRprtPrntService.selectRprt(requestData);
        OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
        OrgnNm.setOrgnCd(requestData.getOrgnCd());
        List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
        rprtVo.setRprtCagList(cocRprtPrntService.selectRprtCagList(requestData));
        rprtVo.setRprtPrsnList(cocRprtPrntService.selectRprtPrsnList(requestData));
        rprtVo.setRprtTrnpList(cocRprtPrntService.selectRprtTrnpList(requestData));
        rprtVo.setRprtCmpnyList(cocRprtPrntService.selectRprtCmpnyList(requestData));
        rprtVo.setRprtEmpList(cocRprtPrntService.selectEmpRprtList(requestData));
        rprtVo.setRprtVygVo(cocRprtPrntService.selectRprtVyg(requestData));
        rprtVo.setOrgnList(lst);
        BrqList.add(rprtVo);

        Map<String, Object> parameters = new HashMap<>();


        JRBeanCollectionDataSource source = new JRBeanCollectionDataSource(BrqList, false);



        byte[] samplePdf = jasperReportsService.exportToCompiledSimplePdf(REPORT_COMPILED_PATH, parameters, rprtVo);



        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDisposition(ContentDisposition.attachment().filename("Report.pdf").build());

        return new ResponseEntity<>(samplePdf, headers, HttpStatus.OK);
    }


    /**
     * Imprimer le Bilan rapport Evenement / accident.
     *
     * @param requestData CocRprtVo
     * @return ResponseEntity<>(samplePdf, headers, HttpStatus.OK)
     */
    @PostMapping("/coc/rprt/selectReportInc")
    public ResponseEntity<byte[]> selectReportInc(@RequestBody CocRprtIncVo requestData){


        List<CocRprtIncVo> BrqList = new ArrayList<CocRprtIncVo>();
        ComCstmOrgnVo OrgnNm = new ComCstmOrgnVo();

        CocRprtIncVo rprtIncVo =cocRprtPrntService.selectRprtInc(requestData);
        OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
        OrgnNm.setOrgnCd(requestData.getOrgnCd());
        List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
        rprtIncVo.setOrgnList(lst);
        BrqList.add(rprtIncVo);

        Map<String, Object> parameters = new HashMap<>();


        JRBeanCollectionDataSource source = new JRBeanCollectionDataSource(BrqList, false);



        byte[] samplePdf = jasperReportsService.exportToCompiledSimplePdf(REPORT_COMPILED_PATH_INC, parameters, rprtIncVo);



        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDisposition(ContentDisposition.attachment().filename("Report.pdf").build());

        return new ResponseEntity<>(samplePdf, headers, HttpStatus.OK);
    }


    /**
     * Imprimer le Bilan rapport.
     *
     * @param request CocRprtRequest
     * @return ResponseEntity<>(samplePdf, headers, HttpStatus.OK)
     */
    @PostMapping("/coc/rprt/printReportBrqGlobal")
    public ResponseEntity<byte[]> printReportBrqGlobal(@RequestBody CocRprtRequest request)  throws IOException {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("SUBREPORT_DIR", "reports/coc/rprt/");
        BufferedImage image = ImageIO.read(this.getClass().getResource("/reports/com/images/secret.png"));
        BufferedImage logo = ImageIO.read(this.getClass().getResource("/reports/com/images/logo_color.png"));

        parameters.put("secret", image);
        parameters.put("logo", logo);

        List<CocRprtVo> paramBRQ1List = request.getParamBRQ1List();
        List<CocRprtIncVo> paramBRQ2List = request.getParamBRQ2List();

        List<CocRprtVo> BrqSpsList = new ArrayList<CocRprtVo>();
        List<CocRprtVo> BrqOtsList = new ArrayList<CocRprtVo>();

        List<CocRprtIncVo> BrqIncList = new ArrayList<CocRprtIncVo>();
        List<CocRprtIncVo> BrqAccList = new ArrayList<CocRprtIncVo>();
        List<DtVo> Dt = new ArrayList<DtVo>();

        HashSet<String> DtLst = new HashSet<String>();

        CocRprtIncVo rprtIncVo = new CocRprtIncVo();
        CocRprtVo rprtVo = new CocRprtVo();
        ComCstmOrgnVo OrgnNm = new ComCstmOrgnVo();

        for(CocRprtVo vo : paramBRQ1List){
            vo.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
            if(vo.getRprtTpCd().equals("OTS")){
                rprtVo =cocRprtPrntService.selectRprt(vo);
                OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                OrgnNm.setOrgnCd(vo.getOrgnCd());
                List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
                rprtVo.setRprtCagList(cocRprtPrntService.selectRprtCagList(vo));
                rprtVo.setRprtPrsnList(cocRprtPrntService.selectRprtPrsnList(vo));
                rprtVo.setRprtTrnpList(cocRprtPrntService.selectRprtTrnpList(vo));
                rprtVo.setRprtCmpnyList(cocRprtPrntService.selectRprtCmpnyList(vo));
                rprtVo.setRprtEmpList(cocRprtPrntService.selectEmpRprtList(vo));
                rprtVo.setRprtVygVo(cocRprtPrntService.selectRprtVyg(vo));
                rprtVo.setOrgnList(lst);
                BrqOtsList.add(rprtVo);
                DateTimeFormatter date =  DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                LocalDateTime dateTime = LocalDateTime.parse(rprtVo.getFrstRgsrDttm(),date);
                String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                DtLst.add(formattedDate);
            }
            else if( vo.getRprtTpCd().equals("SPS")){
                rprtVo =cocRprtPrntService.selectRprt(vo);
                OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                OrgnNm.setOrgnCd(vo.getOrgnCd());
                List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
                rprtVo.setRprtCagList(cocRprtPrntService.selectRprtCagList(vo));
                rprtVo.setRprtPrsnList(cocRprtPrntService.selectRprtPrsnList(vo));
                rprtVo.setRprtTrnpList(cocRprtPrntService.selectRprtTrnpList(vo));
                rprtVo.setRprtCmpnyList(cocRprtPrntService.selectRprtCmpnyList(vo));
                rprtVo.setRprtEmpList(cocRprtPrntService.selectEmpRprtList(vo));
                rprtVo.setRprtVygVo(cocRprtPrntService.selectRprtVyg(vo));
                rprtVo.setOrgnList(lst);
                BrqSpsList.add(rprtVo);
                DateTimeFormatter date =  DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                LocalDateTime dateTime = LocalDateTime.parse(rprtVo.getFrstRgsrDttm(),date);
                String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                DtLst.add(formattedDate);
            }
        }

        for(CocRprtIncVo vo : paramBRQ2List){
            vo.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
            if( vo.getRprtIncTpCd().equals("ACC")){
                rprtIncVo=cocRprtPrntService.selectRprtInc(vo);
                OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                OrgnNm.setOrgnCd(vo.getOrgnCd());
                List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
                rprtIncVo.setOrgnList(lst);
                BrqAccList.add(rprtIncVo);
                DateTimeFormatter date =  DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                LocalDateTime dateTime = LocalDateTime.parse(rprtIncVo.getFrstRgsrDttm(),date);
                String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                DtLst.add(formattedDate);

            }else if( vo.getRprtIncTpCd().equals("INC")){
                rprtIncVo=cocRprtPrntService.selectRprtInc(vo);
                OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                OrgnNm.setOrgnCd(vo.getOrgnCd());
                List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
                rprtIncVo.setOrgnList(lst);
                BrqIncList.add(rprtIncVo);
                DateTimeFormatter date =  DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                LocalDateTime dateTime = LocalDateTime.parse(rprtIncVo.getFrstRgsrDttm(),date);
                String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                DtLst.add(formattedDate);
            }

        }

        List<String> DtLstFinal = new ArrayList<>(DtLst);
        DtLstFinal.sort(String::compareTo);

        for(int i =0;i<DtLstFinal.size();i++){
            DtVo dtidx= new DtVo();
            dtidx.setBrqDt(DtLstFinal.get(i));
            Dt.add(dtidx);
        }

        if(BrqSpsList == null && BrqAccList== null && BrqOtsList == null && BrqIncList== null){
            throw new BizProcessException("msg.00253");
        }



        parameters.put("BrqSpsList", BrqSpsList);
        parameters.put("BrqOtsList", BrqOtsList);

        parameters.put("BrqAccList", BrqAccList);
        parameters.put("BrqIncList", BrqIncList);
        parameters.put("DtLstFinal", Dt);


       //return  printJasper(parameters);
        byte[] samplePdf = jasperReportsService.exportToCompiledSimplePdf(REPORT_COMPILED_PATH_GLOBAL, parameters);



        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDisposition(ContentDisposition.attachment().filename("BrqReport.pdf").build());

        return new ResponseEntity<>(samplePdf, headers, HttpStatus.OK);

    }

        /**
         * Imprimer le Bilan rapport en HTML Format.
         *
         * @param request CocRprtRequest
         * @return ResponseEntity<>(samplePdf, headers, HttpStatus.OK)
         */
        @PostMapping("/coc/rprt/printReportBrqGlobalHtml")
        public Map<String, PrintVo> printReportBrqGlobalHtml(@RequestBody(required = false) CocRprtRequest request)  {

            Map<String, Object> parameters = new HashMap<>();

            List<CocRprtVo> paramBRQ1List = request.getParamBRQ1List();
            List<CocRprtIncVo> paramBRQ2List = request.getParamBRQ2List();

            List<CocRprtVo>     BrqSpsList = new ArrayList<CocRprtVo>();
            List<CocRprtVo>      BrqOtsList = new ArrayList<CocRprtVo>();

            List<CocRprtIncVo> BrqIncList = new ArrayList<CocRprtIncVo>();
            List<CocRprtIncVo> BrqAccList = new ArrayList<CocRprtIncVo>();
            PrintVo printVo = new PrintVo();
            List<DtVo> Dt = new ArrayList<DtVo>();

            HashSet<String> DtLst = new HashSet<String>();

            CocRprtIncVo rprtIncVo = new CocRprtIncVo();
            CocRprtVo rprtVo = new CocRprtVo();
            ComCstmOrgnVo OrgnNm = new ComCstmOrgnVo();

            for(CocRprtVo vo : paramBRQ1List){
                vo.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                if(vo.getRprtTpCd().equals("OTS")){
                    rprtVo =cocRprtPrntService.selectRprt(vo);
                    OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                    OrgnNm.setOrgnCd(vo.getOrgnCd());
                    List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
                    rprtVo.setRprtCagList(cocRprtPrntService.selectRprtCagList(vo));
                    rprtVo.setRprtPrsnList(cocRprtPrntService.selectRprtPrsnList(vo));
                    rprtVo.setRprtTrnpList(cocRprtPrntService.selectRprtTrnpList(vo));
                    rprtVo.setRprtCmpnyList(cocRprtPrntService.selectRprtCmpnyList(vo));

                    List<CocMgmtEmpVo> cocMgmtEmpVos =  cocRprtPrntService.selectEmpRprtList(vo);
                    for (CocMgmtEmpVo cocMgmtEmpVo : cocMgmtEmpVos) {
                        cocMgmtEmpVo.setPhtoImgeCn(null);

                    }

                    rprtVo.setRprtEmpList(cocMgmtEmpVos);
                    rprtVo.setRprtVygVo(cocRprtPrntService.selectRprtVyg(vo));
                    rprtVo.setOrgnList(lst);
                    BrqOtsList.add(rprtVo);
                    DateTimeFormatter date =  DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                    LocalDateTime dateTime = LocalDateTime.parse(rprtVo.getFrstRgsrDttm(),date);
                    String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    DtLst.add(formattedDate);
                }
                else if( vo.getRprtTpCd().equals("SPS")){
                    rprtVo =cocRprtPrntService.selectRprt(vo);
                    OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                    OrgnNm.setOrgnCd(vo.getOrgnCd());
                    List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
                    rprtVo.setRprtCagList(cocRprtPrntService.selectRprtCagList(vo));
                    rprtVo.setRprtPrsnList(cocRprtPrntService.selectRprtPrsnList(vo));
                    rprtVo.setRprtTrnpList(cocRprtPrntService.selectRprtTrnpList(vo));
                    rprtVo.setRprtCmpnyList(cocRprtPrntService.selectRprtCmpnyList(vo));
                    rprtVo.setRprtEmpList(cocRprtPrntService.selectEmpRprtList(vo));
                    rprtVo.setRprtVygVo(cocRprtPrntService.selectRprtVyg(vo));
                    rprtVo.setOrgnList(lst);
                    BrqSpsList.add(rprtVo);
                    DateTimeFormatter date =  DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                    LocalDateTime dateTime = LocalDateTime.parse(rprtVo.getFrstRgsrDttm(),date);
                    String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    DtLst.add(formattedDate);
                }
            }

            for(CocRprtIncVo vo : paramBRQ2List){
                vo.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                if( vo.getRprtIncTpCd().equals("ACC")){
                    rprtIncVo=cocRprtPrntService.selectRprtInc(vo);
                    OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                    OrgnNm.setOrgnCd(vo.getOrgnCd());
                    List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
                    rprtIncVo.setOrgnList(lst);
                    BrqAccList.add(rprtIncVo);
                    DateTimeFormatter date =  DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                    LocalDateTime dateTime = LocalDateTime.parse(rprtIncVo.getFrstRgsrDttm(),date);
                    String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    DtLst.add(formattedDate);

                }else if( vo.getRprtIncTpCd().equals("INC")){
                    rprtIncVo=cocRprtPrntService.selectRprtInc(vo);
                    OrgnNm.setLangCd(LocaleContextHolder.getLocale().getLanguage().toUpperCase());
                    OrgnNm.setOrgnCd(vo.getOrgnCd());
                    List<ComCstmOrgnVo> lst=cocRprtPrntService.selectCstmOrgn(OrgnNm);
                    rprtIncVo.setOrgnList(lst);
                    BrqIncList.add(rprtIncVo);
                    DateTimeFormatter date =  DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
                    LocalDateTime dateTime = LocalDateTime.parse(rprtIncVo.getFrstRgsrDttm(),date);
                    String formattedDate = dateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
                    DtLst.add(formattedDate);
                }

            }

            List<String> DtLstFinal = new ArrayList<>(DtLst);
            DtLstFinal.sort(String::compareTo);

            for(int i =0;i<DtLstFinal.size();i++){
                DtVo dtidx= new DtVo();
                dtidx.setBrqDt(DtLstFinal.get(i));
                Dt.add(dtidx);
            }


            printVo.setBrqSpsList(BrqSpsList);
            printVo.setBrqOtsList(BrqOtsList);
            printVo.setBrqAccList(BrqAccList);
            printVo.setBrqIncList(BrqIncList);
            printVo.setDt(Dt);
//            parameters.put("BrqSpsList", BrqSpsList);
//            parameters.put("BrqOtsList", BrqOtsList);
//
//            parameters.put("BrqAccList", BrqAccList);
//            parameters.put("BrqIncList", BrqIncList);
//            parameters.put("DtLstFinal", Dt);

           // HttpHeaders headers = new HttpHeaders();
//            headers.setContentType(MediaType.APPLICATION_PDF);
//            headers.setContentDisposition(ContentDisposition.attachment().filename("BrqReport.pdf").build());

            logger.debug(printVo.toString());
//            return Map.of("resultList", printVo);

            return Map.of("printVo" ,printVo);

    }


    @GetMapping(value = "/coc/reports/html", produces = "text/html; charset=UTF-8")
    public ResponseEntity<String> getBuildReportHtml(@RequestBody(required = false) CocReportRequest cocReportRequest) {

        String html =cocRprtPrntService.buildReportHtml();
        return ResponseEntity.ok(html);

        }


    @GetMapping(value = "/dist/{fileName:.+}", produces = "text/plain; charset=UTF-8")
        ResponseEntity<String> getFileContent(@PathVariable String fileName){

            String contentType;
            if(fileName.endsWith(".html")){
                contentType = "text/html; charset=UTF-8";
            }else if(fileName.endsWith(".js")){
                contentType = "text/javascript; charset=UTF-8";
            }else //if(fileName.endsWith(".css"))
                 {
                contentType = "text/css";
            }
            contentType += ";charset=UTF-8";

            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(contentType))
                    .body(cocRprtPrntService.getFileContent(fileName));

    }
    @PostMapping(value = "/coc/reports/html0", produces = "text/html; charset=UTF-8")
    public ResponseEntity<String> buildReportHtml(@RequestBody(required = false) CocReportRequest cocReportRequest) {

            // todo
        if(cocReportRequest == null)
            cocReportRequest = new CocReportRequest();

        if(cocReportRequest.getOrgnCd() == null || cocReportRequest.getOrgnCd().isEmpty())
            cocReportRequest.setOrgnCd("000000000");

        cocReportRequest.setRprtRqstDtTo(null);
        cocReportRequest.setRprtRqstDtFrom(null);

        logger.info("Request to getAllReports : {}", cocReportRequest);



        String html = cocRprtPrntService.buildReportHtml(cocReportRequest);
        return ResponseEntity.ok(html);
    }
}
