package dz.coc9.mappers;


import dz.coc9.vo.brh.RendementChartDto;
import dz.coc9.vo.brh.RendementFilterDto;
import dz.coc9.vo.brh.RendementMapDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.time.LocalDate;
import java.util.List;

@Mapper
public interface RendementMapper {
    List<RendementMapDto> selectRendementMap(
            @Param("dr") String dr,
            @Param("idd") String idd,
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate
    );

    List<RendementChartDto> selectRendementStats(
            @Param("dr") String dr,
            @Param("idd") String idd,
            @Param("annee") Integer annee
    );

    List<RendementFilterDto> selectDistinctFilters();
}