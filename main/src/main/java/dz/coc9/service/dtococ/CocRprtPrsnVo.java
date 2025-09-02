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

    /** ID de la personne liée au rapport */
    private Long rprtPrsnId;
    /** Code du type de personne liée au rapport */
    private String rprtPrsnTpCd;
    /** Nom de la personne liée au rapport */
    private String rprtPrsnNm;
    /** Nom de famille de la personne liée au rapport */
    private String rprtPrsnFmnm;

    /** Nom de la personne liée au rapport */
    private String rprtPrsnNmFr;
    /** Nom de famille de la personne liée au rapport */
    private String rprtPrsnFmnmFr;
    /** Type de document d'identification de la personne */
    private String rprtPrsnTypDoc;
    /** Numéro d'enregistrement de la personne */
    private String rprtPrsnRgsrNo;
    /** Date de délivrance du document d'identification */
    private String rprtPrsnDlvDt;
    /** Agence de délivrance du document */
    private String rprtPrsnDlvAgncy;
    /** Code de nationalité de la personne */
    private String rprtPrsnNatCd;
    /** Adresse de la personne */
    private String rprtPrsnAddr;
    /** Date de naissance de la personne */
    private String rprtPrsnBrdy;
    /** Date de naissance  présumée */
    private String rprtPrsntempBrdy;
    /** Genre de la personne (M/F) */
    private String prsnGndr;
    /** Numéro de référence du rapport */
    private String rprtRefNo;
    /** NIN */
    private String rprtPrsnNin;

}
