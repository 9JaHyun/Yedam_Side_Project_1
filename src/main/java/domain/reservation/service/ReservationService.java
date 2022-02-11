package domain.reservation.service;

import domain.reservation.vo.ReservationVO;
import java.util.List;

public interface ReservationService {
    List<ReservationVO> reservationList();
    ReservationVO reservationSelect(ReservationVO vo);
    List<ReservationVO> findByMemberId(long memberId);

    int reservationInsert(ReservationVO vo);
    int reservationDelete(ReservationVO vo);

    List<ReservationVO> findNotApprovedByRestaurantId(long restaurantId);
    int acceptReservation(ReservationVO vo);

}
