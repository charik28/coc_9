package dz.generator.service.dto.layout;

/**
    *
    *@project lte-generator
    *@Author Abdessamie Charik on 30/08/2025
*/
    

public class FormComponentDTO extends ComponentDTO {
    private String formId;

    public FormComponentDTO(String title, String formId) {
        super(title);
        this.formId = formId;
    }

    @Override
    public String toHtml() {
        return "<div class='card card-success card-outline'>"
                + "<div class='card-header'><h3 class='card-title'>" + title + "</h3></div>"
                + "<div class='card-body'>"
                + "<form id='" + formId + "'>"
                + "<!-- Dynamic fields go here -->"
                + "</form></div></div>";
    }
}
