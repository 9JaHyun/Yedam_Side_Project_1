package command.man.vo;

import java.sql.Date;

import lombok.Data;

@Data

public class restaurantVO {
	private long restaurantId;
	private String name;
	private String tel;
	private int reserve_count;
	private String location;
	private String content;
	private Date operation_time_start;
	private Date operation_time_end;
	private Date break_time_start;
	private Date break_time_end;
}
