package dz.coc9.service.dtococ;


import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * <PRE>
 * Vo : Réaliser la gestion incidents
 * !==
 * 라벨 관리 Vo
 * ==!
 * </PRE>
 * @author Deboub Halim
 */

@Getter
@Setter
public class CocRprtIncVo extends ComDefaultVo {
    private static final long serialVersionUID = 1L;
    private boolean chkSel;
    /** Numéro de référence de l’incident */
    private String incidentReference;

    /** Numéro de référence de l’incident (recherche) */
    private String searchIncidentReference;

    /** Code d’organisation (recherche) */
    private String searchOrganizationCode;

    /** Code d’organisation */
    private String organizationCode;

    /** Type d’incident */
    private String incidentType;

    /** Type d’incident (recherche) */
    private String searchIncidentType;

    /** Date et heure de l’incident (recherche) */
    private String searchIncidentDateTime;

    /** Date et heure de l’incident */
    private String incidentDateTime;

    /** Titre de l’incident */
    private String incidentTitle;

    /** Description de l’incident */
    private String incidentDescription;

    /** Identifiant du fichier joint */
    private String attachmentFileId;

    /** Numéro de référence d’opération */
    private String operationReference;

    /** Supprimé (O/N) */
    private String deleted;

    /** Utilisé (O/N) */
    private String active;

    /** ID du premier enregistrement */
    private String createdBy;

    /** Date et heure du premier enregistrement */
    private String createdDateTime;

    /** ID du dernier modificateur */
    private String lastModifiedBy;

    /** Date et heure de la dernière modification */
    private String lastModifiedDateTime;

    /** Résultat */
    private String resultName;

    /** Liste des organisations parentes */
    private List<ComCstmOrgnVo> parentOrganizations = new ArrayList<>();

    /** Date de l’infraction (Début) */
    private String offenseDateFrom;

    /** Date de l’infraction (Fin) */
    private String offenseDateTo;

}
