package dz.coc9.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@Data
public class OrgnFlatDTO {
    private String id;
    private String cd;
    private String nm;
    private String dr;
    private String idd;
    private String brigade;
    private String arNm;
    private String tpCd;
    String lttd,lngt;

    @JsonIgnore
    OrgnFlatDTO subOrgn;

}
