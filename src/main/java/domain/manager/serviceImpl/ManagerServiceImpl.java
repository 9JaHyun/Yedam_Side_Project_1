package domain.manager.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import domain.manager.service.ManagerMapper;
import domain.manager.service.ManagerService;
import domain.manager.vo.ManagerVO;
import domain.manager.vo.ReservationListVO;

public class ManagerServiceImpl implements ManagerService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ManagerMapper map = sqlSession.getMapper(ManagerMapper.class);

	@Override
	public List<ReservationListVO> todayReserve(ManagerVO vo) {
		return map.todayReserve(vo);
	}

	@Override
	public List<ManagerVO> managerList() {
		return map.managerList();
	}

	@Override
	public ManagerVO managerSelect(ManagerVO vo) {
		return map.managerSelect(vo);
	}

	@Override
	public int managerInsert(ManagerVO vo) {
		return map.managerInsert(vo);
	}

	@Override
	public int managerUpdate(ManagerVO vo) {
		return map.managerUpdate(vo);
	}

	@Override
	public int managerDelete(ManagerVO vo) {
		return map.managerDelete(vo);
	}

	@Override
	public boolean isIdCheck(String id) {
		return map.isIdCheck(id);
	}
}