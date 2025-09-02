package dz.coc9.web.rest;

import dz.coc9.service.dto.UserDto;
import dz.coc9.service.dto.UserInfoDto;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class UserResource {


    @PostMapping("/authenticate")
    String authenticate(@RequestBody(required = false) UserDto user) {

        UserInfoDto userInfoDto = new UserInfoDto();

//        return userInfoDto;

        return "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc1NjUyMzc4MCwiYXV0aCI6IlJPTEVfQURNSU4gUk9MRV9VU0VSIiwiaWF0IjoxNzU2NDM3MzgwLCJ1c2VySWQiOjF9.kvUrAkNhFrAJEezjA0ybRf3xWw3UqD1gTodfSt9CR2OOytznwG3sFTcRG6n3o0-rdYiazRQCD7SoBLYnRh-pRA";
    }

}
