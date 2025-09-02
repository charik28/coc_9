package dz.coc9.web.rest.generator;

import dz.coc9.service.MetadataService;
import dz.coc9.service.dto.EntityMetaDTO;
import dz.coc9.service.impl.GeneratorServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @project coc9
 * @Author Abdessamie Charik on 30/08/2025
 */

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class GeneratorController {

    private final GeneratorServiceImpl generatorService;
    private final MetadataService metaService;

    // 1. Scan JHipster models & save metadata
    @GetMapping("/gen/scan")
    public String scanProject(
        @RequestParam String projectRoot,
                              @RequestParam String appName
                              ) {
        int saved = generatorService.scanAndSave(projectRoot, appName);
        return "Scanned & saved " + saved + " entities.";
    }
    @PostMapping("/gen/scan")
    public String scanProjectPost() //(String project, String appName)
    {
        return scanProject( "C:\\wrk\\assu\\afaris-prod" ,"afaris" );
    }

    // 2. Generate UI fragments
    @PostMapping("/gen/generate")
    public String generateFragments() {
        generatorService.generateFragments();
        return "Fragments generated successfully.";
    }

    // 3. List entities
    @GetMapping("/meta/entities")
    public List<EntityMetaDTO> listEntities() {
        return metaService.findAll();
    }

    // 4. Get entity details
    @GetMapping("/meta/entities/{id}")
    public EntityMetaDTO getEntity(@PathVariable Long id) {
        return metaService.findOne(id);
    }

    // 5. Delete entity
    @DeleteMapping("/meta/entities/{id}")
    public void deleteEntity(@PathVariable Long id) {
        metaService.delete(id);
    }
}
