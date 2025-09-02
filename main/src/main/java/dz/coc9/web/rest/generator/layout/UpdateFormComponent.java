package dz.coc9.web.rest.generator.layout;

/**
    *
    *@project coc9
    *@Author Abdessamie Charik on 30/08/2025
*/
    

public class UpdateFormComponent implements LayoutElement {

    private String entity;

    public UpdateFormComponent(String entity) {
        this.entity = entity;
    }

    @Override
    public String toHtml() {
        return "<form id=\"" + entity + "-form\" class=\"form-horizontal\">\n" +
                "  <!-- dynamic fields go here -->\n" +
                "</form>\n";
    }
}

