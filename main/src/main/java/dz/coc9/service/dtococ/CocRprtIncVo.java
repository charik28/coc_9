package dz.coc9.service.dtococ;


import alpass.com.comn.vo.ComDefaultVo;
import alpass.com.cstm.vo.ComCstmOrgnVo;
import alpass.com.file.vo.ComAtchFileUploadVo;
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


    /** innccedent refrence number  */
    private String rprtIncRefNo;
    /** innccedent refrence number  */
    private String srchRprtIncRefNo;
    /** */
    private String srchOrgnCd;
    /** organ code  */
    private String orgnCd;

    /** report inncedent type    */
    private String rprtIncTpCd;

    /** report inncedent type    */
    private String srchRprtIncTpCd;

    /** search report inncedent date  */
    private String srchrprtIncDttm;

    /** report inncedent date    */
    private String  rprtIncDttm;

    /** title of inccedent    */
    private String  rprtIncTtl;

    /** Description of inccedent    */
    private String rprtIncDesc;

    /** atch file   */
    private String atchFileId;

    /** operation Reference number   */
    private String oprnRefNo;

    /** Supprimé O/N  */
    private String delYn;

    /** Supprimé O/N  */
    private String useYn;

    /** ID de la première personne enregistrante  */
    private String frstRegstId;

    /** Date et heure du premier enregistrement  */
    private String frstRgsrDttm;

    /** ID du modificateur final  */
    private String lastChprId;

    /** Date et heure de la modification finale  */
    private String lastChgDttm;

    /** Liste des pièces jointes  */
    private List<ComAtchFileUploadVo> fileList = new ArrayList<>();

    /** résultat */
    private String resultNm;

    /** Liste des organisation parent  */
    private List<ComCstmOrgnVo> orgnList = new ArrayList<>();

    /** Date de l'infraction(Début) */
    private String rprtRqstDtFrom;
    /** Date de l'infraction(Fin) */
    private String rprtRqstDtTo;

}
