package dz.coc9.service.util;

import dz.coc9.service.dto.SidebarDto;
import dz.coc9.service.dto.SysMenuDto;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @project afaris-thymleaf2
 * @Author Abdessamie Charik on 29/08/2025
 */

public class MenuTreeBuilder {

    public static <T extends SidebarDto> List<T> buildMenuTree(List<T> flatMenus) {
        Map<Long, T> menuMap = flatMenus.stream()
                .collect(Collectors.toMap(SidebarDto::getId, m -> m));

        List<T> rootMenus = new ArrayList<>();

        for (T menu : flatMenus) {
            if (menu.getParentMenuId() == null) {
                rootMenus.add(menu);
            } else {
                T parent = menuMap.get(menu.getParentMenuId());
                if (parent != null && parent.getSubMenus()!=null) {
                    parent.getSubMenus().add(menu);
                }
            }
        }

        // Tri optionnel par ordre si disponible
        rootMenus.sort(Comparator.comparing(m -> (m instanceof SysMenuDto) ? ((SysMenuDto) m).getOrdre() : 0));

        return rootMenus;
    }
}

