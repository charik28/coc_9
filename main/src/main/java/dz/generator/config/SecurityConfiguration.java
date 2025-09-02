package dz.generator.config;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer.FrameOptionsConfig;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

    public SecurityConfiguration(ProxyJwtAuthenticationFilter proxyJwtAuthenticationFilter) {
        this.proxyJwtAuthenticationFilter = proxyJwtAuthenticationFilter;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    private final ProxyJwtAuthenticationFilter proxyJwtAuthenticationFilter;
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, MvcRequestMatcher.Builder mvc, JwtSessionFilter jwtSessionFilter) throws Exception {
        http
                .cors(withDefaults())
                .csrf(csrf -> csrf.disable())
                .headers(headers ->
                        headers
                                // You can set your own CSP or remove if not needed
//                                .contentSecurityPolicy(csp -> csp.policyDirectives("default-src 'self'"))
                                .frameOptions(FrameOptionsConfig::sameOrigin)
                                .referrerPolicy(referrer -> referrer.policy(org.springframework.security.web.header.writers.ReferrerPolicyHeaderWriter.ReferrerPolicy.STRICT_ORIGIN_WHEN_CROSS_ORIGIN))
                                .permissionsPolicyHeader(permissions ->
                                        permissions.policy("camera=(), fullscreen=(self), geolocation=(), microphone=()")
                                )
                )
                .authorizeHttpRequests(authz -> authz
                        // Public static resources
                        .requestMatchers(mvc.pattern("/index.html"), mvc.pattern("/*.js"), mvc.pattern("/*.css"),
                                mvc.pattern("/*.ico"), mvc.pattern("/*.png"), mvc.pattern("/*.svg")).permitAll()
                        .requestMatchers(mvc.pattern("/i18n/**")).permitAll()
                        .requestMatchers(mvc.pattern("/content/**")).permitAll()
                        .requestMatchers(mvc.pattern("/swagger-ui/**")).permitAll()

                        // Authentication endpoints
                        .requestMatchers(mvc.pattern(HttpMethod.POST, "/api/authenticate")).permitAll()
                        .requestMatchers(mvc.pattern(HttpMethod.GET, "/api/authenticate")).permitAll()
                        .requestMatchers(mvc.pattern("/api/register")).permitAll()
                        .requestMatchers(mvc.pattern("/**")).permitAll()
                        .requestMatchers(mvc.pattern("/loader.html")).permitAll()
                        .requestMatchers(mvc.pattern("/app/**")).permitAll()//todo authenticated()
                        .requestMatchers(mvc.pattern("/build/**")).permitAll()
                        .requestMatchers(mvc.pattern("/dist/**")).permitAll()
                        .requestMatchers(mvc.pattern("/fonts/**")).permitAll()
                        .requestMatchers(mvc.pattern("/js/**")).permitAll()
                        .requestMatchers(mvc.pattern("/plugins/**")).permitAll()
                        .requestMatchers(mvc.pattern("/error/**")).permitAll()
                        .requestMatchers(mvc.pattern("/static/**")).permitAll()
                        .requestMatchers(mvc.pattern("/api/activate")).permitAll()
                        .requestMatchers(mvc.pattern("/api/account/reset-password/init")).permitAll()
                        .requestMatchers(mvc.pattern("/api/account/reset-password/finish")).permitAll()

                        // Secured endpoints
                        .requestMatchers(mvc.pattern("/api/admin/**")).hasAuthority("ROLE_ADMIN")
                        .requestMatchers(mvc.pattern("/api/whoami")).permitAll()
                        .requestMatchers(mvc.pattern("/api/**")).authenticated()
                        .requestMatchers(mvc.pattern("/websocket/**")).authenticated()
                        .requestMatchers(mvc.pattern("/v3/api-docs/**")).hasAuthority("ROLE_ADMIN")

                        // Actuator endpoints
                        .requestMatchers(mvc.pattern("/management/health"),
                                mvc.pattern("/management/health/**"),
                                mvc.pattern("/management/info"),
                                mvc.pattern("/management/prometheus")).permitAll()
                        .requestMatchers(mvc.pattern("/management/**")).hasAuthority("ROLE_ADMIN")
                )
                .addFilterBefore(jwtSessionFilter, UsernamePasswordAuthenticationFilter.class)
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
        /*        .exceptionHandling(exceptions ->
                        exceptions
                                .authenticationEntryPoint(new BearerTokenAuthenticationEntryPoint())
                                .accessDeniedHandler(new BearerTokenAccessDeniedHandler())
                )*/
                // 26-08-
       /*         .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .exceptionHandling(exceptions -> exceptions
                .authenticationEntryPoint((request, response, authException) -> {
                    response.sendRedirect("/error?code=401");
                })
                .accessDeniedHandler((request, response, accessDeniedException) -> {
                    response.sendRedirect("/error?code=403");
                })*/
/*                .exceptionHandling(exceptions -> exceptions
                        .authenticationEntryPoint((request, response, authException) -> {
                            request.setAttribute("javax.servlet.error.status_code", HttpServletResponse.SC_UNAUTHORIZED);
                            request.getRequestDispatcher("/error").forward(request, response);
                        })*/
                .exceptionHandling(exceptions -> exceptions
                        .authenticationEntryPoint((request, response, authException) -> {
                            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                        })
                        .accessDeniedHandler((request, response, accessDeniedException) -> {
                            response.sendError(HttpServletResponse.SC_FORBIDDEN);
                        })
                )



                .oauth2ResourceServer(oauth2 -> oauth2.jwt(withDefaults()));

        return http.build();
    }

    @Bean
    MvcRequestMatcher.Builder mvc(HandlerMappingIntrospector introspector) {
        return new MvcRequestMatcher.Builder(introspector);
    }
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.addAllowedOriginPattern("*");
        configuration.addAllowedMethod("*");
        configuration.addAllowedHeader("*");
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

}
