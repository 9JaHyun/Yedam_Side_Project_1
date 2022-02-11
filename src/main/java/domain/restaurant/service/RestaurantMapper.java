package domain.restaurant.service;

import java.util.List;

import domain.restaurant.vo.RestaurantVO;

public interface RestaurantMapper {
	List<RestaurantVO> restaurantList();
	RestaurantVO selectRestaurant(RestaurantVO vo);
	int insertRestaurant(RestaurantVO vo);
	int updateRestaurant(RestaurantVO vo);
	int deleteRestaurant(RestaurantVO vo);
	
	List<RestaurantVO> searchRestaurntId(long managerId);
	List<RestaurantVO> searchRestaurantName(String name);
}
