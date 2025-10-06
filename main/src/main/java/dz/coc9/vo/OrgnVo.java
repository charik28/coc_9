package dz.coc9.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@Data
public class OrgnVo {
    private String id;
    private String cd;
    private String nm;
    private String arNm;
    private String tpCd;
    String lttd,lngt;

    @JsonIgnore
    OrgnVo subOrgn;

}
