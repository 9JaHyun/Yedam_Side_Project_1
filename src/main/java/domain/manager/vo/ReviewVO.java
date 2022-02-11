package domain.manager.vo;

import lombok.Data;

@Data

public class ReviewVO {
	private long reviewId;
	private long memberId;
	private long restaurantId;
	private String content;
	private int rating;
}