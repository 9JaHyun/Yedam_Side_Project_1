
package web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.restaurant.vo.RestaurantVO;

public class MainController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		RestaurantService restaurantDao = new RestaurantServiceImpl();
		List<RestaurantVO> result = restaurantDao.searchRestaurantRanking();

		if (!result.isEmpty()) {
			request.setAttribute("list", result);
		} else {
			request.setAttribute("message", "empty data");
		}
		return "customerViews/main/main";

	}

}
