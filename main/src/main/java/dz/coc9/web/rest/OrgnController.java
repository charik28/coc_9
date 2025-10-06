package dz.coc9.web.rest;

import dz.coc9.service.OrgnService;
import dz.coc9.vo.OrgnVo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/api/orgn")
@RestController
public class OrgnController {

    private final OrgnService orgnService;

    public OrgnController(OrgnService orgnService) {
        this.orgnService = orgnService;
    }

    @GetMapping("/dr")
    public List<OrgnVo> findAllDrs(){
        return orgnService.findAllDrs();
    }
    @GetMapping("/ins")
    public List<OrgnVo> findAllInsByParentCd(@RequestParam(required = false) String parentCd){
        if(parentCd == null){
            parentCd= "501000000";
        }
        return orgnService.findAllInsByParentCd(parentCd);
    }

    @GetMapping("/bri")
    public List<OrgnVo> findAllBriByParentCd(@RequestParam(required = false)  String parentCd){
        if(parentCd == null){
            parentCd= "501000000";
        }
        return orgnService.findAllBriByParentCd(parentCd);
    }

}
