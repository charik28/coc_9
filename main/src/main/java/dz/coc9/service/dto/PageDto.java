package dz.coc9.service.dto;

// ✅ DTO for pages
public class PageDto {
    private String path;   // url path (e.g. "dashboard")
    private String url;    // file path (e.g. "/app/home.html")
    private String role;   // required role (e.g. "ROLE_USER" or "PUBLIC")

    public PageDto(String path, String url, String role) {
        this.path = path;
        this.url = url;
        this.role = role;
    }

    public String getPath() { return path; }
    public void setPath(String path) { this.path = path; }

    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}
