package dz.coc9.service.dtococ;

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
public class CocRprtCagVo  extends ComDefaultVo {

    @Serial
    private static final long serialVersionUID = 1L;
    private boolean chkSel;

    /** Numéro de réference de cargaison */
    private String rprtCagId;
    /** Nom de la catégorie des marchandises */
    private String rprtCagCtgCd;
    /** Nom exacte de la marchandise */
    private String rprtCagNm;
    /** Quantité */
    private BigDecimal rprtCagQty;
    /** Unité de mesure */
    private String unitCd;
    /** Prix unitaire */
    private BigDecimal rprtCagUnitVal;
    /** Valeur des marchandises frauduleuses */
    private BigDecimal rprtCagTtlVal;
    /** Unité monétaire */
    private String currCd ;
    /** Numéro de réference d'opération */
    private String rprtRefNo;

}
