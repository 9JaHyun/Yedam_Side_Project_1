package domain.member.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private long memberId;
	private String memberName;
	private String loginId;
	private String password;
	private String email;
	private String tel;
	private Date createdAt;
	private Date updatedAt;
}
