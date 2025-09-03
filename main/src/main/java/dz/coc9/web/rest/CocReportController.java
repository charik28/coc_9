package dz.coc9.web.rest;

import dz.coc9.service.CocReportService;
import dz.coc9.service.dtococ.PrintVo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CocReportController {

    private final CocReportService cocReportService;

    public CocReportController(CocReportService cocReportService) {
        this.cocReportService = cocReportService;
    }

    @GetMapping("/api/coc/reports")
    public PrintVo getAllReports() {
        return cocReportService.getReports();
    }
    @GetMapping("/api/coc/print-test")
    public PrintVo getAllReportsTest() {

        return cocReportService.getReports();
    }
}