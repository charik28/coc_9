package dz.coc9.service;

import dz.coc9.mappers.MarchandiseMapper;
import dz.coc9.vo.MarchandiseVo;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MarchandiseService {


    private final MarchandiseMapper marchandiseMapper;

    public MarchandiseService(MarchandiseMapper marchandiseMapper) {
        this.marchandiseMapper = marchandiseMapper;
    }

    public List<MarchandiseVo> findTypeMarchandisesByLevel(int level){
        Map<String,Object> map = new HashMap<>();
        map.put("level",level);

        return marchandiseMapper.findAllMarchansiseTypes(map);
    }

    public List<MarchandiseVo> findMarchandisesByOperationId(String operationId){
        Map<String,Object> map = new HashMap<>();
        map.put("operationId",operationId);

        return marchandiseMapper.findAll(map);
    }
}
