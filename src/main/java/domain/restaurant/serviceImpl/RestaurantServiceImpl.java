package domain.restaurant.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import domain.restaurant.service.RestaurantMapper;
import domain.restaurant.service.RestaurantService;
import domain.restaurant.vo.RestaurantVO;

public class RestaurantServiceImpl implements RestaurantService {
	
	private SqlSession session = DataSource.getInstance().openSession(true);
	private RestaurantMapper map = session.getMapper(RestaurantMapper.class);
	
	@Override
	public List<RestaurantVO> restaurantList() {
<<<<<<< HEAD
=======
		// TODO Auto-generated method stub
>>>>>>> ec56c41ff268fe5cccdd26668493e43511588f29
		return map.restaurantList();
	}

	@Override
	public RestaurantVO selectRestaurant(RestaurantVO vo) {
<<<<<<< HEAD
=======
		// TODO Auto-generated method stub
>>>>>>> ec56c41ff268fe5cccdd26668493e43511588f29
		return map.selectRestaurant(vo);
	}

	@Override
	public int insertRestaurant(RestaurantVO vo) {
		return map.insertRestaurant(vo);
	}

	@Override
	public int updateRestaurant(RestaurantVO vo) {
<<<<<<< HEAD
=======
		// TODO Auto-generated method stub
>>>>>>> ec56c41ff268fe5cccdd26668493e43511588f29
		return map.updateRestaurant(vo);
	}

	@Override
	public int deleteRestaurant(RestaurantVO vo) {
<<<<<<< HEAD
=======
		// TODO Auto-generated method stub
>>>>>>> ec56c41ff268fe5cccdd26668493e43511588f29
		return map.deleteRestaurant(vo);
	}

	@Override
<<<<<<< HEAD
	public List<RestaurantVO> searchRestaurantByManagerId(long managerId) {
		return map.searchRestaurantByManagerId(managerId);
	}
=======
	public List<RestaurantVO> searchRestaurantByManagerId(long managerId) { return map.searchRestaurantByManagerId(managerId); }
>>>>>>> ec56c41ff268fe5cccdd26668493e43511588f29

	@Override
	public List<RestaurantVO> searchRestaurantByName(String name) {
		return map.searchRestaurantByName(name);
	}

	@Override
	public List<RestaurantVO> searchRestaurantRanking() { return map.searchRestaurantRanking(); }

}
