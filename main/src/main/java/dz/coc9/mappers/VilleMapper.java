package dz.coc9.mappers;

import dz.coc9.vo.VilleVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface VilleMapper {

    public VilleVo findVilleById(int id);

    public List<VilleVo> findAllVilles(Map<String, Object> map);

//    public List<VilleVo> findAllVille();
}
