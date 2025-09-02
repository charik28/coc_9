package dz.coc9.service;

import dz.coc9.service.dto.UserInfoDto;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class JwtSessionService {

    private final SessionCacheService cacheService;
    private final RestTemplate restTemplate;

    public JwtSessionService(SessionCacheService cacheService) {
        this.cacheService = cacheService;
        this.restTemplate = new RestTemplate();
    }

    public UserInfoDto verifyAndCreateSession(String token) {
        // 1. Check cache first
        UserInfoDto cached = cacheService.get(token);
        if (cached != null) {
            createLocalSession(cached);
            return cached;
        }

        // 2. Call JHipster server once
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);
        HttpEntity<Void> entity = new HttpEntity<>(headers);

        ResponseEntity<UserInfoDto> response = restTemplate.exchange(
                "http://localhost:82/api/account",
                HttpMethod.GET,
                entity,
                UserInfoDto.class
        );

        if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
            UserInfoDto userInfo = response.getBody();

            // Cache for 5 min
            cacheService.put(token, userInfo, 300);

            // Create local session
            createLocalSession(userInfo);
            return userInfo;
        } else {
            throw new RuntimeException("Invalid token");
        }
    }

    private void createLocalSession(UserInfoDto userInfo) {
        List<GrantedAuthority> authorities = userInfo.getAuthorities().stream()
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());

        UsernamePasswordAuthenticationToken auth =
                new UsernamePasswordAuthenticationToken(userInfo, null, authorities);

        SecurityContextHolder.getContext().setAuthentication(auth);
    }
}
