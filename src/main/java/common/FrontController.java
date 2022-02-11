package common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.controller.MainController;
import web.controller.RestaurantDetail;
import web.controller.SearchRestaurantController;
import web.controller.login.LoginCheckController;
import web.controller.login.LoginController;
import web.controller.login.LoginFormController;
import web.controller.manager.ManagerIndexController;
import web.controller.manager.ManagerSignupController;
import web.controller.manager.ManagerSignupFormController;
import web.controller.menu.AddMenuController;
import web.controller.menu.AddMenuFormController;
import web.controller.menu.MenuListController;
import web.controller.menu.MyMenuListController;
import web.controller.reservation.ReserveFormController;
import web.controller.restaurant.AddRestaurantController;
import web.controller.restaurant.AddRestaurantFormController;
import web.controller.restaurant.SelectRestaurantInfoController;
import web.controller.restaurant.UpdateRestaurantController;
import web.controller.restaurant.UpdateRestaurantFormController;
import web.controller.signup.ManagerIdCheckController;
import web.controller.signup.MemberIdCheckController;
import web.controller.signup.SignupController;
import web.controller.signup.SignupFormController;


@WebServlet(urlPatterns = "*.do")
public class FrontController extends HttpServlet {

    private Map<String, Controller> commandMap;

    @Override
    public void init(ServletConfig config) throws ServletException {
        commandMap = new HashMap<>();

        commandMap.put("/cMain.do",new MainController()); // customer 메인페이지
        commandMap.put("/loginForm.do", new LoginFormController()); // 로그인 화면 페이지
        commandMap.put("/login.do", new LoginController()); // 로그인 기능
        commandMap.put("/loginCheck.do", new LoginCheckController()); // 로그인시 아이디 비밀번호 맞는지 여부 확인
        commandMap.put("/signupForm.do", new SignupFormController()); // 회원가입 페이지
        commandMap.put("/signup.do", new SignupController()); // 회원가입 요청
        commandMap.put("/memberIdCheck.do", new MemberIdCheckController()); // 멤버 아이디 중복여부 확인
        commandMap.put("/managerIdCheck.do", new ManagerIdCheckController()); // 멤버 아이디 중복여부 확인
        commandMap.put("/managerSignupForm.do", new ManagerSignupFormController()); // manager 회원가입 페이지
        commandMap.put("/managerSignup.do", new ManagerSignupController()); // 매니저 회원가입 요청
        
        commandMap.put("/reserveForm.do", new ReserveFormController()); // 예약화면 페이지
        commandMap.put("/searchRestaurant.do", new SearchRestaurantController());
        commandMap.put("/restaurantDetail.do", new RestaurantDetail());

        // Manager
        commandMap.put("/main.do", new ManagerIndexController());
        commandMap.put("/addRestaurantForm.do", new AddRestaurantFormController()); // 가게 추가 페이지
        commandMap.put("/addRestaurant.do", new AddRestaurantController()); // 가게 추가기능
        commandMap.put("/updateRestaurantForm.do", new UpdateRestaurantFormController()); // 가게 정보 수정 페이지
        commandMap.put("/selectRestaurantInfo.do", new SelectRestaurantInfoController()); // 가게 정보 가져오기
        commandMap.put("/updateRestaurant.do", new UpdateRestaurantController()); // 가게 정보 수정기능
        commandMap.put("/addMenuForm.do", new AddMenuFormController()); // 메뉴추가페이지로 이동
        commandMap.put("/addMenu.do", new AddMenuController()); // 메뉴 추가 기능
        commandMap.put("/menuList.do", new MenuListController()); // 메뉴목록 보여주는 기능
        commandMap.put("/myMenuList.do", new MyMenuListController()); // 내 가게의 메뉴 목록 보여줌
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String commandPath = requestURI.substring(contextPath.length());

        if (commandMap.get(commandPath) == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
        String filePath = commandMap.get(commandPath).exec(request, response);
        
        if (isRedirect(filePath)) {
            response.sendRedirect(filePath.substring(9));
            return;
        }
        
        if(!filePath.endsWith(".do")) {
			if(filePath.startsWith("ajax:")) {
				// ajax 처리
				PrintWriter out = response.getWriter();
				out.print(filePath.substring(5));
				return;
			} else {
				filePath = filePath + ".tiles";
			}
		}
        System.out.println(filePath);
        request.getRequestDispatcher(filePath).forward(request, response);
    }

    private boolean isRedirect(String filePath) {
        String redirect = "redirect:";  // 9
        return filePath.startsWith(redirect);
    }
}
