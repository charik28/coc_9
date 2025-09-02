package dz.generator.web.rest;

import dz.generator.service.UserService;
import dz.generator.service.dto.SideBarTabDto;
import dz.generator.service.dto.SidebarDto;
import dz.generator.service.dto.SysMenuDto;
import dz.generator.mappers.SysMenuMapper;
import dz.generator.service.SysMenuService;
import dz.generator.service.dto.UserDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v3/sys-menus")
public class SysMenuController {

    private static final Logger log = LoggerFactory.getLogger(SysMenuController.class);
    private final SysMenuMapper sysMenuMapper;
    private final SysMenuService sysMenuService;
    private final UserService userService;

    public SysMenuController(SysMenuMapper sysMenuMapper, SysMenuService sysMenuService, UserService userService) {
        this.sysMenuMapper = sysMenuMapper;
        this.sysMenuService = sysMenuService;
        this.userService = userService;
    }

    @GetMapping
    public List<SysMenuDto> getMenus(@RequestHeader("Authorization") String authHeader) {
        // (Optional) check if token exists in local store
        // if not -> reject

        return sysMenuMapper.findAllRootMenus();
    }
    @GetMapping("/tabs")
    public List<SideBarTabDto> getModuleTabs() {

        return sysMenuService.getModuleTabs();
    }

    @GetMapping("/tree")
    public ResponseEntity<List<SysMenuDto>> getFullMenuTreeForUser() {
        log.debug("Get: /tree getFullMenuTreeForUser ");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        List<String> roles = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toList());

        List<SysMenuDto> tree = sysMenuService.getMenuTreeForRoles(roles);
        return ResponseEntity.ok(tree);
    }

    @GetMapping("/user")
    public ResponseEntity<List<SysMenuDto>> getUserMenus() {
        log.debug("Get: /sys-menu/user getUserMenus");

        // Get the authentication object from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !authentication.isAuthenticated()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        // Extract the login (username) of the current user
        String login = authentication.getName();
        // In most JHipster setups, authentication.getName() returns the username (login/email)

        // Fetch user by login
        UserDto userDto = userService.findByLogin(login);
        if (userDto == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        // Fetch menus for this user
        List<SysMenuDto> menus = sysMenuService.getUserMenus(userDto.getCode());

        log.debug("found::{} menus for user : {}", menus.size(), userDto.getLogin());
        return ResponseEntity.ok(menus);
    }
    @GetMapping("/sidebar")
    public ResponseEntity<List<SidebarDto>> getSideBareMenus(@RequestParam(required = false,defaultValue = "false" ) boolean subMenus) {
        log.debug("Get: /sys-menu/sidebare getSideBareMenus");

        // Get the authentication object from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !authentication.isAuthenticated()) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        // Extract the login (username) of the current user
        String login = authentication.getName();
        // In most JHipster setups, authentication.getName() returns the username (login/email)

    /*    // Fetch user by login
        UserDto userDto = userService.findByLogin(login);
        if (userDto == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }*/

        // Fetch menus for this user
//        List<SidebarDto> menus = sysMenuService.findMenuTreeByUserLogin(login);
        List<SidebarDto> menus;
        if(subMenus){
             menus = sysMenuService.findSidebarTreeByLogin(login);

        }
else
        {
            menus = sysMenuService.findRootMenus();
        }
        log.debug("found::{} menus for user : {}", menus.size(), login);
        return ResponseEntity.ok(menus);
    }

}
