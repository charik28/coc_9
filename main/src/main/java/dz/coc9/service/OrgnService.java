package dz.coc9.service;

import dz.coc9.mappers.OrgnMapper;
import dz.coc9.vo.OrgnVo;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

@Service
public class OrgnService {


    private final OrgnMapper orgnMapper;

    public OrgnService(OrgnMapper orgnMapper) {
        this.orgnMapper = orgnMapper;
    }

   public  List<OrgnVo> findAll(){
        return orgnMapper.findAll();
    }

   public  OrgnVo findOrgnByCd( String orgnCd){

        HashMap<String,Object> map = new HashMap<>();
        map.put("orgnCd",orgnCd);

        var l =orgnMapper.findAll(map);
        if(!l.isEmpty()){
            return l.get(0);
        }
        return  null;
    }
   public  List<OrgnVo> findAllDrs(){
        return orgnMapper.findAllDrs();
    }
   public  List<OrgnVo> findSubOrgnByParentCd(String orgnCd){

        return orgnMapper.findSubOrgnByParentCd("", orgnCd);
    }
   public  List<OrgnVo> findAllInsByParentCd(String parentCd){

        return orgnMapper.findSubOrgnByParentCd("INS",parentCd);
    }
   public  List<OrgnVo> findAllBriByParentCd(String parentCd){

        return orgnMapper.findSubOrgnByParentCd("BRI",parentCd);
    }



}
