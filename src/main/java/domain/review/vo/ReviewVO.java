package domain.review.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class ReviewVO {
    private long reviewId;
    private long memberId;
    private long restaurantId;
    private long content;
    private String image;
    private int rating;
    private Date createdAt;
}
