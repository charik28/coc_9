package dz.coc9.service;

import dz.coc9.mappers.CocReportMapper;
import dz.coc9.service.dtococ.CocReportDto2;
import dz.coc9.service.dtococ.PrintVo;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CocReportService {
    private final CocReportMapper mapper;

    public CocReportService(CocReportMapper mapper) {
        this.mapper = mapper;
    }

    public PrintVo getReports() {
        //return mapper.selectReports();
        return null;
    }
    public PrintVo getReportsTest() {

        PrintVo printVo = new PrintVo();

        ArrayList<CocReportDto2> brqSpsList = new ArrayList<>();

        CocReportDto2 r = new CocReportDto2();
        r.setOrgnNm(": الفرقة المتعددة المهام للجمارك بالبويرة بالتنسيق مع مصلحة الوقاية وأمن الجيش بالبويرة." );
        r.setT2InfNature("حيازة بضاعة محظورة متمثلة في مؤثرات عقلية، أجنبية المنشأ (نيجيريا(، مزدوجة الإمضاء من نوع: بريغابالين 300 ملغ.");
        r.setT3Emplacement(": الطريق السيار شرق – غرب، بالمنطقة المسماة \"الأخضرية\"، أمام ثكنة الجيش الوطني الشعبي بإتجاه الجزائر.     ");

        r.setT4Dttm(": 02/09/2025 على الساعة 22:20 ليلا. ");


        brqSpsList.add(r);

        printVo.setBrqIncList(brqSpsList);
        return printVo;
    }
}