package dz.coc9.mappers;

import dz.coc9.vo.OrgnFlatDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface OrgnMapper {

    List<OrgnFlatDTO> findAll();
    List<OrgnFlatDTO> findAll(HashMap<String,Object> map);
    List<OrgnFlatDTO> findAllDrs();
    List<OrgnFlatDTO> findSubOrgnByParentCd(@Param("orgnTpCd") String orgnTpCd, @Param("parentCd") String parentCd);

    List<OrgnFlatDTO> getHierarchy();


//    List<OrgnFlatDTO> findAllSubOrgnByCd(String orgnCd);
}
