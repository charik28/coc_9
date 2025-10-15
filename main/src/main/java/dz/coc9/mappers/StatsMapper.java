package dz.coc9.mappers;

import dz.coc9.vo.brh.StatsChartDTO;
import dz.coc9.vo.brh.StatsFilterDTO;
import dz.coc9.vo.brh.StatsMapDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface StatsMapper {

    StatsFilterDTO getFilters();

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
}
