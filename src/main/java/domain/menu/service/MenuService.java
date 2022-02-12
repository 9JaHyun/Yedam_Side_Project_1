package domain.menu.service;

import java.util.List;

import domain.menu.vo.MenuVO;

public interface MenuService {
	List<MenuVO> menuAll();
	List<MenuVO> menuSelectList(long restaurantId);
	MenuVO menuSelect(MenuVO vo);
	int menuInsert(MenuVO vo);
	int menuUpdate(MenuVO vo);
	int menuDelete(MenuVO vo);
}
