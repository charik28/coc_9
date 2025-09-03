package dz.coc9.mappers;

import dz.coc9.service.dtococ.CocReportDto;
import dz.coc9.service.dtococ.request.CocReportRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CocReportMapper {
    List<CocReportDto> selectReports();

    List<CocReportDto> findAllReports(CocReportRequest request);
}