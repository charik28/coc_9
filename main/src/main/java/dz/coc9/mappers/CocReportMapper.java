package dz.coc9.mappers;

import dz.coc9.service.dtococ.CocReportDto;
import dz.coc9.service.dtococ.CocReportResultDto2;
import dz.coc9.service.dtococ.request.CocReportRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface CocReportMapper {
    ArrayList<CocReportResultDto2> selectRprtList(CocReportRequest cocReportRequest);

    List<CocReportDto> findAllReports(CocReportRequest request);
}