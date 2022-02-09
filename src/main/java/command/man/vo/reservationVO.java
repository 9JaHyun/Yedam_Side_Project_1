package command.man.vo;

import java.sql.Date;

import lombok.Data;

@Data

public class reservationVO {
	private long order_id;
	private long member_id;
	private long restaurantId;
	private Date orderTime;
	private Date orderCount;
}
