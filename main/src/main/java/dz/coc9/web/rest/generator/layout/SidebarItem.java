package dz.coc9.web.rest.generator.layout;

/**
    *
    *@project coc9
    *@Author Abdessamie Charik on 30/08/2025
*/


import java.util.ArrayList;
import java.util.List;

public class SidebarItem implements LayoutElement {

    private String label;
    private String icon;
    private List<Tab> tabs = new ArrayList<>();

    public SidebarItem(String label, String icon) {
        this.label = label;
        this.icon = icon;
    }

    public void addTab(Tab tab) {
        tabs.add(tab);
    }

    @Override
    public String toHtml() {
        StringBuilder sb = new StringBuilder();
        sb.append("<li class=\"nav-item\">\n")
                .append("  <a href=\"#\" class=\"nav-link\">\n")
                .append("    <i class=\"nav-icon ").append(icon).append("\"></i>\n")
                .append("    <p>").append(label).append("</p>\n")
                .append("  </a>\n")
                .append("</li>\n");

        if (!tabs.isEmpty()) {
            sb.append("<div class=\"card card-primary card-outline card-tabs\">\n")
                    .append("  <div class=\"card-header p-0 pt-1 border-bottom-0\">\n")
                    .append("    <ul class=\"nav nav-tabs\" role=\"tablist\">\n");
            for (Tab tab : tabs) {
                sb.append(tab.toHtml());
            }
            sb.append("    </ul>\n")
                    .append("  </div>\n")
                    .append("</div>\n");
        }

        return sb.toString();
    }
}

