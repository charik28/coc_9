package dz.coc9.service.impl;

import dz.coc9.service.JsGridFieldGenerator;

/**
 * @project coc9
 * @Author Abdessamie Charik on 31/08/2025
 */


import com.fasterxml.jackson.databind.ObjectMapper;
import dz.coc9.service.dto.EntityMetaDTO;
import dz.coc9.service.dto.FieldMetaDTO;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class JsGridFieldGeneratorImpl implements JsGridFieldGenerator {

    private final ObjectMapper mapper = new ObjectMapper();

    @Override
    public String generateJsGridFields(EntityMetaDTO entityMeta) {
        List<Map<String, Object>> fields = new ArrayList<>();

        for (FieldMetaDTO field : entityMeta.getFields()) {
            Map<String, Object> fieldMap = new LinkedHashMap<>();
            fieldMap.put("name", field.getFieldName());

            // jsGrid expects type: "text", "number", "date"
            String jsType = mapType(field.getFieldType());
            fieldMap.put("type", jsType);

            if ("number".equals(jsType)) {
                fieldMap.put("width", 50);
            } else {
                fieldMap.put("width", 150);
            }

            if (field.isKey()) {
                fieldMap.put("editing", false);
            }

            fields.add(fieldMap);
        }

        // add control column
        fields.add(Map.of("type", "control"));

        try {
            return mapper.writerWithDefaultPrettyPrinter().writeValueAsString(fields);
        } catch (Exception e) {
            throw new RuntimeException("Failed to generate jsGrid fields JSON", e);
        }
    }

    @Override
    public String mapType(String javaType) {
      // todo complete this list
        switch (javaType.toLowerCase()) {
            case "int":
            case "integer":
            case "long":
            case "double":
            case "float":
            case "bigdecimal":
                return "number";
            case "date":
            case "localdate":
            case "localdatetime":
                return "date";
            default:
                return "text";
        }
    }
}

