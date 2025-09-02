package dz.coc9.mappers;

/**
 * @project coc9
 * @Author Abdessamie Charik on 31/08/2025
 */

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

@Mapper
public interface GeneratedEntityMapper {

    List<Map<String, Object>> findAll(Map<String, Object> params);

    Map<String, Object> findById(Map<String, Object> params);

    int insert(Map<String, Object> params);

    int update(Map<String, Object> params);

    int delete(Map<String, Object> params);
}

