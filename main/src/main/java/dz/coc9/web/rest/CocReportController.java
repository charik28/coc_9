package dz.coc9.web.rest;

import dz.coc9.service.CocReportService;
import dz.coc9.service.dtococ.CocReportResultDto2;
import dz.coc9.service.dtococ.PrintVo;
import dz.coc9.service.dtococ.request.CocReportRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping
public class CocReportController {

    private final CocReportService cocReportService;

    public CocReportController(CocReportService cocReportService) {
        this.cocReportService = cocReportService;
    }

    @PostMapping("/api/coc/reports")
    public PrintVo getAllReports(@RequestBody(required = false) CocReportRequest cocReportRequest) {
        if(cocReportRequest == null)
            cocReportRequest = new CocReportRequest();

        if(cocReportRequest.getOrgnCd() == null || cocReportRequest.getOrgnCd().isEmpty())
            cocReportRequest.setOrgnCd("000000000");

        cocReportRequest.setRprtRqstDtTo(null);
        cocReportRequest.setRprtRqstDtFrom(null);
        log.info("getAllReports: {}", cocReportRequest);
        return cocReportService.getReports(cocReportRequest);
    }
    @GetMapping("/api/coc/print-test")
    public PrintVo getAllReportsTest() {

        return cocReportService.getReportsTest();
    }

    @PostMapping(value = "api/coc/reports/html", produces = "text/html; charset=UTF-8")
    public ResponseEntity<String> buildReportHtml(@RequestBody(required = false) CocReportRequest cocReportRequest) {

        if(cocReportRequest == null)
            cocReportRequest = new CocReportRequest();

        if(cocReportRequest.getOrgnCd() == null || cocReportRequest.getOrgnCd().isEmpty())
            cocReportRequest.setOrgnCd("000000000");

        cocReportRequest.setRprtRqstDtTo(null);
        cocReportRequest.setRprtRqstDtFrom(null);
        log.info("getAllReports: {}", cocReportRequest);

        PrintVo printVo =cocReportService.getReports(cocReportRequest);

        StringBuilder html = new StringBuilder();

        html.append("<div class='container'>")
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

            int orgnIndex = 1;

             for (CocReportResultDto2 item : printVo.getBrqSpsOtsList()) {
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
                html.append("</div>");



        return ResponseEntity.ok(html.toString());
    }
}