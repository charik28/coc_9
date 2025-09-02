package dz.coc9.web.rest.generator.layout;

/**
    *
    *@project coc9
    *@Author Abdessamie Charik on 30/08/2025
*/


import java.util.ArrayList;
import java.util.List;

public class SidebarMenu implements LayoutElement {

    private String title;
    private List<SidebarItem> items = new ArrayList<>();

    public SidebarMenu(String title) {
        this.title = title;
    }

    public void addItem(SidebarItem item) {
        items.add(item);
    }

    @Override
    public String toHtml() {
        StringBuilder sb = new StringBuilder();
        sb.append("<aside class=\"main-sidebar sidebar-dark-primary elevation-4\">\n")
                .append("  <a href=\"#\" class=\"brand-link\">\n")
                .append("    <span class=\"brand-text font-weight-light\">").append(title).append("</span>\n")
                .append("  </a>\n")
                .append("  <div class=\"sidebar\">\n")
                .append("    <nav class=\"mt-2\">\n")
                .append("      <ul class=\"nav nav-pills nav-sidebar flex-column\" role=\"menu\">\n");

        for (SidebarItem item : items) {
            sb.append(item.toHtml());
        }

        sb.append("      </ul>\n")
                .append("    </nav>\n")
                .append("  </div>\n")
                .append("</aside>\n");
        return sb.toString();
    }
}

