package dz.coc9.web.rest;

import dz.coc9.service.SessionCacheService;
import dz.coc9.service.dto.UserInfoDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.*;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.stream.Collectors;


@RestController
@RequestMapping("/api/v3/session")
public class SessionController {

    private static final Logger log = LoggerFactory.getLogger(SessionController.class);
    private final SessionCacheService cacheService;
    private final RestTemplate restTemplate = new RestTemplate();
    private boolean devProfileYn = true;

    public static UserInfoDto devUserInfo = new UserInfoDto();

    public SessionController(SessionCacheService cacheService) {
        this.cacheService = cacheService;


        devUserInfo.setEmail("dev@coc9.dz");
        devUserInfo.setFirstName("Dev");
        devUserInfo.setLastName("Test");


    }

    // todo after updating session login; im i currently can identify the users from the sesions
    @PostMapping("/verify")
    public ResponseEntity<UserInfoDto> verifyToken(@RequestHeader("Authorization") String authHeader) {
        String token = authHeader.startsWith("Bearer ") ? authHeader.substring(7) : authHeader;

        // 1. Check cache
        UserInfoDto cached = cacheService.get(token);
        if (cached != null) {
            setAuthentication(cached);
            return ResponseEntity.ok(cached);
        }

        // 2. Call JHipster backend
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);
        HttpEntity<Void> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<UserInfoDto> response =
                    restTemplate.exchange(
                            "http://localhost:82/api/account",
                            HttpMethod.GET,
                            entity,
                            UserInfoDto.class
                    );

            if(devProfileYn){

                // Cache user info
                String devToken ="eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc1NjUyMzc4MCwiYXV0aCI6IlJPTEVfQURNSU4gUk9MRV9VU0VSIiwiaWF0IjoxNzU2NDM3MzgwLCJ1c2VySWQiOjF9.kvUrAkNhFrAJEezjA0ybRf3xWw3UqD1gTodfSt9CR2OOytznwG3sFTcRG6n3o0-rdYiazRQCD7SoBLYnRh-pRA";

                headers.set("Authorization", "Bearer " + devToken);
                entity = new HttpEntity<>(headers);
                cacheService.put(devToken, devUserInfo, 9000);

                setAuthentication(devUserInfo);
                return ResponseEntity.ok(devUserInfo);
            }

            if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
                UserInfoDto userInfo = response.getBody();

                // Cache user info
                cacheService.put(token, userInfo, 300);

                setAuthentication(userInfo);

                return ResponseEntity.ok(userInfo);
            } else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }

    /**
     * Sets Spring Security authentication with authorities
     */
    private void setAuthentication(UserInfoDto userInfo) {
        List<GrantedAuthority> authorities = userInfo.getAuthorities().stream()
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());

        UsernamePasswordAuthenticationToken auth =
                new UsernamePasswordAuthenticationToken(userInfo, null, authorities);

        SecurityContextHolder.getContext().setAuthentication(auth);
    }


/*
todo Do you want me to also show you how to invalidate and refresh the session when the JWT expires or changes (so JSESSIONID doesn’t stay alive with stale auth)?
 */

}
