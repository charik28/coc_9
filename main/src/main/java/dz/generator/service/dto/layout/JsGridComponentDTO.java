package dz.generator.service.dto.layout;

/**
    *
    *@project lte-generator
    *@Author Abdessamie Charik on 30/08/2025
*/
    

public class JsGridComponentDTO extends ComponentDTO {
    private String entityName;

    public JsGridComponentDTO(String title, String entityName) {
        super(title);
        this.entityName = entityName;
    }

    @Override
    public String toHtml() {
        return "<div class='card card-primary card-outline'>"
                + "<div class='card-header'><h3 class='card-title'>" + title + "</h3></div>"
                + "<div class='card-body'><div id='jsgrid-" + entityName + "'></div></div>"
                + "</div>";
    }
}

