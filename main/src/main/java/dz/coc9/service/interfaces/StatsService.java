package dz.coc9.service.interfaces;

import dz.coc9.mappers.StatsMapper;
import dz.coc9.vo.brh.StatsChartDTO;
import dz.coc9.vo.brh.StatsFilterDTO;
import dz.coc9.vo.brh.StatsMapDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
 
@Service
public class StatsService {

    private final StatsMapper statsMapper;

    @Autowired
    public StatsService(StatsMapper statsMapper) {
        this.statsMapper = statsMapper;
    }

    
    public StatsFilterDTO getFilters() {
        return statsMapper.getFilters();
    }

    
    public List<StatsMapDTO> getMapData(
            @Param("dr") String dr,
            @Param("idd") String idd,
            @Param("periode") String periode) {
        return statsMapper.getMapData(dr, idd, periode);
    }

    
    public List<StatsChartDTO> getChartData(
            @Param("dr") String dr,
            @Param("idd") String idd,
            @Param("periode") String periode) {
        return statsMapper.getChartData(dr, idd, periode);
    }
}
