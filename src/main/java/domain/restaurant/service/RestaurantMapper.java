package domain.restaurant.service;

import java.util.List;

import domain.restaurant.vo.RestaurantVO;

public interface RestaurantMapper {
	List<RestaurantVO> restaurantList();
	RestaurantVO selectRestaurant(RestaurantVO vo);
	int insertRestaurant(RestaurantVO vo);
	int updateRestaurant(RestaurantVO vo);
	int deleteRestaurant(RestaurantVO vo);
<<<<<<< HEAD


	List<RestaurantVO> searchRestaurantByManagerId(long managerId);
	List<RestaurantVO> searchRestaurantByName(String name);
=======
	List<RestaurantVO> searchRestaurantByManagerId(long managerId);
	List<RestaurantVO> searchRestaurantName(String name);
	List<RestaurantVO> searchRestaurantRanking();
>>>>>>> ec56c41ff268fe5cccdd26668493e43511588f29
}
