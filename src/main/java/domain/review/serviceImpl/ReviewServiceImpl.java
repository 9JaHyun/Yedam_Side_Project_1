package domain.review.serviceImpl;

import common.DataSource;
import domain.review.service.ReviewMapper;
import domain.review.service.ReviewService;
import domain.review.vo.ReviewVO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

public class ReviewServiceImpl implements ReviewService {
	
	private SqlSession session = DataSource.getInstance().openSession(true);
	private ReviewMapper map = session.getMapper(ReviewMapper.class);


	@Override
	public List<ReviewVO> reviewList() {
		return map.reviewList();
	}

	@Override
	public ReviewVO selectReview(ReviewVO vo) {
		return map.selectReview(vo);
	}

	@Override
	public int insertReview(ReviewVO vo) {
		return map.insertReview(vo);
	}

	@Override
	public int updateReview(ReviewVO vo) {
		return map.updateReview(vo);
	}

	@Override
	public int deleteReview(ReviewVO vo) {
		return map.deleteReview(vo);
	}

	@Override
	public List<ReviewVO> searchReviewByMemberId(long managerId) {
		return map.searchReviewByMemberId(managerId);
	}

	@Override
	public List<ReviewVO> searchReviewByRestaurantId(long managerId) {
		return map.searchReviewByRestaurantId(managerId);
	}

	@Override
	public int getReviewCount(ReviewVO vo) {
		return map.getReviewCount(vo);
	}
}
