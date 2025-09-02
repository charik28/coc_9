package dz.coc9.service;

import dz.coc9.service.dto.EntityMetaDTO;

/**
 * @project coc9
 * @Author Abdessamie Charik on 31/08/2025
 */

public interface JsGridFieldGenerator {
    String generateJsGridFields(EntityMetaDTO entityMeta);

    String mapType(String javaType);
}
