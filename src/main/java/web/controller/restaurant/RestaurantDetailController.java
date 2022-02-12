package web.controller.restaurant;

import common.RatingCalcUtils;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.serviceImpl.RestaurantServiceImpl;
import domain.restaurant.vo.RestaurantVO;
import domain.review.service.ReviewService;
import domain.review.serviceImpl.ReviewServiceImpl;
import domain.review.vo.ReviewVO;
import java.util.ArrayList;
import java.util.List;
import java.util.OptionalDouble;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class RestaurantDetailController implements Controller {
	RestaurantService restaurantDao = new RestaurantServiceImpl();
	ReviewService reviewDao = new ReviewServiceImpl();
	RatingCalcUtils ratingCalcUtils = new RatingCalcUtils();


	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		RestaurantVO restaurantVO = new RestaurantVO();
		long restaurantId = Long.parseLong(request.getParameter("restaurantId"));

		restaurantVO.setRestaurantId(restaurantId);
		restaurantVO = restaurantDao.selectRestaurant(restaurantVO);

		List<ReviewVO> reviewList = reviewDao.searchReviewByRestaurantId(restaurantId);

		request.setAttribute("restaurant", restaurantVO);
		request.setAttribute("reviews", reviewList);
		request.setAttribute("reviewCount", reviewList.size());
		request.setAttribute("reviewStatus", ratingCalcUtils.distributeRating(reviewList));
		request.setAttribute("averageRating", ratingCalcUtils.calculateAverage(reviewList));
		return "customerViews/restaurant/restaurantDetail";
	}
}
