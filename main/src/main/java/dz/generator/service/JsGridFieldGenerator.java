package dz.generator.service;

import dz.generator.service.dto.EntityMetaDTO;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 31/08/2025
 */

public interface JsGridFieldGenerator {
    String generateJsGridFields(EntityMetaDTO entityMeta);

    String mapType(String javaType);
}
