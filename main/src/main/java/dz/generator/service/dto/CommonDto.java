package dz.generator.service.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @project afaris-thymleaf2
 * @Author Abdessamie Charik on 29/08/2025
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonDto {
    private Long id;
    private String code;
    private String label1;
    private String label2;
}
