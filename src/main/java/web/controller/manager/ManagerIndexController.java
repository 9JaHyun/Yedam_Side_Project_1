package web.controller.manager;

import common.Controller;
import domain.manager.vo.ManagerVO;
import domain.reservation.service.ReservationService;
import domain.reservation.serviceImpl.ReservationServiceImpl;
import domain.reservation.vo.ReservationVO;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.restaurant.vo.RestaurantVO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.SessionConst;

public class ManagerIndexController implements Controller {
    RestaurantService restaurantDao = new RestaurantServiceImpl();
    ReservationService reservationDao = new ReservationServiceImpl();

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        ManagerVO managerVO = (ManagerVO) request.getSession()
              .getAttribute(SessionConst.LOGIN_MANAGER);
        request.setAttribute("manager", managerVO);

        List<RestaurantVO> restaurantList = restaurantDao.searchRestaurantByManagerId(
              managerVO.getManagerId());
        System.out.println(restaurantList);
        List<ReservationVO> reservationList = reservationDao.findNotApprovedByRestaurantId(
              restaurantList.get(0).getRestaurantId());
        request.setAttribute("notApproved", reservationList);
        System.out.println(reservationList);
        return "main/main";
    }
}
