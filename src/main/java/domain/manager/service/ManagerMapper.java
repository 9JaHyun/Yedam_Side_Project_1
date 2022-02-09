package domain.manager.service;

import java.util.List;

import domain.manager.vo.ReservationListVO;

public interface ManagerMapper {
	public List<ReservationListVO> todayReserve();
}