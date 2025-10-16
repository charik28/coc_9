package dz.coc9.service.dto;

import lombok.Data;

@Data
public class DynamicStatsDTO {
    private String label;
    private Double value;
    private String dr;
    private String idd;
    private String br;
    private String periode;
    private Double kifKg;
    private Double carburantL;
    private Double alcoolL;
    private Double tabacKg;
}
