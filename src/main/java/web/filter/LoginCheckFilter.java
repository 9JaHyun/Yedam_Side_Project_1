package web.filter;

import common.PatternMatchUtils;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.SessionConst;

public class LoginCheckFilter implements Filter {

    private static final String[] whiteList = {"/", "/cMain.do", "/loginForm.do", "/login.do", "/logout.do",
          "/signupForm.do", "/signup.do", "/managerSignupForm.do", "/searchRestaurant.do", "/restaurantDetail.do"};

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
          FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String requestURI = request.getRequestURI();

        HttpServletResponse response = (HttpServletResponse) servletResponse;

        try {
            if (!isLoginCheckPath(requestURI)) {
                HttpSession session = request.getSession(false);
                if (session == null || session.getAttribute(SessionConst.LOGIN_MEMBER) == null
                      || session.getAttribute(SessionConst.LOGIN_MANAGER) == null) {
                    response.sendRedirect("/loginForm.do?redirectURL=" + requestURI);
                    return;
                }
            }
            filterChain.doFilter(request, response);
        } catch (Exception e) {
            throw e;
        }
    }

    public boolean isLoginCheckPath(String requestURI) {
        return PatternMatchUtils.simpleMatch(whiteList, requestURI);
    }
}