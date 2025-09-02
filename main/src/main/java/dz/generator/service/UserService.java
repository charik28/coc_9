package dz.generator.service;

import dz.generator.mappers.UserMapper;
import dz.generator.service.dto.UserDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private static final Logger log = LoggerFactory.getLogger(UserService.class);
    private final UserMapper userMapper;

    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public List<UserDto> getAllUsers() {
        return userMapper.findAll();
    }

    public UserDto getUser(Long id) {
        return userMapper.findById(id);
    }

    public UserDto findByLogin(String login) {
        log.debug("find user by login: {}", login);
        return userMapper.findByLogin(login);
    }



}
