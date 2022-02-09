package command.man.vo;

import lombok.Data;

@Data

public class menuVO {
	private long menuId;
	private long restaurantId;
	private String name;
	private int cost;
	private String picture;
}
