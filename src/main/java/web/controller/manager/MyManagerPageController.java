package web.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.manager.vo.ManagerVO;
import web.SessionConst;

public class MyManagerPageController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		System.out.println("getsession");
		System.out.println(session);
		
		ManagerVO result = (ManagerVO) session.getAttribute(SessionConst.LOGIN_MANAGER);
		System.out.println(result);
		
		if (result != null) {
			request.setAttribute("member", result);
		} else {
			request.setAttribute("message", "조회된 데이터가 없습니다.");
			System.out.println(result);
		}

		return "manager/myManagerPage";
	}
}