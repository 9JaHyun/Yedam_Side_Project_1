package domain.manager.service;

import java.util.List;

import domain.manager.vo.ManagerVO;

public interface ManagerMapper {
	List<ManagerVO> managerList();
	ManagerVO managerSelect(ManagerVO vo);
	int managerInsert(ManagerVO vo);
	int managerUpdate(ManagerVO vo);
	int managerDelete(ManagerVO vo);
	
	boolean isIdCheck(String id);
}
