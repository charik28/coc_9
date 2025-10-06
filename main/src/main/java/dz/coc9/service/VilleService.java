package dz.coc9.service;

import dz.coc9.mappers.VilleMapper;
import dz.coc9.vo.VilleVo;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class VilleService {


    private final VilleMapper villeMapper;

    public VilleService(VilleMapper villeMapper) {
        this.villeMapper = villeMapper;
    }

    public List<VilleVo> findAllWilaya(){
        Map<String,Object> map = new HashMap<>();
        map.put("villeType","Willaya");
        return villeMapper.findAllVilles(map);
    }
    /*
    public List<VilleVo> findAllWilaya(){
        Map<String,Object> map = new HashMap<>();
        map.put("villeType","Willaya");
        return villeMapper.findAllVilles(map);
    }*/
}
