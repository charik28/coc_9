package dz.coc9.service.dtococ;

import alpass.com.comn.vo.ComDefaultVo;
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

    /** Id d'entreprise */
    private String rprtCmpnyId;

    /** Type d’entreprise	*/
    private String rprtCmpnyTpCd;

    /** Nom de l'entreprise */
    private String rprtCmpnyNm;

    /** Adresse de l'établissement */
    private String rprtCmpnyAddr;

    /** Numéro de registre du commerce */
    private String rprtCmpnyCmrcRegsNo;

    /** NIF	*/
    private String rprtCmpnyNifNo;

    /** Date de délivrance du registre du commerce	*/
    private String rprtCmpnyDlvDt;
    /** Numéro de référence du rapport */
    private String rprtRefNo;

}
