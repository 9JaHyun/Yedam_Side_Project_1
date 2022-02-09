package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;

public class RestaurantDetail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		return "customerViews/restaurant/restaurantDetail";
	}

}
