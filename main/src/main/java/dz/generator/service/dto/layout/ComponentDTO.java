package dz.generator.service.dto.layout;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 30/08/2025
 */

public abstract class ComponentDTO {
    protected String title;

    public ComponentDTO(String title) {
        this.title = title;
    }

    public abstract String toHtml();
}
