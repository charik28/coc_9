package dz.coc9.service.dtococ;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serial;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author GHEZALI Abdelhak
 * Created on 2025/02/25.
 */


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CocRprtVo extends ComDefaultVo {
    @Serial
    private static final long serialVersionUID = 1L;

    private boolean chkSel;
    /** Numéro de référence du rapport */
    private String reportReference;

    /** Type de rapport */
    private String reportType;

    /** Code de l'organisation */
    private String organizationCode;

    /** Nature de l'information du rapport */
    private String reportNature;

    /** Date et heure de l'information du rapport */
    private String reportDateTime;

    /** Lieu de l'information du rapport */
    private String reportLocation;

    /** Latitude de l'infraction */
    private BigDecimal latitude;

    /** Longitude de l'infraction */
    private BigDecimal longitude;

    /** Technique de l'information du rapport */
    private String reportTechnique;

    /** Numéro de déclaration */
    private String declarationNumber;

    /** Procédure de l'information du rapport */
    private String reportProcedure;

    /** Amendement lié au rapport */
    private BigDecimal reportAmendment;

    /** Devise */
    private String currency;

    /** Texte juridique du rapport */
    private String legalText;

    /** Identifiant du fichier joint */
    private String attachmentFileId;

    /** Valeur totale de la cargaison */
    private BigDecimal cargoTotalValue;

    /** Numéro de référence de l'opération */
    private String operationReference;

/* ================================
   Relations
   ================================ */

    /** Informations liées à la cargaison */
    private List<CocRprtCagVo> cargos = new ArrayList<>();

    /** Personnes liées au rapport */
    private List<CocRprtPrsnVo> persons = new ArrayList<>();

    /** Détails liés au transport */
    private List<CocRprtTrnpVo> transports = new ArrayList<>();

    /** Entreprises impliquées */
    private List<CocRprtCmpnyVo> companies = new ArrayList<>();

    /** Détails liés au voyage */
    private CocRprtVygVo voyage;

    /** Employés liés au rapport */
    private List<CocMgmtEmpVo> employees = new ArrayList<>();

    /** Pièces jointes */
    private List<ComAtchFileUploadVo> attachments = new ArrayList<>();

    /** Organisations parentes */
    private List<ComCstmOrgnVo> parentOrganizations = new ArrayList<>();

/* ================================
   Validation & Audit
   ================================ */

    /** Etat de validation */
    private String validationStatus;

    /** Modification (Oui/Non) */
    private String modified;

    /** Motif de modification */
    private String modificationReason;

    /** Inconnus (Oui/Non) */
    private String unknown;

    /** Actif (Oui/Non) */
    private String active;

    /** Supprimé (Oui/Non) */
    private String deleted;

    /** ID du créateur */
    private String createdBy;

    /** Date et heure de création */
    private String createdDateTime;

    /** ID du dernier modificateur */
    private String lastModifiedBy;

    /** Date et heure de dernière modification */
    private String lastModifiedDateTime;

/* ================================
   Search Filters
   ================================ */

    /** Numéro de référence du rapport (recherche) */
    private String searchReportReference;

    /** Etat de validation (recherche) */
    private String searchValidationStatus;

    /** Nature de l'information (recherche) */
    private String searchReportNature;

    /** Code de l'organisation (recherche) */
    private String searchOrganizationCode;

    /** Type de rapport (recherche) */
    private String searchReportType;

    /** Date de l'infraction (Début) */
    private String offenseDateFrom;

    /** Date de l'infraction (Fin) */
    private String offenseDateTo;

/* ================================
   Miscellaneous
   ================================ */

    /** Résultat */
    private String resultName;

}
