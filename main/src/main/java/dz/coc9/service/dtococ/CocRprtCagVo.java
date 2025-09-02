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

    /** Numéro de référence de cargaison */
    private String cargoReference;

    /** Catégorie des marchandises */
    private String cargoCategory;

    /** Nom exact de la marchandise */
    private String cargoName;

    /** Quantité */
    private BigDecimal quantity;

    /** Unité de mesure */
    private String unit;

    /** Prix unitaire */
    private BigDecimal unitPrice;

    /** Valeur totale des marchandises frauduleuses */
    private BigDecimal totalValue;

    /** Devise monétaire */
    private String currency;

    /** Numéro de référence d'opération */
    private String operationReference;


}
