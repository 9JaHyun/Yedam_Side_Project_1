package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.manager.service.RestaurantService;
import domain.manager.serviceImpl.RestaurantServiceImpl;
import domain.manager.vo.RestaurantVO;

import java.util.List;

public class SearchRestaurantController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		RestaurantService restaurantDao = new RestaurantServiceImpl();
		RestaurantVO vo = new RestaurantVO();

		String name = request.getParameter("name");
		if (!name.isEmpty()) {
			List<RestaurantVO> result = restaurantDao.searchRestaurantName(name);
			if (!result.isEmpty()) {
				request.setAttribute("list", result);
			} else {
				request.setAttribute("message", "검색결과가 없습니다.");
			}
		} else {
			// todo 랜덤 데이터
			request.setAttribute("message", "검색결과가 없습니다.");
		}

		return "customerViews/restaurant/searchResult";
	}

}
