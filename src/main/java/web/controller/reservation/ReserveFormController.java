package web.controller.reservation;

import common.Controller;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.restaurant.vo.RestaurantVO;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.controller.reservation.dto.ReserveFormRequestDto;

public class ReserveFormController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		RestaurantService restaurantDao = new RestaurantServiceImpl();

		RestaurantVO vo = new RestaurantVO();
		vo.setRestaurantId(Long.parseLong(request.getParameter("restaurantId")));
		vo = restaurantDao.selectRestaurant(vo);

		ReserveFormRequestDto requestDto = new ReserveFormRequestDto();
		requestDto.setRestaurantName(vo.getName());

		if (!checkReservationModal(request)) {
			requestDto.setReservationTime(Date.valueOf(request.getParameter("date")));
			requestDto.setPersonnel(Integer.parseInt(request.getParameter("personnel")));
		} else {
			throw new AssertionError("파라미터값이 없습니다.");
		}

		request.setAttribute("reservationInfo", requestDto);
		return "customerViews/restaurant/reserveForm";
	}

	private boolean checkReservationModal(HttpServletRequest request) {
		return request.getParameter("date") == null
			&& request.getParameter("personnel") == null;
	}
}