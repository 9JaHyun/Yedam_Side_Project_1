package web.controller.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import domain.manager.vo.ManagerVO;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import web.SessionConst;

public class AddMenuFormController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		RestaurantService restaurantDAO = new RestaurantServiceImpl();
		HttpSession session = request.getSession();
		ManagerVO vo = (ManagerVO) session.getAttribute(SessionConst.LOGIN_MANAGER);
		long managerId = vo.getManagerId();
		request.setAttribute("list", restaurantDAO.searchRestaurantByManagerId(managerId));

		return "menu/addMenuForm";
	}

}
