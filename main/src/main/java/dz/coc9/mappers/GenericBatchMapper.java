package dz.coc9.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface GenericBatchMapper {

/*    void batchInsert(
            @Param("tableName") String tableName,
            @Param("columns") List<String> columns,
            @Param("rows") List<Map<String, Object>> rows
    );*/

    void batchInsert(
            @Param("schemasName") String schemasName,
            @Param("tableName") String tableName,
            @Param("fields") List<String> fields,
            @Param("data") Map<String, Object> data
    );

    long countByTableName(
            @Param("tableName") String tableName
    );

    void copyCsvFile(
            @Param("schemasName") String schemasName,
            @Param("tableName") String tableName,
            @Param("filePath") String filePath,
            @Param("fields") List<String> fields
    );
}