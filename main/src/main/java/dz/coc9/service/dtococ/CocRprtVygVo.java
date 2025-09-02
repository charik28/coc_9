package dz.coc9.service.dtococ;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @Author Belkassam Med Nazih
 * Created on 2025/02/25.
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CocRprtVygVo extends ComDefaultVo {
    private boolean chkSel;
    /** Identifiant du voyage */
    private String voyageId;

    /** Lieu de départ */
    private String departureLocation;

    /** Lieu d'arrivée */
    private String arrivalLocation;

    /** Moyen de transport utilisé */
    private String transportName;

    /** Date du voyage */
    private String voyageDate;

    /** Numéro de référence du rapport */
    private String reportReference;

    /** Type du voyage */
    private String voyageType;


}
