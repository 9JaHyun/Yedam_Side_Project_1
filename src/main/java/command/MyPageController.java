package command;

import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageController implements common.Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        MemberService memberDao = new MemberServiceImpl();
        MemberVO vo = new MemberVO();
        // 임의 회원 값입니다. todo
        vo.setLoginId("hong");
        vo.setPassword("1234");

        MemberVO result = memberDao.memberSelect(vo);

        if (result != null) {
            request.setAttribute("member", result);
        } else {
            request.setAttribute("message", "조회된 데이터가 없습니다.");
        }

        return "customerViews/member/myPage";
    }
}
