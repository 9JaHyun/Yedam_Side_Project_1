package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;

public class LoginFormController implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "customerViews/member/loginForm";
	}
}