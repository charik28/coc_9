package dz.coc9.service.dto.layout;

/**
 * @project coc9
 * @Author Abdessamie Charik on 30/08/2025
 */


import java.util.ArrayList;
import java.util.List;

public class TabDTO {
    private String id;
    private String title;
    private List<TabDTO> children = new ArrayList<>();
    private List<ComponentDTO> components = new ArrayList<>();

    public TabDTO(String id, String title) {
        this.id = id;
        this.title = title;
    }

    public void addChild(TabDTO child) {
        this.children.add(child);
    }

    public void addComponent(ComponentDTO comp) {
        this.components.add(comp);
    }

    public String toHtml() {
        StringBuilder sb = new StringBuilder();

        // Tab Header
        sb.append("<li class='nav-item'>");
        sb.append("<a class='nav-link' data-toggle='tab' href='#").append(id).append("'>")
                .append(title).append("</a>");
        sb.append("</li>");

        // Tab Content
        sb.append("<div class='tab-pane fade' id='").append(id).append("'>");
        for (ComponentDTO comp : components) {
            sb.append(comp.toHtml());
        }
        for (TabDTO child : children) {
            sb.append(child.toHtml());
        }
        sb.append("</div>");

        return sb.toString();
    }
}
