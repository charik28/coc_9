package dz.coc9.web.rest;

import dz.coc9.service.CocReportService;
import dz.coc9.service.dtococ.CocReportDto;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CocReportController {

    private final CocReportService service;

    public CocReportController(CocReportService service) {
        this.service = service;
    }

    @GetMapping("/api/coc/reports")
    public List<CocReportDto> getAllReports() {
        return service.getReports();
    }
}