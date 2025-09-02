package dz.generator.service.impl;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 30/08/2025
 */

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dz.generator.service.ModelScannerService;
import dz.generator.service.dto.EntityMetaDTO;
import dz.generator.service.dto.FieldMetaDTO;
import dz.generator.web.rest.SysMenuController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Implementation of ModelScannerService that parses JHipster .jhipster JSON entity files.
 */
@Service
public class ModelScannerServiceImpl implements ModelScannerService {

    private final ObjectMapper objectMapper = new ObjectMapper();
        private static final Logger log = LoggerFactory.getLogger(ModelScannerServiceImpl.class);

    @Override
    public List<EntityMetaDTO> scanModels(Path jhipsterModelDir,String appName) {
        List<EntityMetaDTO> entities = new ArrayList<>();

        try {
            // Walk through all JSON files in the model folder
            Files.walk(jhipsterModelDir, 1)
                    .filter(path -> path.toString().endsWith(".json"))
                    .forEach(path -> {
                        try {
                            JsonNode root = objectMapper.readTree(path.toFile());

                            String entityName = root.path("name").asText();
                            String tableName  = root.path("entityTableName").asText(entityName.toLowerCase());// todo 

                            EntityMetaDTO entity = new EntityMetaDTO();
                            entity.setEntityName(entityName);
                            entity.setTableName(tableName);

                            // extract fields
                            List<FieldMetaDTO> fields = new ArrayList<>();
                            JsonNode fieldsNode = root.path("fields");

                            if (fieldsNode.isArray()) {
                                for (Iterator<JsonNode> it = fieldsNode.elements(); it.hasNext();) {
                                    JsonNode fieldNode = it.next();
                                    FieldMetaDTO field = new FieldMetaDTO();
                                    field.setFieldName(fieldNode.path("fieldName").asText());
                                    field.setFieldType(fieldNode.path("fieldType").asText());
                                    field.setI18nKey(appName+'.'+ entityName.toLowerCase() + "." + field.getFieldName());
                                    fields.add(field);
                                }

                            }
                            log.info("found {} fields in {} entity" , fields.size() , entityName);
                            
                            entity.setFields(fields);

                            entities.add(entity);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    });
        } catch (IOException e) {
            throw new RuntimeException("Error while scanning JHipster models at " + jhipsterModelDir, e);
        }

        return entities;
    }
}
