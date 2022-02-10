package command;

import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;
import web.SessionConst;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyPageController implements common.Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        MemberService memberDao = new MemberServiceImpl();
        MemberVO vo = new MemberVO();

        HttpSession session = request.getSession();

        MemberVO result = (MemberVO) session.getAttribute(SessionConst.LOGIN_MEMBER);

        if (result != null) {
            request.setAttribute("member", result);
        } else {
            request.setAttribute("message", "조회된 데이터가 없습니다.");
        }

        return "customerViews/member/myPage";
    }
}
