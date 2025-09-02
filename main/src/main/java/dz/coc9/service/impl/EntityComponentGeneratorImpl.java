package dz.coc9.service.impl;

/**
 * @project coc9
 * @Author Abdessamie Charik on 30/08/2025
 */


import dz.coc9.service.EntityComponentGenerator;
import dz.coc9.service.dto.EntityMetaDTO;
import dz.coc9.service.dto.FieldMetaDTO;
import org.springframework.stereotype.Component;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@Component
public class EntityComponentGeneratorImpl implements EntityComponentGenerator {


    private final Path outputDir = Path.of("generated/components");

    public void generate(EntityMetaDTO entity) {
        try {
            Path entityDir = outputDir.resolve(entity.getEntityName().toLowerCase());
            Files.createDirectories(entityDir);

            // jsGrid
            Files.writeString(entityDir.resolve("list.html"), generateListComponent(entity));

            // Update form
            Files.writeString(entityDir.resolve("update.html"), generateUpdateForm(entity));

            // Excel upload
            Files.writeString(entityDir.resolve("excel.html"), generateExcelUpload(entity));

            // PDF export
            Files.writeString(entityDir.resolve("pdf.html"), generatePdfComponent(entity));

        } catch (IOException e) {
            throw new RuntimeException("Failed to generate components for " + entity.getEntityName(), e);
        }
    }

    @Override
    public String generateListComponent(EntityMetaDTO entity) {
        StringBuilder sb = new StringBuilder();
        sb.append("<div class=\"card\">\n")
                .append("  <div class=\"card-header\"><h3 class=\"card-title\">")
                .append(entity.getEntityName()).append(" List</h3></div>\n")
                .append("  <div class=\"card-body\">\n")
                .append("    <div id=\"").append(entity.getEntityName().toLowerCase()).append("-grid\"></div>\n")
                .append("  </div>\n</div>\n")
                .append("<script>\n")
                .append("  $(\"#").append(entity.getEntityName().toLowerCase()).append("-grid\").jsGrid({\n")
                .append("    width: \"100%\",\n")
                .append("    sorting: true,\n")
                .append("    paging: true,\n")
                .append("    autoload: true,\n")
                .append("    controller: {\n")
                .append("      loadData: function() {\n")
                .append("        return fetch('/api/").append(entity.getEntityName().toLowerCase())
                .append("').then(r => r.json());\n")
                .append("      }\n")
                .append("    },\n")
                .append("    fields: [\n");

        for (FieldMetaDTO field : entity.getFields()) {
            sb.append("      { name: '").append(field.getFieldName())
                    .append("', title: '").append(field.getI18nKey())
                    .append("', type: 'text' },\n");
        }

        sb.append("    ]\n")
                .append("  });\n</script>\n");
        return sb.toString();
    }

    @Override
    public String generateUpdateForm(EntityMetaDTO entity) {
        StringBuilder sb = new StringBuilder();
        sb.append("<form id=\"").append(entity.getEntityName().toLowerCase()).append("-form\" class=\"form-horizontal\">\n");
        for (FieldMetaDTO field : entity.getFields()) {
            sb.append("  <div class=\"form-group row\">\n")
                    .append("    <label class=\"col-sm-2 col-form-label\" data-i18n=\"")
                    .append(field.getI18nKey()).append("\">")
                    .append(field.getFieldName()).append("</label>\n")
                    .append("    <div class=\"col-sm-10\">\n")
                    .append("      <input type=\"text\" name=\"").append(field.getFieldName())
                    .append("\" class=\"form-control\" />\n")
                    .append("    </div>\n")
                    .append("  </div>\n");
        }
        sb.append("  <button type=\"submit\" class=\"btn btn-primary\">Save</button>\n")
                .append("</form>\n");
        return sb.toString();
    }

    @Override
    public String generateExcelUpload(EntityMetaDTO entity) {
        return "<div class=\"card\">\n" +
                "  <div class=\"card-header\"><h3 class=\"card-title\">Excel Upload</h3></div>\n" +
                "  <div class=\"card-body\">\n" +
                "    <input type=\"file\" id=\"" + entity.getEntityName().toLowerCase() + "-excel\" />\n" +
                "  </div>\n</div>\n";
    }

