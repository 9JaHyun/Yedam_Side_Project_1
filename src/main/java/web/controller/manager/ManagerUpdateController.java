package web.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.manager.vo.ManagerVO;
import web.SessionConst;

public class ManagerUpdateController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ManagerService ManagerDao = new ManagerServiceImpl();
        HttpSession session = request.getSession();
        ManagerVO vo = (ManagerVO) session.getAttribute(SessionConst.LOGIN_MANAGER);
        System.out.println(request.getParameter("name"));
        vo.setName(request.getParameter("name"));
        vo.setEmail(request.getParameter("email"));
        vo.setTel(request.getParameter("tel"));
        vo.setPassword(request.getParameter("password"));
        
        System.out.println(vo);
        
        int result = ManagerDao.managerUpdate(vo);

        if (result > 0) {
        	ManagerVO resultManager = ManagerDao.managerSelect(vo);
        	System.out.println(resultManager);
        	session.setAttribute(SessionConst.LOGIN_MANAGER, resultManager);
        	System.out.println(session.getAttribute(SessionConst.LOGIN_MANAGER));
            return "manager/myManagerPage";
        } else {
        	return "ajax:fail";
            
        }
	}

}
