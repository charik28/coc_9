package dz.coc9.service;

import dz.coc9.mappers.OperationMapper;
import dz.coc9.service.dto.OperationFilter;
import dz.coc9.service.interfaces.IOperationService;
import dz.coc9.vo.OperationGridResponce;
import dz.coc9.vo.OperationVo;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class OperationService implements IOperationService {

    private final OperationMapper mapper;
    private final OrgnService orgnService;
    private final MarchandiseService marchandiseService;

    public OperationService(OperationMapper mapper, OrgnService orgnService, MarchandiseService marchandiseService) { this.mapper = mapper;
        this.orgnService = orgnService;
        this.marchandiseService = marchandiseService;
    }

    public List<OperationVo> findAll() {

        HashMap<String,Object> map  = new HashMap<>();
        map.put("limit" , 100L);
        map.put("offset" , 0L);

        List<OperationVo>  operations =mapper.findAll(map);

        for (OperationVo operation : operations) {
            operation.setOrgn(orgnService.findOrgnByCd(operation.getOrgnCd()));
            operation.setMarchandies(marchandiseService.findMarchandisesByOperationId(operation.getId()));
        }

        return operations;
    }
    public List<OperationVo> findAllByFilter(OperationFilter filter) {
        return mapper.findAllByFilter(filter);
    }
    public OperationVo findById(Long id) { return mapper.findById(id); }

    public List<OperationGridResponce> selectOperationGridResponce(HashMap<String,Object> map) {

        List<OperationGridResponce> operations = mapper.selectOperationGridResponce(map);
        for (OperationGridResponce operation : operations) {
            marchandiseService.findMarchandisesByOperationId(operation.getId());
        }
        return operations;

    }
}
