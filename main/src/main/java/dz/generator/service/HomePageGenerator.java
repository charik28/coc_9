package dz.generator.service;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 30/08/2025
 */

import dz.generator.service.dto.EntityMetaDTO;

import java.util.List;

/**
 * Responsible for generating a full AdminLTE Home Page
 * by assembling fragments of entities.
 */
public interface HomePageGenerator {
    void generate(List<EntityMetaDTO> entities);
}