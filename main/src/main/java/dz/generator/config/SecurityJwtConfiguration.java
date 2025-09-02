package dz.generator.config;

import com.nimbusds.jose.jwk.source.ImmutableSecret;
import com.nimbusds.jose.util.Base64;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;
import org.springframework.security.oauth2.jose.jws.MacAlgorithm;
import org.springframework.security.oauth2.server.resource.web.BearerTokenResolver;
import org.springframework.security.oauth2.server.resource.web.DefaultBearerTokenResolver;

@Configuration
public class SecurityJwtConfiguration {

    private static final Logger LOG = LoggerFactory.getLogger(SecurityJwtConfiguration.class);

    /**
     * Base64-encoded secret key for HMAC signing (configure in application.yml)
     */
//    @Value("${security.jwt.base64-secret}")
    private String jwtKey="ZDQwMWQ3MTMwYmY0ODFiNWZhZjc0NjNmNDhjYmRjYTUzNDU0Mzc4OGIxNDhmZjU4MTJhY2FkZmE2NTIxNzQ1NmI3ZjM1ZjY2Y2YzYWUzNTFiMDBiOWY5YTAyMWJkOWJjYmMyZGViYTdhNWVhMmVlZTM2MjVjNWE1YzY3MTM0NDc=";

    private static final MacAlgorithm JWT_ALGORITHM = MacAlgorithm.HS512; // same as JHipster default

    @Bean
    public JwtDecoder jwtDecoder() {
        return NimbusJwtDecoder.withSecretKey(getSecretKey())
                .macAlgorithm(JWT_ALGORITHM)
                .build();
    }

    @Bean
    public JwtEncoder jwtEncoder() {
        return new NimbusJwtEncoder(new ImmutableSecret<>(getSecretKey()));
    }

    @Bean
    public BearerTokenResolver bearerTokenResolver() {
        DefaultBearerTokenResolver resolver = new DefaultBearerTokenResolver();
        resolver.setAllowUriQueryParameter(true); // allows ?access_token=... in query
        return resolver;
    }

    private SecretKey getSecretKey() {
        try {
            byte[] keyBytes = Base64.from(jwtKey).decode();
            return new SecretKeySpec(keyBytes, 0, keyBytes.length, JWT_ALGORITHM.getName());
        } catch (Exception e) {
            LOG.error("Failed to decode JWT secret key: {}", e.getMessage());
            throw new IllegalStateException("Invalid JWT secret key configuration", e);
        }
    }
}
