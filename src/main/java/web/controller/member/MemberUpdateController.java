package web.controller.member;

import common.Controller;
import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;
<<<<<<< HEAD
import web.SessionConst;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
=======

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
>>>>>>> restaurant_and_reserve

public class MemberUpdateController implements Controller {
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        MemberService MemberDao = new MemberServiceImpl();
        MemberVO vo = new MemberVO();
<<<<<<< HEAD
        HttpSession session = request.getSession();

        vo.setLoginId(request.getParameter("loginId"));
=======

>>>>>>> restaurant_and_reserve
        vo.setMemberId(Long.parseLong(request.getParameter("memberId")));
        vo.setPassword(request.getParameter("password"));
        vo.setName(request.getParameter("name"));
        vo.setTel(request.getParameter("tel"));
        vo.setEmail(request.getParameter("email"));

        int result = MemberDao.memberUpdate(vo);

        if (result > 0) {
<<<<<<< HEAD
            MemberVO resultMember = MemberDao.memberSelect(vo);
            session.setAttribute(SessionConst.LOGIN_MEMBER, resultMember);
=======
>>>>>>> restaurant_and_reserve
            return "ajax:success";
        } else {
            return "ajax:fail";
        }
    }
}
