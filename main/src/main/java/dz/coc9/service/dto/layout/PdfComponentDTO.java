package dz.coc9.service.dto.layout;

/**
    *
    *@project coc9
    *@Author Abdessamie Charik on 30/08/2025
*/
    

public class PdfComponentDTO extends ComponentDTO {
    private String entity;

    public PdfComponentDTO(String title, String entity) {
        super(title);
        this.entity = entity;
    }

    @Override
    public String toHtml() {
        return "<button class='btn btn-danger' onclick='printPdf(\"" + entity + "\")'>"
                + "<i class='fas fa-file-pdf'></i> " + title + "</button>";
    }
}
