package domain.review.service;

import domain.review.vo.ReviewVO;
import java.util.List;

public interface ReviewService {
	List<ReviewVO> reviewList();
	ReviewVO selectReview(ReviewVO vo);
	int insertReview(ReviewVO vo);
	int updateReview(ReviewVO vo);
	int deleteReview(ReviewVO vo);
	
	List<ReviewVO> searchReviewByMemberId(long managerId);
	List<ReviewVO> searchReviewByRestaurantId(long managerId);

	int getReviewCount(ReviewVO vo);
}
