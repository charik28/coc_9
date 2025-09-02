package dz.coc9.service.impl;

/**
 * @project coc9
 * @Author Abdessamie Charik on 30/08/2025
 */
import dz.coc9.service.HomePageGenerator;
import dz.coc9.service.dto.EntityMetaDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

@Slf4j
@Component
public class HomePageGeneratorImpl implements HomePageGenerator {

    private final Path outputDir= Path.of("generated/home");



    public void generate(List<EntityMetaDTO> entities) {

        log.debug("Generating Home Page with {} entities.", entities.size());
        try {
            Path file = outputDir.resolve("index.html");

            log.debug("output file: {}", file);
            StringBuilder sb = new StringBuilder();

            sb.append("<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n")
                    .append("  <meta charset=\"UTF-8\">\n")
                    .append("  <title>Generated Home</title>\n")
                    .append("  <link rel=\"stylesheet\" href=\"/dist/adminlte.min.css\"/>\n")
                    .append("  <link rel=\"stylesheet\" href=\"/dist/jsgrid.min.css\"/>\n")
                    .append("  <script src=\"/dist/jquery.min.js\"></script>\n")
                    .append("  <script src=\"/dist/jsgrid.min.js\"></script>\n")
                    .append("</head>\n<body class=\"hold-transition sidebar-mini\">\n")
                    .append("<div class=\"wrapper\">\n")
                    .append("  <aside class=\"main-sidebar sidebar-dark-primary elevation-4\">\n")
                    .append("    <a href=\"#\" class=\"brand-link\"><span class=\"brand-text\">Generator</span></a>\n")
                    .append("    <div class=\"sidebar\">\n")
                    .append("      <nav class=\"mt-2\">\n")
                    .append("        <ul class=\"nav nav-pills nav-sidebar flex-column\" data-widget=\"treeview\">\n");

            // Sidebar items
            for (EntityMetaDTO entity : entities) {
                sb.append("          <li class=\"nav-item\">\n")
                        .append("            <a class=\"nav-link\" href=\"#")
                        .append(entity.getEntityName().toLowerCase()).append("-tab\" data-toggle=\"tab\">\n")
                        .append("              <i class=\"nav-icon fas fa-database\"></i>\n")
                        .append("              <p>").append(entity.getEntityName()).append("</p>\n")
                        .append("            </a>\n")
                        .append("          </li>\n");
            }

            sb.append("        </ul>\n")
                    .append("      </nav>\n")
                    .append("    </div>\n")
                    .append("  </aside>\n")
                    .append("  <div class=\"content-wrapper\">\n")
                    .append("    <div class=\"tab-content p-3\">\n");

            // Tabs content
            for (EntityMetaDTO entity : entities) {
                sb.append("      <div class=\"tab-pane\" id=\"")
                        .append(entity.getEntityName().toLowerCase()).append("-tab\">\n")
                        .append("        <h2>").append(entity.getEntityName()).append("</h2>\n")
                        .append("        <!-- load fragments -->\n")
                        .append("        <div data-include=\"")
                        .append(entity.getEntityName().toLowerCase()).append("/list.html\"></div>\n")
                        .append("        <div data-include=\"")
                        .append(entity.getEntityName().toLowerCase()).append("/update.html\"></div>\n")
                        .append("        <div data-include=\"")
                        .append(entity.getEntityName().toLowerCase()).append("/excel.html\"></div>\n")
                        .append("        <div data-include=\"")
                        .append(entity.getEntityName().toLowerCase()).append("/pdf.html\"></div>\n")
                        .append("      </div>\n");
            }

            sb.append("    </div>\n")
                    .append("  </div>\n")
                    .append("</div>\n")
                    .append("<script>\n")
                    .append("$(function() {\n")
                    .append("  $('[data-include]').each(function(){\n")
                    .append("    var file = $(this).attr('data-include');\n")
                    .append("    $(this).load(file);\n")
                    .append("  });\n")
                    .append("});\n")
                    .append("</script>\n")
                    .append("</body>\n</html>");

            Files.createDirectories(outputDir);
            Files.writeString(file, sb.toString());

        } catch (IOException e) {
            throw new RuntimeException("Failed to generate home page", e);
        }
    }}
