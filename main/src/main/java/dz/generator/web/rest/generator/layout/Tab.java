package dz.generator.web.rest.generator.layout;

/**
    *
    *@project lte-generator
    *@Author Abdessamie Charik on 30/08/2025
*/


import java.util.ArrayList;
import java.util.List;

public class Tab implements LayoutElement {

    private String id;
    private String label;
    private List<LayoutElement> components = new ArrayList<>();

    public Tab(String id, String label) {
        this.id = id;
        this.label = label;
    }

    public void addComponent(LayoutElement component) {
        components.add(component);
    }

    @Override
    public String toHtml() {
        StringBuilder sb = new StringBuilder();
        sb.append("<li class=\"nav-item\">\n")
                .append("  <a class=\"nav-link\" id=\"").append(id).append("-tab\" data-toggle=\"pill\" href=\"#").append(id).append("\" role=\"tab\">\n")
                .append("    ").append(label).append("\n")
                .append("  </a>\n")
                .append("</li>\n");

        sb.append("<div class=\"tab-content\" id=\"").append(id).append("-content\">\n")
                .append("  <div class=\"tab-pane fade\" id=\"").append(id).append("\" role=\"tabpanel\">\n");
        for (LayoutElement comp : components) {
            sb.append(comp.toHtml());
        }
        sb.append("  </div>\n</div>\n");

        return sb.toString();
    }
}
