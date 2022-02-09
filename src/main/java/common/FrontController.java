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

import command.LoginFormController;
import command.MainController;
import command.RestaurantDetail;
import command.SearchRestaurantController;
import command.ManagerSignupFormController;
import command.ReserveFormController;
import command.SignupFormController;

@WebServlet(urlPatterns = "*.do")
public class FrontController extends HttpServlet {

    private Map<String, Command> commandMap;

    @Override
    public void init(ServletConfig config) throws ServletException {
        commandMap = new HashMap<>();

        commandMap.put("/cMain.do",new MainController()); // customer 메인페이지
        commandMap.put("/loginForm.do", new LoginFormController()); // 로그인 화면 페이지
        commandMap.put("/signupForm.do", new SignupFormController()); // 회원가입 페이지
        commandMap.put("/managerSignupForm.do", new ManagerSignupFormController()); // manager 회원가입 페이지
        commandMap.put("/reserveForm.do", new ReserveFormController()); // 예약화면 페이지
        commandMap.put("/searchRestaurant.do", new SearchRestaurantController());
        commandMap.put("/restaurantDetail.do", new RestaurantDetail());
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
}
