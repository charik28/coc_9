package dz.coc9.web.rest;


import dz.coc9.service.interfaces.StatsService;
import dz.coc9.vo.brh.StatsChartDTO;
import dz.coc9.vo.brh.StatsFilterDTO;
import dz.coc9.vo.brh.StatsMapDTO;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/stats")
public class StatsResource {

    private final StatsService statsService;

    public StatsResource(StatsService statsService) {
        this.statsService = statsService;
    }

    @GetMapping("/filters")
    public StatsFilterDTO getFilters() {
        return statsService.getFilters();
    }

    @GetMapping("/map")
    public List<StatsMapDTO> getMapData(
            @RequestParam(required = false) String dr,
            @RequestParam(required = false) String idd,
            @RequestParam(required = false) String periode
    ) {
        return statsService.getMapData(dr, idd, periode);
    }

    @GetMapping("/chart")
    public List<StatsChartDTO> getChartData(
            @RequestParam(required = false) String dr,
            @RequestParam(required = false) String idd,
            @RequestParam(required = false) String periode
    ) {
        return statsService.getChartData(dr, idd, periode);
    }
}
