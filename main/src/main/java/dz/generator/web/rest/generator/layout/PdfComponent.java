package dz.generator.web.rest.generator.layout;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 30/08/2025
 */


public class PdfComponent implements LayoutElement {

    private String entity;

    public PdfComponent(String entity) {
        this.entity = entity;
    }

    @Override
    public String toHtml() {
        return "<button class=\"btn btn-danger\" onclick=\"printPdf('" + entity + "')\">Export PDF</button>\n";
    }
}

