package dz.generator.service;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 30/08/2025
 */

import dz.generator.service.dto.EntityMetaDTO;

/**
 * Responsible for generating components (forms, jsGrid, etc.)
 * for a given entity using AdminLTE layout.
 */
public interface EntityComponentGenerator {
    void generate(EntityMetaDTO entityMeta);

    String generateListComponent(EntityMetaDTO entity);

    String generateUpdateForm(EntityMetaDTO entity);

    String generateExcelUpload(EntityMetaDTO entity);

    String generatePdfComponent(EntityMetaDTO entity);

    void generatePlaceHolder(EntityMetaDTO entity);

    String toHtmlPlaceHolderOnly(EntityMetaDTO entity);
}