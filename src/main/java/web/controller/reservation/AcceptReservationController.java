package web.controller.reservation;

import common.Controller;
import domain.reservation.service.ReservationService;
import domain.reservation.serviceImpl.ReservationServiceImpl;
import domain.reservation.vo.ReservationStatus;
import domain.reservation.vo.ReservationVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AcceptReservationController implements Controller {

    private ReservationService reservationDao = new ReservationServiceImpl();
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        long reservationId = Long.parseLong(request.getParameter("reservationId"));
        ReservationVO reservationVO = new ReservationVO();
        reservationVO.setReservationId(reservationId);
        reservationVO.setStatus(ReservationStatus.ACCEPT);

        reservationDao.acceptReservation(reservationVO);
        return "main/main";
    }
}
