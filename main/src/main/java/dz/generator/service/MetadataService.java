package dz.generator.service;

import dz.generator.service.dto.EntityMetaDTO;

import java.util.List;

// service/MetadataService.java
public interface MetadataService {
    void saveEntitiesMetadata(List<EntityMetaDTO> entities);
    List<EntityMetaDTO> getAllEntities();

    List<EntityMetaDTO> findAll();
    EntityMetaDTO findOne(Long id);
    void delete(Long id);
}
