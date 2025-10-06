package dz.coc9.mappers;

import dz.coc9.vo.OrgnVo;
import dz.coc9.vo.VilleVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrgnMapper {

    List<OrgnVo> findAll();
    List<OrgnVo> findAllDrs();
    List<OrgnVo> findSubOrgnByParentCd(@Param("orgnTpCd") String orgnTpCd, @Param("parentCd") String parentCd);

    List<VilleVo> findAllWilaya(Map<String,Object> map);

//    List<OrgnVo> findAllSubOrgnByCd(String orgnCd);
}
