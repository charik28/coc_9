package dz.generator.service;
import dz.generator.service.dto.UserInfoDto;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class SessionCacheService {

    static class CachedUser {
        UserInfoDto userInfoDto;
        Instant expiry;
    }

    private final ConcurrentHashMap<String, CachedUser> cache = new ConcurrentHashMap<>();

    public UserInfoDto get(String token) {
        CachedUser entry = cache.get(token);
        if (entry != null && Instant.now().isBefore(entry.expiry)) {
            return entry.userInfoDto;
        }
        return null;
    }

    public void put(String token, UserInfoDto user, long ttlSeconds) {
        CachedUser entry = new CachedUser();
        entry.userInfoDto = user;
        entry.expiry = Instant.now().plusSeconds(ttlSeconds);
        cache.put(token, entry);
    }
}
