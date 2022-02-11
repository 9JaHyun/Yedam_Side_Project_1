package domain.reservation.service;

import domain.reservation.vo.ReservationVO;
import java.util.List;

public interface ReservationService {
    List<ReservationVO> reservationList();
    ReservationVO reservationSelect(ReservationVO vo);
    List<ReservationVO> findByMemberId(Long memberId);

    int reservationInsert(ReservationVO vo);
    int reservationDelete(ReservationVO vo);

    int acceptReservation(ReservationVO vo);
}
