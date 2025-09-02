package dz.generator.mappers;

import dz.generator.service.dto.SideBarTabDto;
import dz.generator.service.dto.SysMenuDto;
import dz.generator.service.dto.SidebarDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

@Mapper
public interface SysMenuMapper {
    List<SysMenuDto> findAllRootMenus();

//    <!-- Submenus (recursive) -->
    List<SysMenuDto> findSubMenus(@Param("parentId") Long parentId);

    List<SysMenuDto> findSubMenusByParentId(@Param("parentId") Long parentId);

    List<SysMenuDto> findFullMenuTree();

    List<SidebarDto> findRootMenus();

    List<SysMenuDto> findFullMenuTreeByRoles(@Param("roles") List<String> roles);
    List<SysMenuDto> findMenusByUserCode(@Param("userCode") String userCode);
    List<SidebarDto> findSidebarTreeByLogin(@Param("login") String login);
    List<SysMenuDto> findMenuTreeByLogin(@Param("login") String login);

    List<SidebarDto> findSidebarTree();

    List<SidebarDto> getUserSideBareMenus(@Param("userCode") String userCode);
    List<SideBarTabDto> getModuleTabs();

}
