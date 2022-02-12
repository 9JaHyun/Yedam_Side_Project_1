package web.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class LoginFormController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String redirectURL = request.getParameter("redirectURL");
		if (redirectURL != null) {
			request.setAttribute("redirectURL", redirectURL);
		}
		return "customerViews/member/loginForm";
	}

}
