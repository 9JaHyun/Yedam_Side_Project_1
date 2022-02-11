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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RestaurantVO selectRestaurant(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertRestaurant(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return map.insertRestaurant(vo);
	}

	@Override
	public int updateRestaurant(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRestaurant(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RestaurantVO> searchRestaurntId(long managerId) {
		// TODO Auto-generated method stub
		return map.searchRestaurntId(managerId);
	}

	@Override
	public List<RestaurantVO> searchRestaurantName(String name) {
		return map.searchRestaurantName(name);
	}

}
