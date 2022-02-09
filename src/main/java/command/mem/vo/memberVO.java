package command.mem.vo;

import java.sql.Date;

import lombok.Data;

@Data

public class memberVO {
	private long memberId;
	private String loginId;
	private String password;
	private String email;
	private String tel;
	private Date createdAt;
	private Date updatedAt;
}
