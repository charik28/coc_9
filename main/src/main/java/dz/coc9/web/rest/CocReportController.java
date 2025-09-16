package dz.coc9.web.rest;

import dz.coc9.service.CocReportService;
import dz.coc9.service.dtococ.PrintVo;
import dz.coc9.service.dtococ.request.CocReportRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class CocReportController {

    private final CocReportService cocReportService;

    public CocReportController(CocReportService cocReportService) {
        this.cocReportService = cocReportService;
    }

    @GetMapping("/api/coc/reports")
    public PrintVo getAllReports(@RequestBody(required = false) CocReportRequest cocReportRequest) {
        if(cocReportRequest == null)
            cocReportRequest = new CocReportRequest();

        cocReportRequest.setOrgnCd("000000000");

        return cocReportService.getReports(cocReportRequest);
    }
    @GetMapping("/api/coc/print-test")
    public PrintVo getAllReportsTest() {

        return cocReportService.getReportsTest();
    }
}