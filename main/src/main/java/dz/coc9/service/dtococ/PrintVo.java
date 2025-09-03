package dz.coc9.service.dtococ;

import lombok.Data;

import java.util.ArrayList;

@Data
public class PrintVo {

    String t0Dttm;
    ArrayList<CocReportDto2> brqSpsList  = new ArrayList<>();
    ArrayList<CocReportDto2> brqOtsList  = new ArrayList<>();
    ArrayList<CocReportDto2> brqIncList  = new ArrayList<>();
//    ArrayList<CocReportDto2> brqSpsList  = new ArrayList<>();
}
