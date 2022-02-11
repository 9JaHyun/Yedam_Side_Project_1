package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class SearchRestaurantController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.getParameter("name");
		return "customerViews/restaurant/searchResult";
	}

}