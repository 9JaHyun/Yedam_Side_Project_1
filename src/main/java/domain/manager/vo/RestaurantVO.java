package domain.manager.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RestaurantVO {
	private long restaurantId;
	private String name;
	private String tel;
	private int reserve_count;
	private String location;
	private String content;
	private Date operationTimeStart;
	private Date operationTimeEnd;
	private Date breakTimeStart;
	private Date breakTimeEnd;
}
