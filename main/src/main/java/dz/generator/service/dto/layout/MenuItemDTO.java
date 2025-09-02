package dz.generator.service.dto.layout;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 30/08/2025
 */


import java.util.ArrayList;
import java.util.List;


public class MenuItemDTO {
    private String label;
    private String icon;
    private String url;
    private List<MenuItemDTO> children = new ArrayList<>();

    public MenuItemDTO(String label, String icon, String url) {
        this.label = label;
        this.icon = icon;
        this.url = url;
    }

    public void addChild(MenuItemDTO child) {
        this.children.add(child);
    }

    public String toHtml() {
        StringBuilder sb = new StringBuilder();
        sb.append("<li class='nav-item'>");
        sb.append("<a href='").append(url != null ? url : "#").append("' class='nav-link'>");
        if (icon != null) {
            sb.append("<i class='nav-icon ").append(icon).append("'></i>");
        }
        sb.append("<p>").append(label);
        if (!children.isEmpty()) {
            sb.append("<i class='right fas fa-angle-left'></i>");
        }
        sb.append("</p></a>");

        if (!children.isEmpty()) {
            sb.append("<ul class='nav nav-treeview'>");
            for (MenuItemDTO child : children) {
                sb.append(child.toHtml());
            }
            sb.append("</ul>");
        }

        sb.append("</li>");
        return sb.toString();
    }
}
