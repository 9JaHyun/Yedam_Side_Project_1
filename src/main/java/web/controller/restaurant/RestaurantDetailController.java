package web.controller.restaurant;

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
		request.setAttribute("reviewStatus", distributeRating(reviewList));
		request.setAttribute("averageRating", calculateAverage(reviewList));
		return "customerViews/restaurant/restaurantDetail";
	}

	private int[] distributeRating(List<ReviewVO> list) {
		int[] result = new int[5];
		for (ReviewVO reviewVO : list) {
			switch (reviewVO.getRating()) {
				case 1:
					result[0]++;
				case 2:
					result[1]++;
				case 3:
					result[2]++;
				case 4:
					result[3]++;
				case 5:
					result[4]++;
			}
		}
		return result;
	}

	private double calculateAverage(List<ReviewVO> list) {
		return Math.round(list.stream().mapToInt(ReviewVO::getRating)
			.average().orElseGet(() -> {
				return 0;
			}) * 10) / 10.0;
	}
}
