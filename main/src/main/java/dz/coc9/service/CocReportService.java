package dz.coc9.service;

import dz.coc9.mappers.CocReportMapper;
import dz.coc9.service.dtococ.CocReportDto2;
import dz.coc9.service.dtococ.PrintVo;
import dz.coc9.service.dtococ.T6TransportMarchandiseHelper;
import dz.coc9.service.dtococ.T7PsnrHelper;
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
        r.setT4Emplacement(": الطريق السيار شرق – غرب، بالمنطقة المسماة \"الأخضرية\"، أمام ثكنة الجيش الوطني الشعبي بإتجاه الجزائر.     ");
        r.setT4Dttm(": 02/09/2025 على الساعة 22:20 ليلا. ");
        r.setT5TypeMarchandise("8850 قرص مهلوس من نوع بريغابالين 300 ملغ.");

        r.setT6ValueMarchandise("لم تحدد."); //todo

        //r.setT6TransportMarchandiseHelper("سيارة من نوع فولكس فاغن، تحمل لوحة الترقيم: 12686-107-16، الرقم التسلسلي في الطراز: WVGZZZ1TZ7W079016، ملك للمدعوة: منسل عائدة. ");
        T6TransportMarchandiseHelper v=new T6TransportMarchandiseHelper();
                v.setVhclType("فولكس فاغن");
                v.setVhclSSI("12686-107-16، ");
                v.setVhclRefNo("WVGZZZ1TZ7W079016");
                v.setPropiritaire("منسل عائدة. ");

        r.setT6TransportMarchandiseHelper(v);
        r.setT7DetectionTechnology("سد جمارك مع مصالح الوقاية وأمن الجيش بالبويرة، حيث وجدت الأقراص المهلوسة مخبأة بأحكام بالعجلة الاحتياطية وكمية أخرى تحتي المقاعد الخلفية للسيارة.");

        T7PsnrHelper psnr=new T7PsnrHelper();
        psnr.setNom("منسل صدام");
        psnr.setDttmNaissance(": 28/01/1991 بتبسة");
        psnr.setInfo("متزوج");

        r.setT8Personne(psnr.toString());

        r.setT10Loitxt("المواد 21 – 336 من قانون الجمارك ومواد الأمر 05-06 المتعلق بمكافحة التهريب. ");

        r.setT11ActionsTaken(": تحرير محضر الحجز ضد المخالف.");
        brqSpsList.add(r);

        printVo.setBrqIncList(brqSpsList);
        return printVo;
    }
}