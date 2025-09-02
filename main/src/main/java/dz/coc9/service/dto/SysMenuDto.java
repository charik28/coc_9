package dz.coc9.service.dto;

public class SysMenuDto extends SidebarDto {
    private String mgmtNo;              // Management number if needed
//        private String url;                 // Menu navigation URL
//        private String title;               // Menu title
    private String code;  // Menu classification
//    private String iconName;            // Menu icon (optional)
    private String description;         // Extra description
//    private Boolean useYn;
//    private String createdBy;
//    private Instant createdDate;
//    private String lastModifiedBy;
//    private Instant lastModifiedDate;

    @Override
    public String toString() {
        return "SysMenuDto{" +
                "url='" + super.getUrl() + '\'' +
                ", title='" + super.getTitle() + '\'' +
                ", id=" + super.getId() +
                ", subMenus size=" + super.getSubMenus().size() +
                '}';
    }
    // Getters and setters

    public String getMgmtNo() { return mgmtNo; }
    public void setMgmtNo(String mgmtNo) { this.mgmtNo = mgmtNo; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

/*

    public Boolean getUseYn() { return useYn; }
    public void setUseYn(Boolean useYn) { this.useYn = useYn; }

    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }

    public Instant getCreatedDate() { return createdDate; }
    public void setCreatedDate(Instant createdDate) { this.createdDate = createdDate; }

    public String getLastModifiedBy() { return lastModifiedBy; }
    public void setLastModifiedBy(String lastModifiedBy) { this.lastModifiedBy = lastModifiedBy; }

    public Instant getLastModifiedDate() { return lastModifiedDate; }
    public void setLastModifiedDate(Instant lastModifiedDate) { this.lastModifiedDate = lastModifiedDate; }
*/

}
