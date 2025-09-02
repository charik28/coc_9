package dz.generator.service.dto;

import lombok.Data;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 30/08/2025
 */

@Data
public class RelationMetaDTO {
    private String id;
    private String relationType;      // OneToMany, ManyToOne, etc.
    private String entityId;
    private String targetEntity;
    private String i18nKey;
}
