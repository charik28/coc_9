package dz.coc9.service;

import dz.coc9.mappers.CocReportMapper;
import dz.coc9.service.dtococ.CocReportDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CocReportService {
    private final CocReportMapper mapper;

    public CocReportService(CocReportMapper mapper) {
        this.mapper = mapper;
    }

    public List<CocReportDto> getReports() {
        return mapper.selectReports();
    }
}