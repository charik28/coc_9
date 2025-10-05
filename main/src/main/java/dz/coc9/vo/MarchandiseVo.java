package dz.coc9.vo;

import lombok.Data;
import java.util.List;

/**
 * Représente une marchandise suspecte, organisée sous forme arborescente.
 */
@Data
public class MarchandiseVo {

    /** Identifiant interne (optionnel) */
    private Long id;

    /** Nom ou type de la marchandise */
    private String nom;

    /** Description éventuelle */
    private String description;

    /** Catégorie parent (null si racine) */
    private MarchandiseVo parent;

    /** Sous-catégories (ex: armes à feu sous "Armes") */
    private List<MarchandiseVo> sousCategories;
}