package web.controller.member;

import common.Controller;
import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteController implements Controller {
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        // 세션 삭제
        HttpSession session = request.getSession();
        session.invalidate();

        // DB 삭제
        MemberService MemberDao = new MemberServiceImpl();
        MemberVO vo = new MemberVO();
        vo.setMemberId(Long.parseLong(request.getParameter("memberId")));
        int result = MemberDao.memberDelete(vo);

        if (result > 0) {
            request.setAttribute("message", "회원탈퇴 완료되었습니다.");
        } else {
            request.setAttribute("message", "회원탈퇴 실패하였습니다. 다시 시도해주세요.");
        }
        return "customerViews/member/withdrawalResult";
    }
}
