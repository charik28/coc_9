package dz.coc9.service;

import dz.coc9.mappers.CocReportMapper;
import dz.coc9.service.dtococ.*;
import dz.coc9.service.dtococ.request.CocReportRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class CocReportService {
    private final CocReportMapper cocReportMapper;

    public CocReportService(CocReportMapper cocReportMapper) {
        this.cocReportMapper = cocReportMapper;
    }

    public PrintVo getReports(CocReportRequest cocReportRequest) {
        PrintVo printVo = new PrintVo();

        printVo.setT0Dttm("يومي 03 و04 سبتمبر 2025");


        ArrayList<CocReportResultDto2>  cocReportDtos = cocReportMapper.selectRprtList(cocReportRequest);

        log.debug(cocReportDtos.toString());

        printVo.setBrqSpsOtsList(cocReportDtos);


        return printVo;
    }
    public PrintVo getReportsTest() {

        PrintVo printVo = new PrintVo();

        printVo.setT0Dttm("يومي 03 و04 سبتمبر 2025");

        ArrayList<CocReportResultDto2> brqSpsList = new ArrayList<>();
        for (int i = 0; i < 4; i++)
        {
        CocReportResultDto2 r = new CocReportResultDto2();
        r.setOrgnCd("0000000");
        r.setOrgnNm(": الفرقة المتعددة المهام للجمارك بالبويرة بالتنسيق مع مصلحة الوقاية وأمن الجيش بالبويرة.");
        r.setRprtInfNtr("حيازة بضاعة محظورة متمثلة في مؤثرات عقلية، أجنبية المنشأ (نيجيريا(، مزدوجة الإمضاء من نوع: بريغابالين 300 ملغ.");

//        r.setT4Emplacement
        r.setRprtInfPlc(": الطريق السيار شرق – غرب، بالمنطقة المسماة \"الأخضرية\"، أمام ثكنة الجيش الوطني الشعبي بإتجاه الجزائر.     ");
//        r.setT4Dttm
        r.setRprtInfDttm(": 02/09/2025 على الساعة 22:20 ليلا. ");
        r.setT5TypeMarchandise("8850 قرص مهلوس من نوع بريغابالين 300 ملغ.");

        r.setT6ValueMarchandise("لم تحدد."); //todo

        //r.setT6TransportMarchandiseHelper("سيارة من نوع فولكس فاغن، تحمل لوحة الترقيم: 12686-107-16، الرقم التسلسلي في الطراز: WVGZZZ1TZ7W079016، ملك للمدعوة: منسل عائدة. ");
        T6TransportMarchandiseHelper v = new T6TransportMarchandiseHelper();
        v.setVhclType("فولكس فاغن");
        v.setVhclSSI("12686-107-16، ");
        v.setVhclRefNo("WVGZZZ1TZ7W079016");
        v.setPropiritaire("منسل عائدة. ");

        r.setT6TransportMarchandiseHelper(v);

        r.setT6TransportValue("لم تحدد. ");
//        r.setT7DetectionTechnology
        r.setRprtInfTch("سد جمارك مع مصالح الوقاية وأمن الجيش بالبويرة، حيث وجدت الأقراص المهلوسة مخبأة بأحكام بالعجلة الاحتياطية وكمية أخرى تحتي المقاعد الخلفية للسيارة.");

        T7PsnrHelper psnr = new T7PsnrHelper();
        psnr.setNom("منسل صدام");
        psnr.setDttmNaissance(": 28/01/1991 بتبسة");
        psnr.setInfo("متزوج");

        r.setT8Personne(psnr.toString());

//        r.setT10Loitxt
            r.setRprInfJrdqTxt("المواد 21 – 336 من قانون الجمارك ومواد الأمر 05-06 المتعلق بمكافحة التهريب. ");

//        r.setT11ActionsTaken
        r.setRprtIntPRcd(": تحرير محضر الحجز ضد المخالف.");

        if(i==1)
            r.setOrgnNm("المديرية الجهوية للجمارك بورقلة :");
        else if(i==2)
            r.setOrgnNm("المديرية الجهوية للجمارك بالجزائر خارجية :");
        else if(i==3)
            r.setOrgnNm(" المديرية الجهوية للجمارك بتبسة :");
        brqSpsList.add(r);

    }

        printVo.setBrqSpsOtsList(brqSpsList);
        return printVo;
    }
}