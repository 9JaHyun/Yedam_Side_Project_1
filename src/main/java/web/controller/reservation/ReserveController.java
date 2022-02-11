package web.controller.reservation;

import common.Controller;
import domain.member.vo.MemberVO;
import domain.reservation.service.ReservationService;
import domain.reservation.serviceImpl.ReservationServiceImpl;
import domain.reservation.vo.ReservationVO;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.SessionConst;

public class ReserveController implements Controller {
    ReservationService reservationDao = new ReservationServiceImpl();

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        ReservationVO vo = new ReservationVO();
        MemberVO member = (MemberVO) request.getSession().getAttribute(SessionConst.LOGIN_MEMBER);

        if (!isAlterReservation(request)) {
            vo.setAlterName(request.getParameter("name"));
            vo.setAlterTel(request.getParameter("tel"));
        }

        vo.setMemberId(member.getMemberId());
        vo.setRestaurantId(Long.parseLong(request.getParameter("restaurantId")));
        vo.setRequestContent(request.getParameter("requestContent"));
        vo.setReservationTime(Date.valueOf(request.getParameter("date")));
        vo.setPersonnel(Integer.parseInt(request.getParameter("formPersonnel")));

        if (reservationDao.reservationInsert(vo) == 1) {
            System.out.println("예약이 성공적으로 완료되었습니다.");
            request.setAttribute("message", "예약이 성공적으로 완료되었습니다.");
        } else {
            System.out.println("예약이 성공적으로 완료되었습니다.");
            request.setAttribute("message", "예약 실패 :(");
        }

        return "customerViews/main/main";
    }
    private boolean isAlterReservation(HttpServletRequest request) {
        return request.getParameter("name") == null &&
              request.getParameter("tel") == null;
    }
}
