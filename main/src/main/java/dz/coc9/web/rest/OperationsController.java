package dz.coc9.web.rest;


import dz.coc9.service.OperationService;
import dz.coc9.service.dto.OperationFilter;
import dz.coc9.vo.OperationVo;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/operations")
@CrossOrigin("*")
public class OperationsController {

    private final OperationService operationsService;

    public OperationsController(OperationService operationsService) {
        this.operationsService = operationsService;
    }

    @GetMapping("/filter")
    public List<OperationVo> getOperations(
            @RequestParam(required = false) String orgnDir,
            @RequestParam(required = false) String orgnDiv,
            @RequestParam(required = false) String orgnDr,
            @RequestParam(required = false) String marchandise,
            @RequestParam(required = false) String wilaya
    ) {
        OperationFilter filter = new OperationFilter();
        filter.setOrgnDir(orgnDir);
        filter.setOrgnDiv(orgnDiv);
        filter.setOrgnDr(orgnDr);
        filter.setMarchandise(marchandise);
        filter.setWilaya(wilaya);
        return operationsService.findAllByFilter(filter);
    }
    @GetMapping
    public List<OperationVo> getOperations(){

        return operationsService.findAll();
    }
}
