package web.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import common.Controller;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.manager.vo.ManagerVO;

public class todayReserveController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ManagerService reservationListDAO = new ManagerServiceImpl();
		ManagerVO vo = new ManagerVO();
		vo.setManagerId(Long.parseLong(request.getParameter("id")));
		request.setAttribute("reserves", reservationListDAO.todayReserve(vo));
		request.setAttribute("members", reservationListDAO.todayReserve(vo));
		return "manager/todayReserve";
	}

}
