package domain.reservation.serviceImpl;

import common.DataSource;
import domain.reservation.service.ReservationMapper;
import domain.reservation.service.ReservationService;
import domain.reservation.vo.ReservationVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

public class ReservationServiceImpl implements ReservationService {
    private SqlSession sqlSession = DataSource.getInstance().openSession(true);
    private ReservationMapper map = sqlSession.getMapper(ReservationMapper.class);

    @Override
    public List<ReservationVO> reservationList() {
        return map.reservationList();
    }

    @Override
    public ReservationVO reservationSelect(ReservationVO vo) {
        return map.reservationSelect(vo);
    }

    @Override
    public List<ReservationVO> findByMemberId(Long memberId) {
        return map.findByMemberId(memberId);
    }

    @Override
    public int reservationInsert(ReservationVO vo) {
        return map.reservationInsert(vo);
    }

    @Override
    public int reservationDelete(ReservationVO vo) {
        return map.reservationDelete(vo);
    }

    @Override
    public int acceptReservation(ReservationVO vo) {
        return map.acceptReservation(vo);
    }
}
