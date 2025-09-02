package dz.coc9.mappers;

import dz.coc9.service.dtococ.CocReportDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CocReportMapper {
    List<CocReportDto> selectReports();
}