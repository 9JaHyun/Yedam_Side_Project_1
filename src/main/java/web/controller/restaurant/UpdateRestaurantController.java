package web.controller.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.restaurant.vo.RestaurantVO;

public class UpdateRestaurantController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		RestaurantService restaurantDAO = new RestaurantServiceImpl();
		
		RestaurantVO vo = new RestaurantVO();
		vo.setRestaurantId(Long.parseLong(request.getParameter("restaurantId")));
		vo.setName(request.getParameter("shop"));
		vo.setTel(request.getParameter("tel"));
		vo.setContent(request.getParameter("content"));
		vo.setOperationTimeStart(request.getParameter("startTime"));
		vo.setOperationTimeEnd(request.getParameter("endTime"));
		vo.setBreakTimeStart(request.getParameter("breakStartTime"));
		vo.setBreakTimeEnd(request.getParameter("breakEndTime"));
		
		int r = restaurantDAO.updateRestaurant(vo);
		String path = "";
		if(r > 0) {
			path="updateRestaurantForm.do";
		} else {
			path="main.do";
		}
		return path;
	}

}
