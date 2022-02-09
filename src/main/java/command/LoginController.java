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

public class LoginController implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String author = request.getParameter("author");
		
		HttpSession session = request.getSession();
		
		if(author.equals("customer")) {
			MemberService memberDAO = new MemberServiceImpl();
			MemberVO vo = new MemberVO();
			vo.setLoginId(id);
			vo.setPassword(password);
			vo = memberDAO.memberSelect(vo);
			if(vo != null) {
				session.setAttribute("user", vo);
			} else {
				request.setAttribute("message", "유저 아이디 또는 비밀번호가 일치하지 않습니다.");
				return "test/error";
			}
		} else if(author.equals("manager")) {
			ManagerService managerDAO = new ManagerServiceImpl();
			ManagerVO vo = new ManagerVO();
			vo.setLoginId(id);
			vo.setPassword(password);
			vo = managerDAO.managerSelect(vo);
			if(vo != null) {
				session.setAttribute("user", vo);
			} else {
				request.setAttribute("message", "유저 아이디 또는 비밀번호가 일치하지 않습니다.");
				return "test/error";
			}
		}
		return "main.do";
	}

}
