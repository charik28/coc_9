package dz.coc9.web.rest;

import dz.coc9.service.VilleService;
import dz.coc9.vo.VilleVo;
import org.apache.coyote.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/ville")
public class VilleRest {


    private final VilleService villeService;

    public VilleRest(VilleService villeService) {
        this.villeService = villeService;
    }

    @GetMapping
    ResponseEntity<List<VilleVo>> getAll() {

        return ResponseEntity.ok(villeService.findAllWilaya())

                ;
    }
}
