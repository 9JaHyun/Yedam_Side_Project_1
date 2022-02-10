package domain.manager.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationListVO {
	private long reservationId;
	private String name;
	private long memberId;
	private long managerId;
	private long restaurantId;
	private Date reservationTime;
	private int reservationCount;
	private String reservationContent;
	private String tel;
}
