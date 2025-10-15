package dz.coc9.vo.brh;


import lombok.Data;

import java.util.List;

@Data
public class StatsFilterDTO {
    private List<String> drs;
    private List<String> idds;
    private List<String> periodes;
String dr,idd,periode;

    public List<String> getDrs() { return drs; }
    public void setDrs(List<String> drs) { this.drs = drs; }

    public List<String> getIdds() { return idds; }
    public void setIdds(List<String> idds) { this.idds = idds; }

    public List<String> getPeriodes() { return periodes; }
    public void setPeriodes(List<String> periodes) { this.periodes = periodes; }
}

