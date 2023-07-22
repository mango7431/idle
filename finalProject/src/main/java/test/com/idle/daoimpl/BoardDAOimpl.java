package test.com.idle.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.BoardDAO;
import test.com.idle.vo.BoardVO;

@Repository
@Slf4j
public class BoardDAOimpl implements BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public BoardDAOimpl() {
		log.info("BoardDAOimpl()...");
	}

	@Override
	public List<BoardVO> boardSelectAll(String category, Integer minPrice, Integer maxPrice, Integer board_type, String deal_region) {
		log.info("selectAll...");
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("category", category);
		filters.put("minPrice", minPrice);
		filters.put("maxPrice", maxPrice);
		filters.put("board_type", board_type);
		filters.put("deal_region", deal_region);
		List<BoardVO> vos = sqlSession.selectList("B_SELECTALL",filters);
		
		return vos;
	}
	
	@Override
	public List<BoardVO> boardSelectAll(Integer minPrice, Integer maxPrice, Integer board_type, String deal_region) {
		log.info("selectAll...");
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("minPrice", minPrice);
		filters.put("maxPrice", maxPrice);
		filters.put("board_type", board_type);
		filters.put("deal_region", deal_region);
		List<BoardVO> vos = sqlSession.selectList("B_SELECTALL",filters);
		
		return vos;
	}

	@Override
	public List<BoardVO> boardSelectAllViews(Integer minPrice, Integer maxPrice, Integer board_type, String deal_region) {
		log.info("selectAll...{},{}",minPrice,maxPrice);
		log.info("selectAll...{}",board_type);
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("minPrice", minPrice);
		filters.put("maxPrice", maxPrice);
		filters.put("board_type", board_type);
		filters.put("deal_region", deal_region);
		List<BoardVO> vos = sqlSession.selectList("B_SELECTALL_VIEWS",filters);
		
		return vos;
	}

	@Override
	public List<BoardVO> searchList(String searchWord) {
		log.info("searchList...{}",searchWord);
		return sqlSession.selectList("B_SEARCH_LIST","%"+searchWord+"%");
	}

	@Override
	public BoardVO selectOne(BoardVO vo) {
		log.info("selectOne()...{}",vo);
		
		BoardVO vo2 = sqlSession.selectOne("B_SELECT_ONE", vo);
		
		return vo2;
	}

	@Override
	public int viewCountUp(BoardVO vo) {
		log.info("viewCountUp()...{}",vo);
		
		int flag = 0;
		try {
			flag = sqlSession.update("VIEW_COUNT_UP",vo);			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public int insert(BoardVO vo) {
		log.info("insert()...{}",vo);
		
		int flag = 0;
		try {			
			flag = sqlSession.insert("B_INSERT",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public int update(BoardVO vo) {
		log.info("update()...{}",vo);
		int flag = 0;
		try {
			flag = sqlSession.update("B_UPDATE",vo);			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public int delete(BoardVO vo) {
		log.info("delete()...{}",vo);
		int flag = 0;
		try {
			flag = sqlSession.delete("B_DELETE",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public int changeStatus(BoardVO vo) {
		log.info("changeStatus()...{}",vo);
		
		int flag = 0;
		try {
			flag = sqlSession.update("BOARD_CHANGE_STATUS",vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public List<BoardVO> selectAllMain() {
		log.info("selectAllMain()...");
		List<BoardVO> list = sqlSession.selectList("B_SELECTALL_MAIN");
		return list;
	}

	@Override
	public List<BoardVO> selectAllBuy() {
		log.info("selectAllBuy()...");
		List<BoardVO> list = sqlSession.selectList("B_SELECTALL_BUY");
		return list;
	}

	@Override
	public List<BoardVO> selectAllSell() {
		log.info("selectAllSell()...");
		List<BoardVO> list = sqlSession.selectList("B_SELECTALL_SELL");
		return list;
	}

}
