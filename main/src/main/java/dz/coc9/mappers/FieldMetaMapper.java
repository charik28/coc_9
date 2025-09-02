package dz.coc9.mappers;

import dz.coc9.service.dto.FieldMetaDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @project coc9
 * @Author Abdessamie Charik on 30/08/2025
 */
@Mapper
public interface FieldMetaMapper {

    void insertField(FieldMetaDTO field);
    void insertField2(FieldMetaDTO field);
    void insertOrUpdateField(FieldMetaDTO field);
    List<FieldMetaDTO> findFieldsByEntityId(Long entityId);

    void insertFields(@Param("entityId") Long entityId,
                      @Param("fields") List<FieldMetaDTO> fields);


    void deleteFieldsByEntityId(Long entityId);

}
