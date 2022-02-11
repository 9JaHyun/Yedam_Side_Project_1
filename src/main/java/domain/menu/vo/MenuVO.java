package domain.menu.vo;

import lombok.Data;

@Data

public class MenuVO {
	private long menuId;
	private long restaurantId;
	private long managerId;
	private String name;
	private int cost;
	private String picture;
}
