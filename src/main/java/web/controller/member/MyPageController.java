package web.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import domain.member.vo.MemberVO;
import domain.reservation.service.ReservationService;
import domain.reservation.serviceImpl.ReservationServiceImpl;
import domain.reservation.vo.ReservationVO;
import web.SessionConst;

import java.util.List;

public class MyPageController implements Controller {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        MemberVO result = (MemberVO) session.getAttribute(SessionConst.LOGIN_MEMBER);

        if (result.getMemberId() != 0) {
            request.setAttribute("member", result);
            ReservationService reservationDao = new ReservationServiceImpl();
            List<ReservationVO> reservationList = reservationDao.findByMemberId(result.getMemberId());
            System.out.println(result.getMemberId());
            System.out.println(reservationList);
            if (!reservationList.isEmpty()) {
                request.setAttribute("reservationList", reservationList);
            } else {
                request.setAttribute("message", "조회된 데이터가 없습니다.");
            }
        } else {
            request.setAttribute("message", "조회된 데이터가 없습니다.");
        }

        return "customerViews/member/myPage";
    }
}
