package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Command;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.manager.vo.ManagerVO;
import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;
import web.SessionConst;

public class LoginController implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String author = request.getParameter("author");
<<<<<<< HEAD
=======
		System.out.println(id);
		System.out.println(password);
		System.out.println(author);
    
     String redirectParam = request.getParameter("redirectURL");
        if (redirectParam != null) {
            return "redirect:" + redirectParam;
        }
>>>>>>> d25cb0d (docs : ajax 로그인 필터에 안걸리게 수정)
		
		HttpSession session = request.getSession(true);
		
		if(author.equals("customer")) {
			MemberService memberDAO = new MemberServiceImpl();
			MemberVO vo = new MemberVO();
			vo.setLoginId(id);
			vo.setPassword(password);
			vo = memberDAO.memberSelect(vo);
<<<<<<< HEAD
			if(vo != null) {
				session.setAttribute("user", vo);
			}
=======
			session.setAttribute(SessionConst.LOGIN_MEMBER, vo);
			
>>>>>>> d25cb0d (docs : ajax 로그인 필터에 안걸리게 수정)
		} else if(author.equals("manager")) {
			ManagerService managerDAO = new ManagerServiceImpl();
			ManagerVO vo = new ManagerVO();
			vo.setLoginId(id);
			vo.setPassword(password);
			vo = managerDAO.managerSelect(vo);
<<<<<<< HEAD
			if(vo != null) {
				session.setAttribute("user", vo);
			} 
		}
		return "main.do";
=======
			session.setAttribute(SessionConst.LOGIN_MANAGER, vo);
			return "main.do";
		}
		return "cMain.do";
		
>>>>>>> d25cb0d (docs : ajax 로그인 필터에 안걸리게 수정)
	}

}
