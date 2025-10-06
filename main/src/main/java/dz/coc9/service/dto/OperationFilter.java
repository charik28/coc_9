package dz.coc9.service.dto;

import lombok.Data;

import java.time.Instant;

@Data
public class OperationFilter {
    private String orgnDir;
    private String orgnDiv;
    private String orgnDr;
    private String marchandise;
    private String wilaya;
    private Instant dateFrom;
    private Instant dateTo;
}
