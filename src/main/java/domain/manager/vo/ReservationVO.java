package domain.manager.vo;

import java.sql.Date;

import lombok.Data;

@Data

public class ReservationVO {
	private long reservationId;
	private long restaurantId;
	private Date reservationTime;
	private int reservationCount;
	private String reservationContent;
}
