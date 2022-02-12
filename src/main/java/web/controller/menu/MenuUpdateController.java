package web.controller.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.menu.service.MenuService;
import domain.menu.serviceImpl.MenuServiceImpl;
import domain.menu.vo.MenuVO;

public class MenuUpdateController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MenuService menuDAO = new MenuServiceImpl();
		MenuVO vo = new MenuVO();
		vo.setMenuId(Long.parseLong(request.getParameter("id")));
		vo.setName(request.getParameter("name"));
		vo.setCost(Integer.parseInt(request.getParameter("cost")));
		
		int r = menuDAO.menuUpdate(vo);
		if (r>0) {
			return "ajax:1";
		}
		return "ajax:0";
	}

}
