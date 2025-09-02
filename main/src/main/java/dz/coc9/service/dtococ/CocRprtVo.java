package dz.coc9.service.dtococ;

import alpass.com.comn.vo.ComDefaultVo;
import alpass.com.cstm.vo.ComCstmOrgnVo;
import alpass.com.file.vo.ComAtchFileUploadVo;
import alpass.ipt.coc.mgmt.emp.vo.CocMgmtEmpVo;
import alpass.ipt.coc.rprt.vo.CocRprtTrnpVo;
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
    private String rprtRefNo;
    /** Code du type de rapport */
    private String rprtTpCd;
    /** Code de l'organisation */
    private String orgnCd;
    /** Information du rapport */
    private String rprtInfNtr;
    /** Date et heure de l'information du rapport */
    private String rprtInfDttm;
    /** Lieu de l'information du rapport */
    private String rprtInfPlc;
    /** Latitude d'infraction */
    private BigDecimal rprtLat;
    /** Longitude d'infraction */
    private BigDecimal rprtLong;
    /** Technique de l'information du rapport */
    private String rprtInfTch;
    /** Numéro de déclaration */
    private String dclrNo;
    /** Procédure de l'information du rapport */
    private String rprtInfPrcd;
    /** Amendement de l'information du rapport */
    private BigDecimal rprtInfAmd;
    /** Code de la devise */
    private String currCd;
    /** Texte juridique de l'information du rapport */
    private String rprtInfJrdqTxt;
    /** Identifiant du fichier joint */
    private String atchFileId;
    /** Valeur totale de la cargaison */
    private BigDecimal cagValTtl;
    /** Numéro de référence de l'opération */
    private String oprnRefNo;


    /** Additional Lists and Objects */

    /** List of cargo-related information */
    private List<CocRprtCagVo> rprtCagList = new ArrayList<>();
    /** List of persons related to the report */
    private List<CocRprtPrsnVo> rprtPrsnList = new ArrayList<>();
    /** List of transport-related details */
    private List<CocRprtTrnpVo> rprtTrnpList = new ArrayList<>();
    /** List of companies involved */
    private List<CocRprtCmpnyVo> rprtCmpnyList = new ArrayList<>();
    /** Voyage-related details */
    private CocRprtVygVo rprtVygVo;

    /** List of employees linked to the report */
    private List<CocMgmtEmpVo> rprtEmpList = new ArrayList<>();

    /** Etat de validation */
    private String vldtStts;
    /** Date de l'infraction(Début) */
    private String rprtRqstDtFrom;
    /** Date de l'infraction(Fin) */
    private String rprtRqstDtTo;
    /** unknown persons Yes / No */
    private String unknownYn;
    /** Utilisé O/N */
    private String useYn;
    /** Supprimé O/N */
    private String delYn;
    /** ID du premier enregistrant */
    private String frstRegstId;
    /** Date et heure du premier enregistrement */
    private String frstRgsrDttm;
    /** ID du modificateur final */
    private String lastChprId;
    /** Date et heure de la modification finale */
    private String lastChgDttm;

    /** search Code d'origine */
    private String srchRprtRefNo;

    /** search Etat de validation  */
    private String srchVldtStts;

    /** search Noture d'information du rapport */
    private String srchRprtInfNtr;

    /** search Code d'origine */
    private String srchOrgnCd;

    /** Code du type de rapport */
    private String srchRprtTpCd;

    /** Liste des pièces jointes  */
    private List<ComAtchFileUploadVo> fileList = new ArrayList<>();

    /** résultat !== 라벨구분코드 ==! */
    private String resultNm;

    /** Liste des organisation parent  */
    private List<ComCstmOrgnVo> orgnList = new ArrayList<>();


    /** modification Yes / No */
    private String chngYn;

    /** motif de  modification */
    private String chngRsn;
}
