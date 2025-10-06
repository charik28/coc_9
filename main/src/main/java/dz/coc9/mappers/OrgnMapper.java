package dz.coc9.mappers;

import dz.coc9.vo.OrgnVo;
import dz.coc9.vo.VilleVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface OrgnMapper {

    List<OrgnVo> findAll();
    List<OrgnVo> findAll(HashMap<String,Object> map);
    List<OrgnVo> findAllDrs();
    List<OrgnVo> findSubOrgnByParentCd(@Param("orgnTpCd") String orgnTpCd, @Param("parentCd") String parentCd);


//    List<OrgnVo> findAllSubOrgnByCd(String orgnCd);
}
