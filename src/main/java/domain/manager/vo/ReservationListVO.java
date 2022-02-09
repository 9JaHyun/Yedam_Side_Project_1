package domain.manager.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationListVO {
	private long orderId;
	private String memberName;
	private long memberId;
	private long restaurantId;
	private Date orderTime;
	private int orderCount;
	private String tel;
}
