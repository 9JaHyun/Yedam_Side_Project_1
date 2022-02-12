package web.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.manager.service.ManagerService;
<<<<<<< HEAD
import domain.restaurant.service.RestaurantService;
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.manager.vo.ManagerVO;
=======
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.manager.vo.ManagerVO;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
>>>>>>> restaurant_and_reserve
import domain.restaurant.vo.RestaurantVO;

public class ManagerSignupController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ManagerVO mvo = new ManagerVO();
		RestaurantVO rvo = new RestaurantVO();
		ManagerService managerDAO = new ManagerServiceImpl();
		RestaurantService restaurantDAO = new RestaurantServiceImpl();
		
		String coordinates = request.getParameter("y-coordinates")+","+request.getParameter("x-coordinates");
		
		// manager 계정 db 추가
		mvo.setLoginId(request.getParameter("login_id"));
		mvo.setPassword(request.getParameter("password"));
		mvo.setEmail(request.getParameter("email"));
		mvo.setTel(request.getParameter("tel"));
		int mresult = managerDAO.managerInsert(mvo);
		if(mresult == 1) {
			rvo.setManagerId(mvo.getManagerId());
			rvo.setName(request.getParameter("shop"));
			rvo.setLocation(coordinates);
			int rresult = restaurantDAO.insertRestaurant(rvo);
			if(rresult != 1) {
				request.setAttribute("message", "상점 생성 실패");
				return "customerViews/test/error";
			}
		} else {
			request.setAttribute("message", "매니저 가입 실패");
			return "customerViews/test/error";
		}
		
		return "cMain.do";
	}

}
