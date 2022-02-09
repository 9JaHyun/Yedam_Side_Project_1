package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;

public class todayReserve implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ManagerService reservationListDAO = new ManagerServiceImpl();
		
		request.setAttribute("reserves", reservationListDAO.todayReserve());
		request.setAttribute("members", reservationListDAO.todayReserve());
		return "manager/todayReserve";
	}
}