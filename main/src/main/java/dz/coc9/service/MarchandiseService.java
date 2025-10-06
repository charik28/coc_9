package dz.coc9.service;

import dz.coc9.mappers.MarchandiseMapper;
import dz.coc9.vo.MarchandiseVo;
import io.swagger.v3.oas.annotations.servers.Server;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

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

        return marchandiseMapper.findAll(map);
    }
}
