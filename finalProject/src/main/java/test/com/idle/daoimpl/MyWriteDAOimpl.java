package test.com.idle.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.MyWriteDAO;
import test.com.idle.vo.BoardVO;

@Repository
@Slf4j
public class MyWriteDAOimpl implements MyWriteDAO {

	@Autowired
	SqlSession sqlSession;
	
	public MyWriteDAOimpl() {
		log.info("BuyDAOimpl");
	}

	@Override
	public List<BoardVO> myWriteBuySelectAll(String userId) {
		log.info("myWriteBuySelectAll:{}",userId);
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("userId", userId);
		filters.put("boardType", 1);
		
		List<BoardVO> vos = sqlSession.selectList("MY_WRITE_BUY_SELECT_ALL",filters);
		
		return vos;
	}
	
	@Override
	public List<BoardVO> myWriteSellSelectAll(String userId) {
		log.info("myWriteSellSelectAll:{}",userId);
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("userId", userId);
		filters.put("boardType", 2);
		
		List<BoardVO> vos = sqlSession.selectList("MY_WRITE_SELL_SELECT_ALL",filters);
		
		return vos;
	}
}
