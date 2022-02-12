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
		return map.restaurantList();
	}

	@Override
	public RestaurantVO selectRestaurant(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return map.selectRestaurant(vo);
	}

	@Override
	public int insertRestaurant(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return map.insertRestaurant(vo);
	}

	@Override
	public int updateRestaurant(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return map.updateRestaurant(vo);
	}

	@Override
	public int deleteRestaurant(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return map.deleteRestaurant(vo);
	}

	@Override
	public List<RestaurantVO> searchRestaurantByManagerId(long managerId) { return map.searchRestaurantByManagerId(managerId); }

	@Override
	public List<RestaurantVO> searchRestaurantName(String name) {
		return map.searchRestaurantName(name);
	}

	@Override
	public List<RestaurantVO> searchRestaurantRanking() { return map.searchRestaurantRanking(); }

}
