package dz.generator.mappers;

/**
    *
    *@project lte-generator
    *@Author Abdessamie Charik on 30/08/2025
*/


import dz.generator.service.dto.EntityMetaDTO;
import dz.generator.service.dto.FieldMetaDTO;
import dz.generator.service.dto.RelationMetaDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EntityMetaMapper {

    Long findIdByName(String name);

    Long insertEntity(EntityMetaDTO entity);
    Long insertOrUpdateEntity(EntityMetaDTO entity);

    void insertRelations(@Param("entityId") Long entityId,
                         @Param("relations") List<RelationMetaDTO> relations);

    List<EntityMetaDTO> findAllEntitiesWithFields();

    List<EntityMetaDTO> findAll();

    EntityMetaDTO findOne(Long id);
    EntityMetaDTO findByEntityName(String entityName);

    void delete(Long id);

    void deleteFields(Long entityId);

    void deleteRelations(Long entityId);

    void deleteEntitiesByAppName(String appName);

    void linkEntitisWidtFields();
}

