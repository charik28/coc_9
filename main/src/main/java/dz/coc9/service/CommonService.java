package dz.coc9.service;

import dz.coc9.mappers.CommonMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @project afaris-thymleaf2
 * @Author Abdessamie Charik on 29/08/2025
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CommonService {

    private final CommonMapper commonMapper;


    public List<Map<String, Object>> getCommonDataCreyted(String code) {
        String tableName = code;// commonMapper.resolveTableName(code);

        log.debug("tableName: {}", tableName);

        String columns = commonMapper.resolveColumnsByTableName(code);

        log.debug("columns: {}", columns);
        if (tableName == null || columns == null) {
            throw new IllegalArgumentException("Unknown code or missing metadata: " + code);
        }

        return commonMapper.selectCommonData(tableName, columns);
    }
    public List<Map<String, Object>> getCommonData(String tableName) {
        // commonMapper.resolveTableName(tableName);

        log.debug("tableName: {}", tableName);

        String columns = commonMapper.resolveColumnsByTableName(tableName);

        log.debug("columns: {}", columns);
        if (tableName == null || columns == null) {
            throw new IllegalArgumentException("Unknown tableName or missing metadata: " + tableName);
        }

        return commonMapper.selectCommonData(tableName, columns);
    }
}
