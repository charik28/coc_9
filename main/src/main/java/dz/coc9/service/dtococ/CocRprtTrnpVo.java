package dz.coc9.service.dtococ;

import alpass.com.comn.vo.ComDefaultVo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.math.BigDecimal;

/**
 * @Author GHEZALI Abdelhak
 * Created on 2025/02/25.
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CocRprtTrnpVo extends ComDefaultVo {

    @Serial
    private static final long serialVersionUID = 1L;
    private boolean chkSel;

    /** ID du transport */
    private Long rprtTrnpId;
    /** Code du modèle du transport */
    private String rprtTrnpMdlCd;
    /** Code de la marque du transport */
    private String rprtTrnpBrndCd;
    /** Numéro d'immatriculation du transport */
    private String rprtTrnpRgsrNo;
    /** Numéro de châssis du transport */
    private String rprtTrnpChssNo;
    /** Propriétaire du véhicule */
    private String rprtTrnpOwvh;
    /** Valeur unitaire du transport */
    private BigDecimal rprtTrnpUnitVal;
    /** Code de la devise */
    private String currCd;
    /** Numéro de référence du rapport */
    private String rprtRefNo;
    /** nom modele de  véhicule  */
    private String  vhclMdlNm;
    /** nom marque de  véhicule  */
    private String  vhclBrndNm;
    /** type de  véhicule  */
    private String  rprtTrnpTpCd;

}

