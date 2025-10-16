package dz.coc9.vo;


import lombok.Data;

import java.util.List;

@Data
public class OperationVo {
    private String id;

    private String orgnCd;
    OrgnFlatDTO orgn;
    private String collaborationType;
    List<MarchandiseVo> marchandies;

    private Double quantite;
    private String unite;
//    private Instant date;
    private String dateString;
    private String time;
    private List<TrajetVo> path;
    private String agent;
}
