package dz.generator.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @project afaris-thymleaf2
 * @Author Abdessamie Charik on 29/08/2025
 */

@Mapper
public interface CommonMapper {

    String resolveTableName(@Param("code") String code);

    String resolveColumns(@Param("code") String code);

    String resolveColumnsByTableName(@Param("tableName") String tableName);

    List<Map<String, Object>> selectCommonData(@Param("tableName") String tableName, @Param("columns") String columns);

    List<Map<String, Object>> selectPopupData2(@Param("tableName") String tableName, @Param("columns") String columns);


}
