package dz.coc9.service.db;

import dz.coc9.mappers.GenericBatchMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Qualifier;
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
    private static final int BATCH_SIZE = 1000;
    private final SqlSessionFactory sqlSessionFactory;
    private final GenericBatchMapper genericBatchMapper;

    public CsvBatchLoaderService(GenericBatchMapper mapper, @Qualifier("sqlSessionFactory") SqlSessionFactory sqlSessionFactory, GenericBatchMapper genericBatchMapper) {
        this.mapper = mapper;
        this.sqlSessionFactory = sqlSessionFactory;
        this.genericBatchMapper = genericBatchMapper;
    }
    int tbCount;

    @Transactional
    public String loadCsvFolder(String folderPath) throws Exception {
        tbCount = 0;
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
        return "loaded " + tbCount +" of "+ Objects.requireNonNull(folder.listFiles()).length +" file";
    }

    private String extractTableName(String fileName) {
        return fileName.replaceFirst("\\.csv$", "")
                .replaceFirst("_[0-9]{12}$", "");
    }

    private void loadCsvFileToTable(Path filePath, String tableName) throws Exception {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath.toFile()));
             SqlSession sqlSession = sqlSessionFactory.openSession(false)) { // disable auto-commit

            GenericBatchMapper mapper = sqlSession.getMapper(GenericBatchMapper.class);

            String headerLine = reader.readLine();
            if (headerLine == null) {
                throw new IllegalArgumentException("Empty CSV file: " + filePath);
            }

            List<String> fields = Arrays.stream(headerLine.split(","))
                    .map(String::trim)
                    .collect(Collectors.toList());

            try {
                if (!"tb_coc_arm".equals(tableName) && !tableName.contains("_rel")) {

                    if (countByTableName(tableName) < 1) {
                        genericBatchMapper.copyCsvFile("alpassint", tableName, filePath.toString(), fields);
                        log.warn("loaded {} from {}", tableName, filePath);

                        tbCount++;
                    } else {
                        log.warn("skipping {}  ", tableName);
                    }
                }
            }catch (Exception e) {
                log.error(e.getMessage());
            }



        }
    }

    long countByTableName(String tableName) {
        long count =-2L;

        try{

             if(genericBatchMapper.checkTableExists("alpassint" ,tableName))
             {
                 count = genericBatchMapper.countByTableName("alpassint" ,tableName);
             }                ;

        }catch (Exception e) {
            log.error(e.getMessage());
        }
        return count;

    }


}
