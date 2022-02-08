package domain.manager.vo;

import lombok.Data;

@Data

public class ManagerVO {
	private long managerId;
	private long restaurantId;
	private String loginId;
	private String password;
	private String email;
	private String tel;
}
