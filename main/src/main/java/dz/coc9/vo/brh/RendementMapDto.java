package dz.coc9.vo.brh;

import lombok.Data;

import java.time.LocalDate;
@Data

public class RendementMapDto {
    private Long id;
    private String dr;
    private String idd;
    private String brigade;
    private String wilaya;
    private Double longitude;
    private Double latitude;
    private LocalDate date;
    private Double kifKg;
    private Double cocKg;
    private Integer psyCompr;
    private Long cigU;
    private Double tabKg;
    private Double alcL;
    private Double carbL;
    // getters/setters
}
