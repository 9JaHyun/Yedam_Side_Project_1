package web.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.manager.vo.ManagerVO;
import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;

public class LoginCheckController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String author = request.getParameter("author");
		
		if(author.equals("customer")) {
			MemberService memberDAO = new MemberServiceImpl();
			MemberVO vo = new MemberVO();
			vo.setLoginId(id);
			vo.setPassword(password);
			vo = memberDAO.memberSelect(vo);
			if(vo == null) {
				return "ajax:0";
			}
		} else if(author.equals("manager")) {
			ManagerService managerDAO = new ManagerServiceImpl();
			ManagerVO vo = new ManagerVO();
			vo.setLoginId(id);
			vo.setPassword(password);
			vo = managerDAO.managerSelect(vo);
			if(vo == null) {
				return "ajax:0";
			}
		}
		return "ajax:1";
	}

}
