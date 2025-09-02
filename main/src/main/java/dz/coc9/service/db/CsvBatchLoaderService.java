package dz.coc9.service.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class CsvBatchLoaderService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Batch load all CSV files from a folder into corresponding DB tables.
     * The filename must start with the target table name.
     *
     * @param folderPath the path to the CSV folder
     */
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
        // Remove extension
        String baseName = fileName.replaceFirst("\\.csv$", "");

        // Regex: capture everything before the last _digits
        return baseName.replaceFirst("_[0-9]{12}$", "");
    }


    private void loadCsvFileToTable(Path filePath, String tableName) throws Exception {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath.toFile()))) {
            // First line: column headers
            String headerLine = reader.readLine();
            if (headerLine == null) {
                throw new IllegalArgumentException("Empty CSV file: " + filePath);
            }

            List<String> columns = Arrays.stream(headerLine.split(","))
                    .map(String::trim)
                    .collect(Collectors.toList());

            String sql = buildInsertSql(tableName, columns);

            List<Object[]> batchArgs = new ArrayList<>();
            String line;
            while ((line = reader.readLine()) != null) {
                String[] values = line.split(",");
                Object[] row = Arrays.stream(values)
                        .map(String::trim)
                        .map(v -> v.isEmpty() ? null : v)
                        .toArray();
                batchArgs.add(row);
            }

            if (!batchArgs.isEmpty()) {
                jdbcTemplate.batchUpdate(sql, batchArgs);
                System.out.printf("Loaded %d rows into table %s from %s%n",
                        batchArgs.size(), tableName, filePath.getFileName());
            }
        }
    }

    private String buildInsertSql(String tableName, List<String> columns) {
        String colPart = String.join(",", columns);
        String valPart = columns.stream().map(c -> "?").collect(Collectors.joining(","));
        return "INSERT INTO " + tableName + " (" + colPart + ") VALUES (" + valPart + ")";
    }
}
