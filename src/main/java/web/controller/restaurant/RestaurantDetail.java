package web.controller.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class RestaurantDetail implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		return "customerViews/restaurant/restaurantDetail";
	}

}
