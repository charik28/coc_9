package dz.coc9.web.rest;

import dz.coc9.service.CommonService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @project afaris-thymleaf2
 * @Author Abdessamie Charik on 29/08/2025
 */
@RestController
@RequestMapping("/api/v2")
@RequiredArgsConstructor
public class CommonResource {

    private final CommonService commonService;

    @GetMapping("/common")
    public ResponseEntity<List<Map<String, Object>>> getCommon(@RequestParam String code) {
        return ResponseEntity.ok(commonService.getCommonData(code));
    }
}
