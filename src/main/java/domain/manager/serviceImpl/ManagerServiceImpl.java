package domain.manager.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import domain.manager.service.ManagerMapper;
import domain.manager.service.ManagerService;
import domain.manager.vo.ReservationListVO;

public class ManagerServiceImpl implements ManagerService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ManagerMapper map = sqlSession.getMapper(ManagerMapper.class);

	@Override
	public List<ReservationListVO> todayReserve() {
		return map.todayReserve();
	}
}