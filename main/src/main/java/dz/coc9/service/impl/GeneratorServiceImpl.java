package dz.coc9.service.impl;

/**
 * @project coc9
 * @Author Abdessamie Charik on 30/08/2025
 */


/**
 * Implementation of GeneratorService.
 * Responsible for orchestrating scanning, saving metadata,
 * and generating components + home page.
 */

import dz.coc9.mappers.EntityMetaMapper;
import dz.coc9.mappers.FieldMetaMapper;
import dz.coc9.service.EntityComponentGenerator;
import dz.coc9.service.GeneratorService;
import dz.coc9.service.HomePageGenerator;
import dz.coc9.service.dto.EntityMetaDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.nio.file.Path;
import java.util.List;

/**
 * Main generator service implementation.
 */
@Service
@Slf4j
public class GeneratorServiceImpl implements GeneratorService {

    private final ModelScannerServiceImpl modelScannerService;
    private final EntityMetaMapper entityMetaMapper;
    private final EntityComponentGenerator componentGenerator;
    private final HomePageGenerator homePageGenerator;
    private final FieldMetaMapper fieldMetaMapper;
    private final MetadataServiceImpl metadataServiceImpl;

    public GeneratorServiceImpl(
            ModelScannerServiceImpl modelScannerService,
            EntityMetaMapper entityMetaMapper,
            EntityComponentGenerator componentGenerator,
            HomePageGenerator homePageGenerator,
            FieldMetaMapper fieldMetaMapper, MetadataServiceImpl metadataServiceImpl) {
        this.modelScannerService = modelScannerService;
        this.entityMetaMapper = entityMetaMapper;
        this.componentGenerator = componentGenerator;
        this.homePageGenerator = homePageGenerator;
        this.fieldMetaMapper = fieldMetaMapper;
        this.metadataServiceImpl = metadataServiceImpl;
    }

    @Override
    public void generateComponents(EntityMetaDTO entityMeta) {

        componentGenerator.generateListComponent(entityMeta);
        componentGenerator.generateUpdateForm(entityMeta);
        componentGenerator.generatePdfComponent(entityMeta);
        componentGenerator.generateExcelUpload(entityMeta);

        // todo persist into filesystem later if needed
    }

    @Override
    public void generateHomePage(List<EntityMetaDTO> entities) {
        // TODO: Combine all fragments into a single AdminLTE-based home page
        log.info("Generating Home Page with {} entities.", entities.size());

        //String html =
         homePageGenerator.generate(entities);//generateHomeLayout
        // For now: save it into ./generated/home.html
       // homePageGenerator.saveToFile(html, Path.of("generated", "home.html"));
    }

    @Override
    @Transactional
    public int scanAndSave(String projectRoot, String appName) {
        Path jhipsterModelDir = Path.of(projectRoot, ".jhipster");

        List<EntityMetaDTO> entities = modelScannerService.scanModels(jhipsterModelDir,appName);

        for (EntityMetaDTO e : entities) {
            e.setAppName(appName);
            e.setProjectRoot(projectRoot);

        }
        log.info("found {} entity in {} " , entities.size() , appName);

        metadataServiceImpl.saveEntitiesMetadata(entities);

        return entities.size();
    }

    @Override
    @Transactional
    public void generateFragments() {
        List<EntityMetaDTO> entities = entityMetaMapper.findAllEntitiesWithFields();
        for (EntityMetaDTO entity : entities) {
            generateComponents(entity);
        }
        generateHomePage(entities);
    }
}
