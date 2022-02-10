package web.controller.member;

import common.Controller;
import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUpdateController implements Controller {
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        MemberService MemberDao = new MemberServiceImpl();
        MemberVO vo = new MemberVO();

        vo.setMemberId(Long.parseLong(request.getParameter("memberId")));
        vo.setPassword(request.getParameter("password"));
        vo.setName(request.getParameter("name"));
        vo.setTel(request.getParameter("tel"));
        vo.setEmail(request.getParameter("email"));

        int result = MemberDao.memberUpdate(vo);

        if (result > 0) {
            return "ajax:success";
        } else {
            return "ajax:fail";
        }
    }
}
