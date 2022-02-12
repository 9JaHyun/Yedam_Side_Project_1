package domain.menu.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.DataSource;
import domain.menu.service.MenuMapper;
import domain.menu.service.MenuService;
import domain.menu.vo.MenuVO;

public class MenuServiceImpl implements MenuService {

	private SqlSession session = DataSource.getInstance().openSession(true);
	private MenuMapper map = session.getMapper(MenuMapper.class);
	
	@Override
	public List<MenuVO> menuAll() {
		// TODO Auto-generated method stub
		return map.menuAll();
	}

	@Override
	public List<MenuVO> menuSelectList(long restaurantId) {
		// TODO Auto-generated method stub
		return map.menuSelectList(restaurantId);
	}

	@Override
	public MenuVO menuSelect(MenuVO vo) {
		// TODO Auto-generated method stub
		return map.menuSelect(vo);
	}

	@Override
	public int menuInsert(MenuVO vo) {
		// TODO Auto-generated method stub
		return map.menuInsert(vo);
	}

	@Override
	public int menuUpdate(MenuVO vo) {
		// TODO Auto-generated method stub
		return map.menuUpdate(vo);
	}

	@Override
	public int menuDelete(MenuVO vo) {
		// TODO Auto-generated method stub
		return map.menuDelete(vo);
	}

}
