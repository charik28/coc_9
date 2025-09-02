package dz.coc9.service.db;

import dz.coc9.mappers.GenericBatchMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.file.Path;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
public class CsvBatchLoaderService {

    private final GenericBatchMapper mapper;

    public CsvBatchLoaderService(GenericBatchMapper mapper) {
        this.mapper = mapper;
    }

    @Transactional
    public void loadCsvFolder(String folderPath) throws Exception {
        File folder = new File(folderPath);
        if (!folder.exists() || !folder.isDirectory()) {
            throw new IllegalArgumentException("Invalid folder path: " + folderPath);
        }

        for (File file : Objects.requireNonNull(folder.listFiles())) {
            if (file.isFile() && file.getName().endsWith(".csv")) {
                String tableName = extractTableName(file.getName());
                loadCsvFileToTable(file.toPath(), tableName);
            }
        }
    }

    private String extractTableName(String fileName) {
        return fileName.replaceFirst("\\.csv$", "")
                .replaceFirst("_[0-9]{12}$", "");
    }

    private void loadCsvFileToTable(Path filePath, String tableName) throws Exception {

       log.info("loadCsvFileToTable : {} into: {}", filePath,tableName);
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath.toFile()))) {
            String headerLine = reader.readLine();
            if (headerLine == null) {
                throw new IllegalArgumentException("Empty CSV file: " + filePath);
            }

            List<String> columns = Arrays.stream(headerLine.split(","))
                    .map(String::trim)
                    .collect(Collectors.toList());

            List<Map<String, Object>> rows = new ArrayList<>();
            String line;
            while ((line = reader.readLine()) != null) {
                String[] values = line.split(",");
                Map<String, Object> row = new LinkedHashMap<>();
                for (int i = 0; i < columns.size(); i++) {
                    row.put(columns.get(i), i < values.length ? values[i].trim() : null);
                }
                rows.add(row);
            }

            if (!rows.isEmpty()) {
                mapper.batchInsert(tableName, columns, rows);
                System.out.printf("Loaded %d rows into table %s from %s%n",
                        rows.size(), tableName, filePath.getFileName());
            }
        }
    }
}
