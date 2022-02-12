package web.controller.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.menu.service.MenuService;
import domain.menu.serviceImpl.MenuServiceImpl;
import domain.menu.vo.MenuVO;

public class MenuDeleteController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MenuService menuDAO = new MenuServiceImpl();
		MenuVO vo = new MenuVO();
		vo.setMenuId(Long.parseLong(request.getParameter("id")));
		String result = "";
		
		int r = menuDAO.menuDelete(vo);
		if(r > 0) {
			result = "ajax:"+vo.getMenuId();
		} else {
			result = "ajax:0";
		}
		
		return result;
	}

}
