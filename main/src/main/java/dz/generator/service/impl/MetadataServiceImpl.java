package dz.generator.service.impl;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 31/08/2025
 */

import dz.generator.mappers.EntityMetaMapper;
import dz.generator.mappers.FieldMetaMapper;
import dz.generator.service.MetadataService;
import dz.generator.service.dto.EntityMetaDTO;
import dz.generator.service.dto.FieldMetaDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MetadataServiceImpl implements MetadataService {

    private final EntityMetaMapper entityMetaMapper;
    private final FieldMetaMapper fieldMetaMapper;

    public MetadataServiceImpl(EntityMetaMapper entityMetaMapper, FieldMetaMapper fieldMetaMapper) {
        this.entityMetaMapper = entityMetaMapper;
        this.fieldMetaMapper = fieldMetaMapper;
    }

    @Transactional
    @Override
    public void saveEntitiesMetadata(List<EntityMetaDTO> entities) {

        deleteEntitiesByAppName(entities.get(0).getAppName());

        for (EntityMetaDTO entity : entities) {
            if (entity.getId() == null) {
                Long entityId=entityMetaMapper.insertEntity(entity);

                for(FieldMetaDTO field : entity.getFields()) {
                    field.setEntityId(entityId);
                    field.setEntityName(entity.getEntityName());
                    fieldMetaMapper.insertField(field);
                }


            } else {
                entityMetaMapper.insertOrUpdateEntity(entity);
            }
        }

        entityMetaMapper.linkEntitisWidtFields();

    }

    private void deleteEntitiesByAppName(String appName) {
        entityMetaMapper.deleteEntitiesByAppName(appName);
    }

    @Override
    public List<EntityMetaDTO> getAllEntities() {
        return entityMetaMapper.findAll();
    }

    @Override
    public List<EntityMetaDTO> findAll() {
        return entityMetaMapper.findAll();
    }

    @Override
    public EntityMetaDTO findOne(Long id) {
        return entityMetaMapper.findOne(id);
    }

    @Override
    public void delete(Long id) {
        entityMetaMapper.delete(id);
    }
}

