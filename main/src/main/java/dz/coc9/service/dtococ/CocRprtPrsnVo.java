package dz.coc9.service.dtococ;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;

/**
 * @Author GHEZALI Abdelhak
 * Created on 2025/02/25.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CocRprtPrsnVo extends ComDefaultVo {

    @Serial
    private static final long serialVersionUID = 1L;
    private boolean chkSel;
    /** Identifiant de la personne liée au rapport */
    private Long personId;

    /** Type de la personne liée au rapport */
    private String personType;

    /** Prénom de la personne */
    private String firstName;

    /** Nom de famille de la personne */
    private String lastName;

    /** Prénom de la personne (en français) */
    private String firstNameFr;

    /** Nom de famille de la personne (en français) */
    private String lastNameFr;

    /** Type de document d'identification */
    private String documentType;

    /** Numéro du document d'identification */
    private String documentNumber;

    /** Date de délivrance du document */
    private String documentIssueDate;

    /** Agence de délivrance du document */
    private String issuingAgency;

    /** Nationalité de la personne */
    private String nationalityCode;

    /** Adresse de la personne */
    private String address;

    /** Date de naissance */
    private String birthDate;

    /** Date de naissance présumée */
    private String estimatedBirthDate;

    /** Genre (M/F) */
    private String gender;

    /** Numéro de référence du rapport */
    private String reportReference;

    /** Numéro d'identification nationale (NIN) */
    private String nationalIdNumber;

}
