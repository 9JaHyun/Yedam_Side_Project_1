package domain.review.service;

import domain.review.vo.ReviewVO;
import java.util.List;

public interface ReviewMapper {
	List<ReviewVO> reviewList();
	ReviewVO selectReview(ReviewVO vo);
	int insertReview(ReviewVO vo);
	int updateReview(ReviewVO vo);
	int deleteReview(ReviewVO vo);

	List<ReviewVO> searchReviewByMemberId(long memberId);
	List<ReviewVO> searchReviewByRestaurantId(long restaurantId);

	int getReviewCount(ReviewVO vo);
}
