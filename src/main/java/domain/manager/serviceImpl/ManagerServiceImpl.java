package domain.manager.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import domain.manager.service.ManagerMapper;
import domain.manager.service.ManagerService;
import domain.manager.vo.ManagerVO;

public class ManagerServiceImpl implements ManagerService {
	private SqlSession session = DataSource.getInstance().openSession(true);
	private ManagerMapper map = session.getMapper(ManagerMapper.class);	
	
	@Override
	public List<ManagerVO> managerList() {
		// TODO Auto-generated method stub
		return map.managerList();
	}

	@Override
	public ManagerVO managerSelect(ManagerVO vo) {
		// TODO Auto-generated method stub
		return map.managerSelect(vo);
	}

	@Override
	public int managerInsert(ManagerVO vo) {
		// TODO Auto-generated method stub
		return map.managerInsert(vo);
	}

	@Override
	public int managerUpdate(ManagerVO vo) {
		// TODO Auto-generated method stub
		return map.managerUpdate(vo);
	}

	@Override
	public int managerDelete(ManagerVO vo) {
		// TODO Auto-generated method stub
		return map.managerDelete(vo);
	}

	@Override
	public boolean isManagerIdCheck(String id) {
		// TODO Auto-generated method stub
		return map.isManagerIdCheck(id);
	}

}
