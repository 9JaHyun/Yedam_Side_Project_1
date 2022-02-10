package domain.manager.vo;

import lombok.Data;

@Data

public class MenuVO {
	private long menuId;
	private long restaurantId;
	private long manager_id;
	private String name;
	private int cost;
	private String picture;
}
