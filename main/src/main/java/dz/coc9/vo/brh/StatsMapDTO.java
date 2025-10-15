package dz.coc9.vo.brh;

import java.time.LocalDateTime;

public class StatsMapDTO {

    private String dr;
    private String idd;
    private String wilaya;

    private Double lat;
    private Double lng;

    private Double kifKg;
    private Integer armes;
    private Double tabacKg;
    private Double carbL;

    private LocalDateTime date;

    public String getDr() {
        return dr;
    }

    public void setDr(String dr) {
        this.dr = dr;
    }

    public String getIdd() {
        return idd;
    }

    public void setIdd(String idd) {
        this.idd = idd;
    }

    public String getWilaya() {
        return wilaya;
    }

    public void setWilaya(String wilaya) {
        this.wilaya = wilaya;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getLng() {
        return lng;
    }

    public void setLng(Double lng) {
        this.lng = lng;
    }

    public Double getKifKg() {
        return kifKg;
    }

    public void setKifKg(Double kifKg) {
        this.kifKg = kifKg;
    }

    public Integer getArmes() {
        return armes;
    }

    public void setArmes(Integer armes) {
        this.armes = armes;
    }

    public Double getTabacKg() {
        return tabacKg;
    }

    public void setTabacKg(Double tabacKg) {
        this.tabacKg = tabacKg;
    }

    public Double getCarbL() {
        return carbL;
    }

    public void setCarbL(Double carbL) {
        this.carbL = carbL;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }
}
