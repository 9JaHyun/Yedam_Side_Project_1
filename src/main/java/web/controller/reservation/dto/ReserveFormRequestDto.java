package web.controller.reservation.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class ReserveFormRequestDto {
    private String restaurantName;
    private Date reservationTime;
    private int personnel;
}
