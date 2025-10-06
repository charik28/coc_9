package dz.coc9.vo;

import lombok.Data;
import java.util.List;

/**
 * Représente une marchandise suspecte, organisée sous forme arborescente.
 */
@Data
public class MarchandiseVo {

    private String id;
    private String nm;
    private String frNm;
    private int groupeLevel;
    private MarchandiseVo parent;
    /** Sous-catégories (ex: armes à feu sous "Armes") */
    private List<MarchandiseVo> sousCategories;
}