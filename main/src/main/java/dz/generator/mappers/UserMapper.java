package dz.generator.mappers;

import dz.generator.service.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {

    //@Select("SELECT id, login, email FROM jhi_user")
    List<UserDto> findAll();

    UserDto findById(Long id);
    UserDto findByLogin(@Param("login") String login);
}
