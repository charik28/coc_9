package dz.coc9.mappers;

import dz.coc9.service.dto.OperationFilter;
import dz.coc9.vo.OperationVo;
import dz.coc9.vo.PointVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OperationMapper {

    /**
     * Select all operations (basic list for grid).
     */
    List<OperationVo> findAll();

    List<OperationVo> findAllByFilter(@Param("filter") OperationFilter filter);
    /**
     * Select single operation by id.
     */
    OperationVo findById(@Param("id") Long id);

    /**
     * Select points (path) for an operation id.
     * This is used by the collection mapping in XML.
     */
    List<PointVo> selectPointsByOperationId(@Param("id") String rawId);
}
