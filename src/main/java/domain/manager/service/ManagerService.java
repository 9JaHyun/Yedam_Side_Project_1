package domain.manager.service;

import java.util.List;

import domain.manager.vo.ManagerVO;
import domain.manager.vo.ReservationListVO;

public interface ManagerService {
	List<ReservationListVO> todayReserve(ManagerVO vo);

	List<ManagerVO> managerList();

	ManagerVO managerSelect(ManagerVO vo);

	int managerInsert(ManagerVO vo);

	int managerUpdate(ManagerVO vo);

	int managerDelete(ManagerVO vo);

	boolean isIdCheck(String id);
}