package web.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.manager.vo.ManagerVO;

public class ManagerUpdateController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ManagerService ManagerDao = new ManagerServiceImpl();
        ManagerVO vo = new ManagerVO();

        vo.setPassword(request.getParameter("password"));
        vo.setEmail(request.getParameter("email"));
        vo.setTel(request.getParameter("tel"));

        int result = ManagerDao.managerUpdate(vo);

        if (result > 0) {
            return "ajax:success";
        } else {
            return "ajax:fail";
        }
	}

}
