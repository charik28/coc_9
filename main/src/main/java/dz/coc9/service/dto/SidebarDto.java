package dz.coc9.service.dto;

import java.util.Comparator;
import java.util.List;

/**
 * @project afaris-thymleaf2
 * @Author Abdessamie Charik on 29/08/2025
 */
/*
Avantages de cette version

Séparation claire des rôles :

SidebarDto = structure d’affichage.

SysMenuDto = données métier spécifiques
 */
public class SidebarDto {

    private Long id;

    private String url;                 // Menu navigation URL
    private String title;               // Menu title

    private String iconName;            // Menu icon (optional)
    private Long parentMenuId;          // Parent for hierarchy
    private Integer ordre;              // Ordering

    // Submenus (recursive relationship)
    private List<SidebarDto> subMenus;
    public Integer getOrdre() {
        return ordre;
    }

    public void setOrdre(Integer ordre) {
        this.ordre = ordre;
    }

    public void setSubMenus(List<SidebarDto> subMenus) {
        this.subMenus = subMenus;
    }

    // --- utilitaire : tri récursif par ordre si besoin
    public void sortRecursively(Comparator<SidebarDto> comparator) {
        subMenus.sort(comparator);
        subMenus.forEach(m -> m.sortRecursively(comparator));
    }


    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getParentMenuId() {
        return parentMenuId;
    }

    public void setParentMenuId(Long parentMenuId) {
        this.parentMenuId = parentMenuId;
    }



    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIconName() {
        return iconName;
    }

    public void setIconName(String iconName) {
        this.iconName = iconName;
    }

    public List<SidebarDto> getSubMenus() {
        return subMenus;
    }


}
