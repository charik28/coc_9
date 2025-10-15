package dz.coc9.web.rest;

import dz.coc9.service.interfaces.StatsService;
import dz.coc9.vo.brh.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * REST controller for Douane & Brigades performance statistics
 * (Lutte contre la Contrebande)
 */
@RestController
@RequestMapping("/api/stats")
@CrossOrigin(origins = "*") // allow access for frontend (map/charts)
public class StatsResource {

    private final StatsService statsService;

    @Autowired
    public StatsResource(StatsService statsService) {
        this.statsService = statsService;
    }

    /**
     * 🔹 GET /api/stats/filters
     * Returns lists of available DRs, IDDs, and periodes for filters.
     */
    @GetMapping("/filters")
    public StatsFilterDTO getFilters() {
        return statsService.getFilters();
    }

    /**
     * 🗺️ GET /api/stats/map
     * Returns map data filtered by DR, IDD, and Periode.
     *
     * Example: /api/stats/map?dr=DR1&idd=ID23&periode=2025-10
     */
    @GetMapping("/map")
    public List<StatsMapDTO> getMapData(
            @RequestParam(required = false) String dr,
            @RequestParam(required = false) String idd,
            @RequestParam(required = false) String periode
    ) {
        return statsService.getMapData(dr, idd, periode);
    }

    /**
     * 📊 GET /api/stats/chart
     * Returns aggregated statistics for chart visualization.
     *
     * Example: /api/stats/chart?dr=DR1&idd=ID23&periode=2025-10
     */
    @GetMapping("/chart")
    public List<StatsChartDTO> getChartData(
            @RequestParam(required = false) String dr,
            @RequestParam(required = false) String idd,
            @RequestParam(required = false) String periode
    ) {
        return statsService.getChartData(dr, idd, periode);
    }
}
