package dz.coc9.service.dto;

import lombok.Data;

import java.util.List;

@Data
// dto/EntityMetaDTO.java
public class EntityMetaDTO {
    private Long id;
    private String entityName;
    private String i18nKey;

    private String appName;
    private String projectRoot;

    private String tableName;
    private List<FieldMetaDTO> fields;
    private List<RelationMetaDTO> relations;


}
