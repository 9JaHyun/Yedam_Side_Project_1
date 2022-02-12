package web.controller.menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import common.Controller;
import domain.menu.service.MenuService;
import domain.menu.serviceImpl.MenuServiceImpl;

public class MyMenuListController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("id"));
		MenuService menuDAO = new MenuServiceImpl();
		Gson gson = new GsonBuilder().create();
		
		return "ajax:"+gson.toJson(menuDAO.menuSelectList(id));
	}

}
