package command;

import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUpdateController implements common.Command {
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(1111);
        MemberService MemberDao = new MemberServiceImpl();
        MemberVO vo = new MemberVO();
        System.out.println(request.getParameter("memberId"));

        vo.setMemberId(Long.parseLong(request.getParameter("memberId")));
        vo.setPassword(request.getParameter("password"));
        vo.setName(request.getParameter("name"));
        vo.setTel(request.getParameter("tel"));
        vo.setEmail(request.getParameter("email"));

        System.out.println(vo.toString());

        int result = MemberDao.memberUpdate(vo);

        if (result > 0) {
            return "ajax:success";
        } else {
            return "ajax:fail";
        }
    }
}
