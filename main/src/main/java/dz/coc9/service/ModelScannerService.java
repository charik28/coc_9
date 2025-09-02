package dz.coc9.service;

import dz.coc9.service.dto.EntityMetaDTO;

import java.nio.file.Path;
import java.util.List;

/**
 * @project coc9
 * @Author Abdessamie Charik on 30/08/2025
 */

// service/ModelScannerService.java
public interface ModelScannerService {
    List<EntityMetaDTO> scanModels(Path jhipsterModelDir,String appName);
}

