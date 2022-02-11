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
		ManagerService managerDao = new ManagerServiceImpl();
		ManagerVO vo = new ManagerVO();
		
		HttpSession session = request.getSession();
		
		ManagerVO result = (ManagerVO)session.getAttribute(SessionConst.LOGIN_MANAGER);
		
		if(result != null) {
			request.setAttribute("member", result);
		}else {
			request.setAttribute("message", "조회된 데이터가 없습니다.");
		}
		
		return "manager/myManagerPage";
		
	}

}
