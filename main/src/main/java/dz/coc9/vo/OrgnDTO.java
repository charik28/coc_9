package dz.coc9.vo;

/**
 * @project coc_9
 * @Author Abdessamie Charik on 16/10/2025
 */

import java.util.List;

public class OrgnDTO {
    private String dr;
    private List<IddDTO> idds;

    public String getDr() { return dr; }
    public void setDr(String dr) { this.dr = dr; }
    public List<IddDTO> getIdds() { return idds; }
    public void setIdds(List<IddDTO> idds) { this.idds = idds; }

    public static class IddDTO {
        private String idd;
        private List<String> brigades;

        public String getIdd() { return idd; }
        public void setIdd(String idd) { this.idd = idd; }
        public List<String> getBrigades() { return brigades; }
        public void setBrigades(List<String> brigades) { this.brigades = brigades; }
    }
}

