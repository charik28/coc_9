package dz.coc9.mappers;

import dz.coc9.service.dto.DynamicStatsDTO;
import dz.coc9.vo.brh.StatsChartDTO;
import dz.coc9.vo.brh.StatsFilterDTO;
import dz.coc9.vo.brh.StatsMapDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

@Mapper
public interface StatsMapper {

    List<StatsFilterDTO> getFilters();

    List<StatsMapDTO> getMapData(
            @Param("dr") String dr,
            @Param("idd") String idd,
            @Param("periode") String periode
    );

    List<StatsChartDTO> getChartData(
            @Param("dr") String dr,
            @Param("idd") String idd,
            @Param("periode") String periode
    );

    List<DynamicStatsDTO> selectDynamicStats(Map<String, Object> params);
}
