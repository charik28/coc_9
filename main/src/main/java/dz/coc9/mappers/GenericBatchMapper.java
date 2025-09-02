package dz.coc9.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface GenericBatchMapper {

    void batchInsert(
            @Param("tableName") String tableName,
            @Param("columns") List<String> columns,
            @Param("rows") List<Map<String, Object>> rows
    );
}