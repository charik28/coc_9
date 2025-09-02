package dz.coc9.service.impl;

/**
 * @project coc9
 * @Author Abdessamie Charik on 31/08/2025
 */

import dz.coc9.mappers.EntityMetaMapper;
import dz.coc9.mappers.FieldMetaMapper;
import dz.coc9.service.MetadataService;
import dz.coc9.service.dto.EntityMetaDTO;
import dz.coc9.service.dto.FieldMetaDTO;
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

