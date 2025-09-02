package dz.generator.web.rest.generator;

/**
 * @project lte-generator
 * @Author Abdessamie Charik on 31/08/2025
 */
/**
 * ✅ With this in place:
 * jsGrid → calls /api/entities/{table} to load data
 * Update form → calls /api/entities/{table}/{idColumn}/{id} with PUT
 * Excel loader → calls /api/entities/{table} with POST in bulk
 * PDF printer → uses same data API
 */

import dz.generator.mappers.GenericEntityMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/entities")
@RequiredArgsConstructor
public class GenericEntityController {

    private final GenericEntityMapper mapper;

    // Fetch all rows (with pagination for jsGrid)
    @GetMapping("/{table}")
    public List<Map<String, Object>> getAll(@PathVariable("table") String table,
                                            @RequestParam(defaultValue = "0") int offset,
                                            @RequestParam(defaultValue = "50") int limit) {
        return mapper.selectAll(table, limit, offset);
    }

    // Fetch one row
    @GetMapping("/{table}/{idColumn}/{id}")
    public Map<String, Object> getOne(@PathVariable String table,
                                      @PathVariable String idColumn,
                                      @PathVariable String id) {
        return mapper.selectById(table, idColumn, id);
    }

    // Insert
    @PostMapping("/{table}")
    public int insert(@PathVariable String table,
                      @RequestBody Map<String, Object> payload) {
        return mapper.insertEntity(
                table,
                payload.keySet().stream().toList(),
                payload.values().stream().toList()
        );
    }

    // Update
    @PutMapping("/{table}/{idColumn}/{id}")
    public int update(@PathVariable String table,
                      @PathVariable String idColumn,
                      @PathVariable String id,
                      @RequestBody Map<String, Object> payload) {
        //
        return mapper.updateEntity( table,payload, idColumn, id);
    }

    // Delete
    @DeleteMapping("/{table}/{idColumn}/{id}")
    public int delete(@PathVariable String table,
                      @PathVariable String idColumn,
                      @PathVariable String id) {
        return mapper.deleteEntity(table, idColumn, id);
    }
}
