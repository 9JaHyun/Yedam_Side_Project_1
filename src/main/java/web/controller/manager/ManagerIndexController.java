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
import domain.review.vo.ReviewVO;
import java.util.ArrayList;
import java.util.Arrays;
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
        System.out.println(reservationList);
        if(reservationList.size() > 0){
            request.setAttribute("name", reservationList.get(0).getAlterName());
            request.setAttribute("notApproved", reservationList);
        }
        request.setAttribute("ratingAverage",
            ratingCalcUtils.calculateAverage(reviewDao.searchReviewByRestaurantId(restaurantId)));
        int[] ratingInfo = ratingCalcUtils.distributeRating(
            reviewDao.searchReviewByRestaurantId(restaurantId));
        System.out.println(Arrays.toString(ratingInfo));
        request.setAttribute("ratingInfo",
            ratingInfo);
        request.setAttribute("ratingAverageInfo", calcRatingAverageInfo(ratingInfo));
        return "main/main";
    }

    private double[] calcRatingAverageInfo(int[] ratingInfo) {
        double[] result = new double[5];
        result[0] = ((double) ratingInfo[0] / (ratingInfo[0] + ratingInfo[1] + ratingInfo[2] + ratingInfo[3] + ratingInfo[4]) * 100);
        result[1] = ((double) ratingInfo[1] / (ratingInfo[0] + ratingInfo[1] + ratingInfo[2] + ratingInfo[3] + ratingInfo[4]) * 100);
        result[2] = ((double) ratingInfo[2] / (ratingInfo[0] + ratingInfo[1] + ratingInfo[2] + ratingInfo[3] + ratingInfo[4]) * 100);
        result[3] = ((double) ratingInfo[3] / (ratingInfo[0] + ratingInfo[1] + ratingInfo[2] + ratingInfo[3] + ratingInfo[4]) * 100);
        result[4] = ((double) ratingInfo[4] / (ratingInfo[0] + ratingInfo[1] + ratingInfo[2] + ratingInfo[3] + ratingInfo[4]) * 100);
        return result;
    }
}
