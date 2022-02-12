<<<<<<< HEAD
package web.controller;
=======
<<<<<<<< HEAD:src/main/java/web/controller/restaurant/AddRestaurantFormController.java
package web.controller.restaurant;
========
package web.controller;
>>>>>>>> restaurant_and_reserve:src/main/java/web/controller/MainController.java
>>>>>>> restaurant_and_reserve

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
<<<<<<< HEAD
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.restaurant.vo.RestaurantVO;

import java.util.List;

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
=======

<<<<<<<< HEAD:src/main/java/web/controller/restaurant/AddRestaurantFormController.java
public class AddRestaurantFormController implements Controller {
========
public class MainController implements Controller {
>>>>>>>> restaurant_and_reserve:src/main/java/web/controller/MainController.java

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "restaurant/addRestaurantForm";
>>>>>>> restaurant_and_reserve
	}

}
