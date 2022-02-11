package web.controller.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.manager.vo.ManagerVO;
import web.SessionConst;

public class UpdateRestaurantFormController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		RestaurantService restaurantDAO = new RestaurantServiceImpl();
		HttpSession session = request.getSession();
		ManagerVO vo = (ManagerVO) session.getAttribute(SessionConst.LOGIN_MANAGER);
		long managerId = vo.getManagerId();
		request.setAttribute("restaurants", restaurantDAO.searchRestaurantByManagerId(managerId));
		return "restaurant/updateRestaurantForm";
	}

}
