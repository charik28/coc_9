package dz.coc9.vo;

import lombok.Data;

@Data
public class OrgnVo {
    private String id;
    private String orgnCd;
    private String orgnNm;
    private String orgnType;
    OrgnVo subOrgn;

}
