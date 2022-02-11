package domain.reservation.service;

import domain.reservation.vo.ReservationVO;
import java.util.List;

public interface ReservationMapper {
    List<ReservationVO> reservationList();
    ReservationVO reservationSelect(ReservationVO vo);
    List<ReservationVO> findByMemberId(Long memberId);
    List<ReservationVO> findNotApprovedByRestaurantId(long restaurantId);

    int reservationInsert(ReservationVO vo);
    int reservationDelete(ReservationVO vo);

    int acceptReservation(ReservationVO vo);
}
