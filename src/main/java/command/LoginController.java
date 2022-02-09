package command;

import common.Command;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        // Redirect Login
        String redirectParam = request.getParameter("redirectURL");
        if (redirectParam != null) {
            return "redirect:" + redirectParam;
        }
        return "customerViews/main/main";
    }
}
