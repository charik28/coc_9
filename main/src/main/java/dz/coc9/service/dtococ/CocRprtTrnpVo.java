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
public class CocRprtTrnpVo extends ComDefaultVo {

    @Serial
    private static final long serialVersionUID = 1L;
    private boolean chkSel;
    /** Identifiant du transport */
    private Long transportId;

    /** Code du modèle du véhicule */
    private String modelCode;

    /** Code de la marque du véhicule */
    private String brandCode;

    /** Numéro d'immatriculation */
    private String registrationNumber;

    /** Numéro de châssis */
    private String chassisNumber;

    /** Propriétaire du véhicule */
    private String owner;

    /** Valeur unitaire du véhicule */
    private BigDecimal unitValue;

    /** Devise */
    private String currency;

    /** Numéro de référence du rapport */
    private String reportReference;

    /** Nom du modèle du véhicule */
    private String modelName;

    /** Nom de la marque du véhicule */
    private String brandName;

    /** Type de véhicule */
    private String vehicleType;

}

