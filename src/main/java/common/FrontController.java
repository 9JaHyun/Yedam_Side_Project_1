package common;

import command.*;

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

import command.LoginCheckController;
import command.LoginController;
import command.LoginFormController;
import command.MainController;
import command.ManagerIdCheckController;
import command.ManagerSignupController;
import command.RestaurantDetail;
import command.SearchRestaurantController;
import command.SignupController;
import command.ManagerSignupFormController;
import command.MemberIdCheckController;
import command.ReserveFormController;
import command.SignupFormController;

@WebServlet(urlPatterns = "*.do")
public class FrontController extends HttpServlet {

    private Map<String, Command> commandMap;

    @Override
    public void init(ServletConfig config) throws ServletException {
        commandMap = new HashMap<>();

        commandMap.put("/cMain.do",new MainController()); // customer 메인페이지
        commandMap.put("/logout.do", new LogoutController());
        commandMap.put("/loginForm.do", new LoginFormController()); // 로그인 화면 페이지
        commandMap.put("/login.do", new LoginController()); // 로그인 기능
        commandMap.put("/loginCheck.do", new LoginCheckController()); // 로그인시 아이디 비밀번호 맞는지 여부 확인
        commandMap.put("/signupForm.do", new SignupFormController()); // 회원가입 페이지
        commandMap.put("/signup.do", new SignupController()); // 회원가입 요청

        commandMap.put("/myPage.do", new MyPageController()); // 마이페이지
        commandMap.put("/memberUpdate.do", new MemberUpdateController()); // 회원정보 수정
        commandMap.put("/memberDelete.do", new MemberDeleteController()); // 회원탈퇴
        commandMap.put("/memberIdCheck.do", new MemberIdCheckController()); // 멤버 아이디 중복여부 확인
        
        commandMap.put("/reserveForm.do", new ReserveFormController()); // 예약화면 페이지
        commandMap.put("/searchRestaurant.do", new SearchRestaurantController());
        commandMap.put("/restaurantDetail.do", new RestaurantDetail());

        // Manager
        commandMap.put("/main.do", new ManagerIndexController());
        commandMap.put("/managerIdCheck.do", new ManagerIdCheckController()); // 멤버 아이디 중복여부 확인
        commandMap.put("/managerSignupForm.do", new ManagerSignupFormController()); // manager 회원가입 페이지
        commandMap.put("/managerSignup.do", new ManagerSignupController()); // 매니저 회원가입 요청
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
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
        request.getRequestDispatcher(filePath).forward(request, response);
    }

    private boolean isRedirect(String filePath) {
        String redirect = "redirect:";  // 9
        return filePath.startsWith(redirect);
    }
}
