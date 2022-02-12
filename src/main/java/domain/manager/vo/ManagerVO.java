package domain.manager.vo;

import lombok.Data;

@Data

public class ManagerVO {
	private long managerId;
	private String name;
	private String loginId;
	private String password;
	private String email;
	private String tel;
}
