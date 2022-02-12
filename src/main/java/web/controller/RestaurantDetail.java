<<<<<<<< HEAD:src/main/java/web/controller/restaurant/RestaurantDetail.java
package web.controller.restaurant;
========
package web.controller;
>>>>>>>> restaurant_and_reserve:src/main/java/web/controller/RestaurantDetail.java

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class RestaurantDetail implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		return "customerViews/restaurant/restaurantDetail";
	}

}
