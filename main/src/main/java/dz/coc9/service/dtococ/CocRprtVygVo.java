package dz.coc9.service.dtococ;

import alpass.com.comn.vo.ComDefaultVo;
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

    /** Id de le voyage */
    private String rprtVygId;

    /** Lieu de départ */
    private String rprtVygDptr;

    /** Lieu d'arrivée */
    private String rprtVygDstn;

    /** Moyen de transport utilisé */
    private String rprtVygTrnpNm;

    /** date du voyage */
    private String rprtVygDt;

    /** refference number of repport */
    private String rprtRefNo;

    /** type du voyage */
    private String rprtVygTp;



}
