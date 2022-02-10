package web.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class ManagerSignupFormController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "customerViews/member/managerSignupForm";
	}

}
