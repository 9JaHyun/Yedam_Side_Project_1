package web.controller.login;

import common.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        if (session != null) {
            session.invalidate();
        }

        return "cMain.do";
    }
}
