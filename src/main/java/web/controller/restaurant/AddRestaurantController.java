package web.controller.restaurant;

import java.sql.Date;
import java.sql.Time;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import domain.manager.service.RestaurantService;
import domain.manager.serviceImpl.RestaurantServiceImpl;
import domain.manager.vo.ManagerVO;
import domain.manager.vo.RestaurantVO;
import web.SessionConst;

public class AddRestaurantController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		RestaurantService restaurantDAO = new RestaurantServiceImpl();
		RestaurantVO vo = new RestaurantVO();
		ManagerVO mvo = (ManagerVO) session.getAttribute(SessionConst.LOGIN_MANAGER);
		
		vo.setManagerId(mvo.getManagerId());
		vo.setName(request.getParameter("shop"));
		vo.setTel(request.getParameter("tel"));
		vo.setContent(request.getParameter("content"));
		vo.setLocation("("+request.getParameter("y-coordinates")+","+request.getParameter("x-coordinates")+")");
		System.out.println(request.getParameter("startTime"));
		vo.setOperationTimeStart(Time.valueOf(request.getParameter("startTime")+":00"));
		vo.setOperationTimeEnd(Time.valueOf(request.getParameter("endTime")+":00"));
		System.out.println(request.getParameter("breakStartTime"));
		if(!request.getParameter("breakStartTime").equals("")) {
			vo.setBreakTimeStart(Time.valueOf(request.getParameter("breakStartTime")+":00"));
		}
		if(!request.getParameter("breakEndTime").equals("")) {
			vo.setBreakTimeEnd(Time.valueOf(request.getParameter("breakEndTime")+":00"));
		}
		
		String path = "";
		
		int r = restaurantDAO.insertRestaurant(vo);
		
		if(r == 1) {
			path = "main.do";
		} else {
			path = "cMain.do";
		}
		
		return path;
	}

}
