package dz.generator.web.rest.generator.layout;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 30/08/2025
 */

public class ExcelComponent implements LayoutElement {

    private String entity;

    public ExcelComponent(String entity) {
        this.entity = entity;
    }

    @Override
    public String toHtml() {
        return "<input type=\"file\" id=\"" + entity + "-excel\" class=\"form-control\" />\n";
    }
}

