package dz.coc9.service.dtococ;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @Author Belkassam Med Nazih
 * Created on 2025/02/27.
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CocRprtCmpnyVo extends ComDefaultVo {

    private boolean chkSel;
    /** Identifiant de l'entreprise */
    private String companyId;

    /** Type d’entreprise */
    private String companyType;

    /** Nom de l'entreprise */
    private String companyName;

    /** Adresse de l'établissement */
    private String companyAddress;

    /** Numéro de registre du commerce */
    private String tradeRegisterNumber;

    /** Numéro d'identification fiscale (NIF) */
    private String nif;

    /** Date de délivrance du registre du commerce */
    private String tradeRegisterIssueDate;

    /** Numéro de référence du rapport */
    private String reportReference;

}
