package web.controller.signup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;

public class SignupController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		vo.setLoginId(request.getParameter("loginId"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("memberName"));
		vo.setEmail(request.getParameter("email"));
		vo.setTel(request.getParameter("tel"));
		
		int result = memberDao.memberInsert(vo);
		
		if (result != 0) {
			request.setAttribute("message", "회원가입 성공하였습니다");
		} else {
			request.setAttribute("message", "회원가입 실패하였습니다");
		}
		return "customerViews/member/signupResult";
	}

}
