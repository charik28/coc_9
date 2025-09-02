package dz.generator.service;

import dz.generator.service.dto.EntityMetaDTO;

import java.nio.file.Path;
import java.util.List;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 30/08/2025
 */

// service/ModelScannerService.java
public interface ModelScannerService {
    List<EntityMetaDTO> scanModels(Path jhipsterModelDir,String appName);
}

