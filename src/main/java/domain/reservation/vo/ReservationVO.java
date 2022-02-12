package domain.reservation.vo;

import java.sql.Date;

import lombok.Data;

@Data

public class ReservationVO {
	private long reservationId;
	private long restaurantId;
	private long memberId;
	private Date reservationTime;
	private int personnel;
	private String requestContent;
	private String alterName;
	private String alterTel;
	private ReservationStatus status;

<<<<<<< HEAD
=======
	private String restaurantName;

>>>>>>> ec56c41ff268fe5cccdd26668493e43511588f29
	public ReservationVO() {
		this.status = ReservationStatus.WAITING_FOR_ACCEPT;
	}
}
