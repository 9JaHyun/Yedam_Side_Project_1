package command.man.vo;

import lombok.Data;

@Data

public class reviewVO {
	private long reviewId;
	private long memberId;
	private long restaurantId;
	private String content;
	private int rating;
}
