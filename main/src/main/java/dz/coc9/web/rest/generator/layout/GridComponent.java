package dz.coc9.web.rest.generator.layout;

/**
    *
    *@project coc9
    *@Author Abdessamie Charik on 30/08/2025
*/
    
public class GridComponent implements LayoutElement {

    private String entity;

    public GridComponent(String entity) {
        this.entity = entity;
    }

    @Override
    public String toHtml() {
        return "<div id=\"" + entity + "-grid\" class=\"jsgrid\"></div>\n";
    }
}

