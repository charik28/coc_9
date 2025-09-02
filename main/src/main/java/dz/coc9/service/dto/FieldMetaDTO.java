package dz.coc9.service.dto;

import lombok.Data;

/**
 * @project coc9
 * @Author Abdessamie Charik on 30/08/2025
 */
@Data
// dto/FieldMetaDTO.java
public class FieldMetaDTO {

    private String fieldName;
    private String entityName;
    private String fieldType;
    private Long id;
    private Long entityId;

    private String i18nKey;
    private boolean required;
    private boolean isArray;
    private String fieldsJson;
    private boolean editable; // for jsGrid
    private boolean key;      // is primary key
    // getters/setters
}

