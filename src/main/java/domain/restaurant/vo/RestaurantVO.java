package domain.restaurant.vo;

import java.sql.Time;

import lombok.Data;

@Data
public class RestaurantVO {
	private long restaurantId;
	private long managerId;
	private String name;
	private String tel;
	private int reserve_count;
	private String location;
	private String content;
	private Time operationTimeStart;
	private Time operationTimeEnd;
	private Time breakTimeStart;
	private Time breakTimeEnd;
	private int rnum;
}
