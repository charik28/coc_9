package dz.coc9.web.rest;

import dz.coc9.service.MarchandiseService;
import dz.coc9.vo.MarchandiseVo;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/api/marchandise")
@RestController
public class MarchandiseRest {


    private final MarchandiseService marchandiseService;

    public MarchandiseRest(MarchandiseService marchandiseService) {
        this.marchandiseService = marchandiseService;
    }

    @GetMapping("/groupe")
    public ResponseEntity<List<MarchandiseVo>> findGroupsByLevel(){

        return this.findGroupsByLevel(1);
    }

    @GetMapping("/groupe/{level}")
    public ResponseEntity<List<MarchandiseVo>> findGroupsByLevel(@PathVariable(required = true) int level){

        return ResponseEntity.ok(marchandiseService.findTypeMarchandisesByLevel(level));
    }
}
