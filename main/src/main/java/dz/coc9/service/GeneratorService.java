package dz.coc9.service;

import dz.coc9.service.dto.EntityMetaDTO;

import java.util.List;

// service/GeneratorService.java
public interface GeneratorService {
    void generateComponents(EntityMetaDTO entityMeta);
    void generateHomePage(List<EntityMetaDTO> entities);


    int scanAndSave(String projectRoot, String appName);
    void generateFragments();
}
