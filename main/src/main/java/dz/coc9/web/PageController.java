package dz.coc9.web;

import dz.coc9.service.dto.PageDto;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/")
public class PageController {

    // ✅ Example: later load from DB/service
    private static final List<PageDto> PAGES = List.of(
//            new PageDto("dashboard", "/home.html", "ROLE_USER"),
            new PageDto("home", "/home.html", "ROLE_USER"),
            new PageDto("login", "/login/login.html", "PUBLIC"),
            new PageDto("loader", "loader.html", "PUBLIC"),
            new PageDto("admin", "/admin/admin.html", "ROLE_ADMIN")
    );


    // Root (loader)
    @GetMapping("/")
    public ModelAndView loadRoot() {
        return new ModelAndView("forward:/loader.html");
    }
    @GetMapping("/home")
    public ModelAndView loadHome() {
        return new ModelAndView("forward:/app/home.html");
//        return loadCocReport();
    }
    @GetMapping("/coc9")
    public ModelAndView loadCocHome() {
        return new ModelAndView("forward:/coc9/index.html");
    }
    @GetMapping({"/brq" , })
    public ModelAndView loadCocReport() {
        return new ModelAndView("forward:/coc9/reports/coc-main.html");
    }

    @GetMapping({"/generated-home.html","/generated"})
        public ModelAndView loadGeneratedForms() {
        return new ModelAndView("forward:/app/generated-home.html");
    }
    @GetMapping("/login")
    public ModelAndView loadLogin() {
        return new ModelAndView("forward:/app/login/login.html");
    }

    // Dynamic page resolver without auth
//    @GetMapping({"/{path}"})
    public ModelAndView loadPage(@PathVariable(required = false) String path, Model model) {
        if (path == null || path.isEmpty()) {
            return new ModelAndView("forward:/loader.html");

        }

        // 🔎 find page definition from your list
        final String finalPath = path.replace(".html", "");

        PageDto pageDef = PAGES.stream()
                .filter(p -> p.getPath().equalsIgnoreCase(finalPath))
                .findFirst()
                .orElse(null);

        if (pageDef == null) {
            // ❌ Unknown path → 404
            return new ModelAndView("forward:/error/404.html");
        }

        // ✅ always forward directly (no auth checks)
        return new ModelAndView("forward:" + pageDef.getUrl());
    }
    /*
    // catch-all for frontend routes (optional, useful if you use SPA-like navigation)
    @GetMapping("/{path:^(?!api|static|assets).*$}")
    public String fallback() {
        return "forward:/loader.html";
    }*/



    @GetMapping("/favicon.ico")
    public ResponseEntity<Resource> favicon() {
        ClassPathResource imgFile = new ClassPathResource("static/favicon.ico"); // not "static/"
        return ResponseEntity.ok()
                .contentType(MediaType.valueOf("image/x-icon"))
                .body(imgFile);
    }

}
