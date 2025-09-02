package dz.generator.config;

import org.springframework.stereotype.Component;

/*
deprecated
because its very heavy
 */
@Component
public class ProxyJwtAuthenticationFilter /*extends OncePerRequestFilter*/
{

    // todok i can make static global func based on /verify login
    // but just once then create local session accross all apis
    // or do the hard wey but the best is to use this filter
  /*  private final RestTemplate restTemplate;
    private final SessionCacheService cacheService;

    public ProxyJwtAuthenticationFilter(RestTemplate restTemplate, SessionCacheService cacheService) {
        this.restTemplate = restTemplate;
        this.cacheService = cacheService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        String header = request.getHeader("Authorization");

        if (header != null && header.startsWith("Bearer ")) {
            String token = header.substring(7);

            // 1️⃣ Check cache
            UserInfoDto cached = cacheService.get(token);
            if (cached == null) {
                try {
                    // 2️⃣ Call JHipster /api/account
                    HttpHeaders headers = new HttpHeaders();
                    headers.set("Authorization", "Bearer " + token);
                    HttpEntity<Void> entity = new HttpEntity<>(headers);

                    ResponseEntity<UserInfoDto> resp =
                            restTemplate.exchange("http://localhost:82/api/account",
                                    HttpMethod.GET, entity, UserInfoDto.class);

                    if (resp.getStatusCode().is2xxSuccessful() && resp.getBody() != null) {
                        cached = resp.getBody();
                        cacheService.put(token, cached, 300); // cache 5 min
                    } else {
                        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                        return;
                    }
                } catch (Exception e) {
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    return;
                }
            }

            // 3️⃣ Set Spring Security session
            List<GrantedAuthority> authorities = cached.getAuthorities().stream()
                    .map(SimpleGrantedAuthority::new)
                    .toList();

            UsernamePasswordAuthenticationToken auth =
                    new UsernamePasswordAuthenticationToken(cached, null, authorities);
            SecurityContextHolder.getContext().setAuthentication(auth);
        }

        filterChain.doFilter(request, response);
    }*/
}
