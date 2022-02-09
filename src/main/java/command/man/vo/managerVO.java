package command.man.vo;

import lombok.Data;

@Data

public class managerVO {
	private long managerId;
	private long restaurantId;
	private String loginId;
	private String password;
	private String email;
	private String tel;
}
