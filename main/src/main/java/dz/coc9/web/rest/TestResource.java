package dz.coc9.web.rest;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class TestResource {

    @GetMapping("/whoami")
    public String whoAmI(Authentication authentication) {
        return authentication == null ? "anonymous" : authentication.getName();
    }
}
