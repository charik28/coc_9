package dz.coc9.vo.brh;

import lombok.Data;

@Data
public class RendementChartDto {
    private String dr;
    private Integer annee;
    private Integer mois;
    private Double totalKif;
    private Double totalCoc;
    private Integer totalPsy;
    private Long totalCig;
    private Double totalTab;
    private Double totalAlc;
    private Double totalCarb;
    // getters/setters
}

