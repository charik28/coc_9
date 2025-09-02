package dz.generator.mappers;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 31/08/2025
 */

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface GenericEntityMapper {

    List<Map<String, Object>> findAll(Map<String, Object> params);

    Map<String, Object> findById(Map<String, Object> params);

    int insert(Map<String, Object> params);

    int update(Map<String, Object> params);

    int delete(Map<String, Object> params);

    List<Map<String, Object>> selectAll(@Param("tableName") String tableName,
                                        @Param("limit") Integer limit,
                                        @Param("offset") Integer offset);

    Map<String, Object> selectById(@Param("tableName") String tableName,
                                   @Param("idColumn") String idColumn,
                                   @Param("id") Object id);

    int insertEntity(@Param("tableName") String tableName,
                     @Param("columns") List<String> columns,
                     @Param("values") List<Object> values);

    int updateEntity(@Param("tableName") String tableName,
                     @Param("updates") Map<String, Object> updates,
                     @Param("idColumn") String idColumn,
                     @Param("id") Object id);

    int deleteEntity(@Param("tableName") String tableName,
                     @Param("idColumn") String idColumn,
                     @Param("id") Object id);
}

