package web.controller.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Controller;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.restaurant.vo.RestaurantVO;

public class SelectRestaurantInfoController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		long id = Long.parseLong(request.getParameter("id"));
		RestaurantService restaurantDAO = new RestaurantServiceImpl();
		RestaurantVO vo = new RestaurantVO();
		vo.setRestaurantId(id);
		vo = restaurantDAO.selectRestaurant(vo);
		Gson gson = new GsonBuilder().setDateFormat("HH24:mm").create();
		return "ajax:"+gson.toJson(vo);
	}

}
