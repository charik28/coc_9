package dz.coc9.vo;


import lombok.Data;

import java.time.Instant;
import java.util.List;

@Data
public class OperationVo {
    private String id;
    OrgnVo orgn;
    private String collaborationType;
    MarchandiseVo marchandie;

    private Double quantite;
    private String unite;
    private Instant date;
    private String time;
    private List<TrajetVo> path;
    private String agent;
}
