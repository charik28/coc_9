package dz.generator.web.rest;

import dz.generator.mappers.EntityMetaMapper;
import dz.generator.service.JsGridFieldGenerator;
import dz.generator.service.dto.EntityMetaDTO;
import dz.generator.service.impl.JsGridFieldGeneratorImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


/**
 * @project lte-generator
 * @Author Abdessamie Charik on 31/08/2025
 */
/**
 * MetaController → serves jsGrid fields dynamically
 * Frontend → loadEntityGrid(entityName) auto-configures jsGrid from backend
 */



@RestController
@RequestMapping("/api/generated/meta")
public class MetaController {

    private final JsGridFieldGenerator fieldGenerator;
    private final EntityMetaMapper entityMetaMapper;

//    private final MetaRepositoryService metaRepositoryService;

    public MetaController(JsGridFieldGenerator fieldGenerator, EntityMetaMapper entityMetaMapper) {
        this.fieldGenerator = fieldGenerator;
        this.entityMetaMapper = entityMetaMapper;
    }

    /**
     * Returns jsGrid fields config for a given entity
     */
    @GetMapping("/{entityName}/fields")
    public String getJsGridFields(@PathVariable String entityName) {

    /*    Optional<EntityMetaDTO> metaOpt = entityMetaMapper.findByEntityName(entityName);
        if (metaOpt.isEmpty()) {
            throw new IllegalArgumentException("Entity not found: " + entityName);
        }*/

        var entityMeta =entityMetaMapper.findByEntityName(entityName);

        return fieldGenerator.generateJsGridFields(entityMeta);
    }

    /**
     * Returns list of all entities metadata
     */
    @GetMapping
    public List<EntityMetaDTO> getAllEntitiesMeta() {
        return entityMetaMapper.findAll();
    }
}

