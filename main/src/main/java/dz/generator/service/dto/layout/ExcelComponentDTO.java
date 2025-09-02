package dz.generator.service.dto.layout;

/**
    *
    *@project lte-generator
    *@Author Abdessamie Charik on 30/08/2025
*/
    

public class ExcelComponentDTO extends ComponentDTO {
    private String entity;

    public ExcelComponentDTO(String title, String entity) {
        super(title);
        this.entity = entity;
    }

    @Override
    public String toHtml() {
        return "<button class='btn btn-success' onclick='uploadExcel(\"" + entity + "\")'>"
                + "<i class='fas fa-file-excel'></i> " + title + "</button>";
    }
}
