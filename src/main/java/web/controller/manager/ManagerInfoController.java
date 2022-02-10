package web.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import common.Controller;

public class ManagerInfoController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "manager/managerInfo";
	}

}
