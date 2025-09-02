package dz.coc9.service.dtococ;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author GHEZALI Abdelhak
 * Created on 2025/03/16.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CocRprtRequest {
    private List<CocRprtVo> paramBRQ1List = new ArrayList<>();
    private List<CocRprtIncVo> paramBRQ2List = new ArrayList<>();
}
