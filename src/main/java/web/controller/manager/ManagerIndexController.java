package web.controller.manager;

import common.Controller;
import common.RatingCalcUtils;
import domain.manager.vo.ManagerVO;
import domain.reservation.service.ReservationService;
import domain.reservation.serviceImpl.ReservationServiceImpl;
import domain.reservation.vo.ReservationVO;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.restaurant.vo.RestaurantVO;
import domain.review.service.ReviewService;
import domain.review.serviceImpl.ReviewServiceImpl;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.SessionConst;

public class ManagerIndexController implements Controller {
    RestaurantService restaurantDao = new RestaurantServiceImpl();
    ReservationService reservationDao = new ReservationServiceImpl();
    ReviewService reviewDao = new ReviewServiceImpl();
    RatingCalcUtils ratingCalcUtils = new RatingCalcUtils();

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        ManagerVO managerVO = (ManagerVO) request.getSession()
              .getAttribute(SessionConst.LOGIN_MANAGER);
        request.setAttribute("manager", managerVO);

        List<RestaurantVO> restaurantList = restaurantDao.searchRestaurantByManagerId(
              managerVO.getManagerId());
        System.out.println(restaurantList);
        long restaurantId = restaurantList.get(0).getRestaurantId();
        List<ReservationVO> reservationList = reservationDao.findNotApprovedByRestaurantId(
            restaurantId);
        request.setAttribute("notApproved", reservationList);
        request.setAttribute("ratingAverage",
            ratingCalcUtils.calculateAverage(reviewDao.searchReviewByRestaurantId(restaurantId)));
        request.setAttribute("ratingInfo",
            ratingCalcUtils.distributeRating(reviewDao.searchReviewByRestaurantId(restaurantId)));
        return "main/main";
    }
}
