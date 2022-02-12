package web.controller.restaurant;

<<<<<<< HEAD
import java.sql.Time;

=======
>>>>>>> restaurant_and_reserve
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
<<<<<<< HEAD
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.manager.vo.ManagerVO;
=======
import domain.manager.vo.ManagerVO;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
>>>>>>> restaurant_and_reserve
import domain.restaurant.vo.RestaurantVO;
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
		vo.setLocation(request.getParameter("y-coordinates")+","+request.getParameter("x-coordinates"));
<<<<<<< HEAD
		System.out.println(request.getParameter("startTime"));
		vo.setOperationTimeStart(request.getParameter("startTime"));
		vo.setOperationTimeEnd(request.getParameter("endTime"));
		System.out.println(request.getParameter("breakStartTime"));
		vo.setBreakTimeStart(request.getParameter("breakStartTime"));
		vo.setBreakTimeEnd(request.getParameter("breakEndTime"));
		
		String path = "";
		
		int r = restaurantDAO.insertRestaurant(vo);
		
=======
		vo.setOperationTimeStart(request.getParameter("startTime"));
		vo.setOperationTimeEnd(request.getParameter("endTime"));
		vo.setBreakTimeStart(request.getParameter("breakStartTime"));
		vo.setBreakTimeEnd(request.getParameter("breakEndTime"));
		String path = "";		
		int r = restaurantDAO.insertRestaurant(vo);	
>>>>>>> restaurant_and_reserve
		if(r == 1) {
			path = "main.do";
		} else {
			path = "cMain.do";
<<<<<<< HEAD
		}
		
=======
		}		
>>>>>>> restaurant_and_reserve
		return path;
	}

}
