package dz.coc9.service;

import dz.coc9.mappers.OperationMapper;
import dz.coc9.service.dto.OperationFilter;
import dz.coc9.service.interfaces.IOperationService;
import dz.coc9.vo.OperationVo;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class OperationService implements IOperationService {

    private final OperationMapper mapper;
    public OperationService(OperationMapper mapper) { this.mapper = mapper; }
    public List<OperationVo> findAll() {

        HashMap<String,Object> map  = new HashMap<>();
        map.put("limit" , 100);
        map.put("offset" , 0);
        return mapper.findAll(map);
    }
    public List<OperationVo> findAllByFilter(OperationFilter filter) {
        return mapper.findAllByFilter(filter);
    }
    public OperationVo findById(Long id) { return mapper.findById(id); }
}
