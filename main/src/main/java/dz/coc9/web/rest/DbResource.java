package dz.coc9.web.rest;


import dz.coc9.service.db.CsvBatchLoaderService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class DbResource {

    private final CsvBatchLoaderService csvBatchLoaderService;

    public DbResource(CsvBatchLoaderService csvBatchLoaderService) {
        this.csvBatchLoaderService = csvBatchLoaderService;
    }

    @GetMapping("/load")
    String load() {
        try {
           return
                   csvBatchLoaderService.loadCsvFolder("C:\\wrk\\dzGeo\\cocDb\\csv");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }


    }

}
