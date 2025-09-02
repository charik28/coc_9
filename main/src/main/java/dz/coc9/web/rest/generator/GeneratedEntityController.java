package dz.coc9.web.rest.generator;

/**
 * @project coc9
 * @Author Abdessamie Charik on 31/08/2025
 */


import dz.coc9.mappers.GeneratedEntityMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/generated/{entity}")
@RequiredArgsConstructor
public class GeneratedEntityController {

    private final GeneratedEntityMapper mapper;

    @GetMapping
    public List<Map<String, Object>> findAll(@PathVariable String entity) {
        return mapper.findAll(Map.of("tableName", entity));
    }

    @GetMapping("/{id}")
    public Map<String, Object> findById(@PathVariable String entity, @PathVariable Long id) {
        return mapper.findById(Map.of("tableName", entity, "id", id));
    }

    @PostMapping
    public int insert(@PathVariable String entity, @RequestBody Map<String, Object> body) {
        return mapper.insert(Map.of("tableName", entity, "fields", body.keySet(), "data", body));
    }

    @PutMapping("/{id}")
    public int update(@PathVariable String entity, @PathVariable Long id, @RequestBody Map<String, Object> body) {
        return mapper.update(Map.of("tableName", entity, "id", id, "fields", body.keySet(), "data", body));
    }

    @DeleteMapping("/{id}")
    public int delete(@PathVariable String entity, @PathVariable Long id) {
        return mapper.delete(Map.of("tableName", entity, "id", id));
    }
}

