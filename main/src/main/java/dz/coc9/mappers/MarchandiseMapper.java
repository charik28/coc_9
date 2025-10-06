package dz.coc9.mappers;

import dz.coc9.vo.MarchandiseVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface MarchandiseMapper {


    public List<MarchandiseVo> findAll(Map<String, Object> map);

}
