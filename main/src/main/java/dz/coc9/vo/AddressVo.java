package dz.coc9.vo;

import lombok.Data;

@Data
public class AddressVo {

    private String adresse;
    private VilleVo wilaya;
    private OrgnVo orgn;
}
