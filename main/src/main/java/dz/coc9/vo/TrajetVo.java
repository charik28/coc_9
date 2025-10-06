package dz.coc9.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class TrajetVo {
    List<PointVo>point  =new ArrayList<>();
}
