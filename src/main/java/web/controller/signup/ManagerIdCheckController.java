package web.controller.signup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;

public class ManagerIdCheckController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		ManagerService managerDAO = new ManagerServiceImpl();
		boolean result = managerDAO.isManagerIdCheck(id);
		if(!result) {
			return "ajax:0";
		}
		return "ajax:1";
	}

}
