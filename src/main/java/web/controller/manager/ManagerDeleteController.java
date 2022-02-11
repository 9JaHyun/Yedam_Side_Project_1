package web.controller.manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.manager.vo.ManagerVO;
import web.SessionConst;

public class ManagerDeleteController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		

        ManagerService ManagerDao = new ManagerServiceImpl();
        ManagerVO vo = new ManagerVO();
        vo.setManagerId(Long.parseLong(request.getParameter("managerId")));
        int result = ManagerDao.managerDelete(vo);

        if (result > 0) {
            request.setAttribute("message", "회원탈퇴 완료되었습니다.");
        } else {
            request.setAttribute("message", "회원탈퇴 실패하였습니다. 다시 시도해주세요.");
        }
        return "manager/withdrawalResult";
	}

}
