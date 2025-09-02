package dz.coc9.service;

import dz.coc9.service.dto.SideBarTabDto;
import dz.coc9.service.dto.SidebarDto;
import dz.coc9.service.dto.SysMenuDto;
import dz.coc9.mappers.SysMenuMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static dz.coc9.service.util.MenuTreeBuilder.buildMenuTree;

@Service
@Transactional(readOnly = true)
public class SysMenuService {

    private static final Logger log = LoggerFactory.getLogger(SysMenuService.class);
    private final SysMenuMapper sysMenuMapper;

    public SysMenuService(SysMenuMapper sysMenuMapper) {
        this.sysMenuMapper = sysMenuMapper;
    }

    public List<SysMenuDto> getMenuTree() {
        List<SysMenuDto> flatList = sysMenuMapper.findFullMenuTree();

        // Index by ID for fast lookup
        Map<Long, SysMenuDto> lookup = flatList.stream()
                .collect(Collectors.toMap(SysMenuDto::getId, m -> m));

        List<SysMenuDto> roots = new ArrayList<>();

        for (SysMenuDto menu : flatList) {
            if (menu.getParentMenuId() == null) {
                roots.add(menu);
            } else {
                SysMenuDto parent = lookup.get(menu.getParentMenuId());
                if (parent != null) {
                    parent.getSubMenus().add(menu);
                }
            }
        }

        return roots;
    }

    public List<SysMenuDto> getMenuTreeForRoles(List<String> roles) {
        List<SysMenuDto> flatList = sysMenuMapper.findFullMenuTreeByRoles(roles);

        Map<Long, SysMenuDto> lookup = flatList.stream()
                .collect(Collectors.toMap(SysMenuDto::getId, m -> m));

        List<SysMenuDto> roots = new ArrayList<>();
        for (SysMenuDto menu : flatList) {
            if (menu.getParentMenuId() == null) {
                roots.add(menu);
            } else {
                SysMenuDto parent = lookup.get(menu.getParentMenuId());
                if (parent != null) {
                    parent.getSubMenus().add(menu);
                }
            }
        }
        log.info("found {} sys-menu roots ", roots.size());
        log.info("sys-menu: {}   ", roots.toString());
        return roots;
    }

    public List<SysMenuDto> getUserMenus(String userCode) {
        // 1. Fetch flat menus
        List<SysMenuDto> flatMenus = sysMenuMapper.findMenusByUserCode(userCode);

        // 2. Build tree
        return buildMenuTree(flatMenus);
    }

    public List<SidebarDto> getUserSideBareMenus(String userCode) {
        // 1. Menus à plat depuis la DB
        List<SidebarDto> flatMenus = sysMenuMapper.getUserSideBareMenus(userCode);

        // 2. Construire l’arborescence
        return buildMenuTree(flatMenus);
    }



    public List<SidebarDto> findSidebarTreeByLogin(String login) {
        return sysMenuMapper.findSidebarTreeByLogin(login);

    }

    public List<SideBarTabDto> getModuleTabs() {
        return sysMenuMapper.getModuleTabs();

    }
    public List<SidebarDto> findRootMenus() {
        return sysMenuMapper.findRootMenus();

    }
}