    @Override
    public String generatePdfComponent(EntityMetaDTO entity) {
        return "<div class=\"card\">\n" +
                "  <div class=\"card-header\"><h3 class=\"card-title\">PDF Export</h3></div>\n" +
                "  <div class=\"card-body\">\n" +
                "    <button class=\"btn btn-danger\" onclick=\"print" + entity.getEntityName() + "()\">Export PDF</button>\n" +
                "  </div>\n</div>\n" +
                "<script>\n" +
                "function print" + entity.getEntityName() + "() {\n" +
                "  window.open('/api/" + entity.getEntityName().toLowerCase() + "/print/pdf');\n" +
                "}\n" +
                "</script>\n";
    }
    @Override
    public void generatePlaceHolder(EntityMetaDTO entity) {
        try {
            Files.createDirectories(outputDir);
            Path file = outputDir.resolve(entity.getEntityName().toLowerCase() + "-component.html");
            String html = toHtmlPlaceHolderOnly(entity);
            Files.writeString(file, html);
        } catch (IOException e) {
            throw new RuntimeException("Failed to generate component for entity " + entity.getEntityName(), e);
        }
    }

    @Override
    public String toHtmlPlaceHolderOnly(EntityMetaDTO entity) {
        StringBuilder sb = new StringBuilder();
        sb.append("<!-- Component for ").append(entity.getEntityName()).append(" -->\n");
        sb.append("<div class=\"card card-outline card-primary\">\n");
        sb.append("  <div class=\"card-header p-2\">\n");
        sb.append("    <ul class=\"nav nav-pills\">\n");
        sb.append("      <li class=\"nav-item\"><a class=\"nav-link active\" href=\"#")
                .append(entity.getEntityName()).append("-list\" data-toggle=\"tab\">List</a></li>\n");
        sb.append("      <li class=\"nav-item\"><a class=\"nav-link\" href=\"#")
                .append(entity.getEntityName()).append("-update\" data-toggle=\"tab\">Update</a></li>\n");
        sb.append("      <li class=\"nav-item\"><a class=\"nav-link\" href=\"#")
                .append(entity.getEntityName()).append("-pdf\" data-toggle=\"tab\">PDF</a></li>\n");
        sb.append("      <li class=\"nav-item\"><a class=\"nav-link\" href=\"#")
                .append(entity.getEntityName()).append("-excel\" data-toggle=\"tab\">Excel</a></li>\n");
        sb.append("    </ul>\n");
        sb.append("  </div>\n");

        sb.append("  <div class=\"card-body\">\n");
        sb.append("    <div class=\"tab-content\">\n");

        // List Component (jsGrid placeholder)
        sb.append("      <div class=\"tab-pane active\" id=\"").append(entity.getEntityName()).append("-list\">\n");
        sb.append("        <div id=\"jsgrid-").append(entity.getEntityName().toLowerCase()).append("\"></div>\n");
        sb.append("      </div>\n");

        // Update Form
        sb.append("      <div class=\"tab-pane\" id=\"").append(entity.getEntityName()).append("-update\">\n");
        sb.append("        <form id=\"form-").append(entity.getEntityName().toLowerCase()).append("\">\n");

        for (FieldMetaDTO f : entity.getFields()) {
            sb.append("          <div class=\"form-group\">\n");
            sb.append("            <label data-i18n=\"").append(f.getI18nKey()).append("\">")
                    .append(f.getFieldName()).append("</label>\n");
            sb.append("            <input type=\"text\" class=\"form-control\" name=\"")
                    .append(f.getFieldName()).append("\" />\n");
            sb.append("          </div>\n");
        }
        sb.append("          <button type=\"submit\" class=\"btn btn-primary\">Save</button>\n");
        sb.append("        </form>\n");
        sb.append("      </div>\n");

        // PDF placeholder
        sb.append("      <div class=\"tab-pane\" id=\"").append(entity.getEntityName()).append("-pdf\">\n");
        sb.append("        <button class=\"btn btn-outline-danger\">Print PDF</button>\n");
        sb.append("      </div>\n");

        // Excel placeholder
        sb.append("      <div class=\"tab-pane\" id=\"").append(entity.getEntityName()).append("-excel\">\n");
        sb.append("        <input type=\"file\" class=\"form-control-file\" />\n");
        sb.append("      </div>\n");

        sb.append("    </div>\n");
        sb.append("  </div>\n");
        sb.append("</div>\n");
        return sb.toString();
    }
}
