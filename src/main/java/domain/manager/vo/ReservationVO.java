package domain.manager.vo;

import java.sql.Date;

import lombok.Data;

@Data

public class ReservationVO {
	private long orderId;
	private long memberId;
	private long restaurantId;
	private Date orderTime;
	private Date orderCount;
}
