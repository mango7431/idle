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
		
		List<BoardVO> vos = sqlSession.selectList("MY_WRITE_SELECT_ALL",filters);
		
		return vos;
	}
	
	@Override
	public List<BoardVO> myWriteSellSelectAll(String userId) {
		log.info("myWriteSellSelectAll:{}",userId);
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("userId", userId);
		filters.put("boardType", 2);
		
		List<BoardVO> vos = sqlSession.selectList("MY_WRITE_SELECT_ALL",filters);
		
		return vos;
	}

	//상위로이동
	@Override
	public int dateupdate(int board_num) {
		log.info("dateupdate:{}",board_num);
		
		int flag = sqlSession.update("W_DATE_UPDATE",board_num);
		return flag;
	}

	//비공개
	@Override
	public int statusupdate(int board_num, int board_status) {
		log.info("hiddenupdate:{},{}",board_num,board_status);
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("board_num", board_num);
		filters.put("board_status", board_status);
		
		int flag = sqlSession.update("W_STATUS_UPDATE",filters);
		return flag;
	}

	//board_status를 2로 변경  //이거 지우고 위에껄로 바꿔도 될듯
	@Override
	public void updateBoardStatus(int board_num, int board_status) {
		log.info("updateBoardStatus:{},{}",board_num,board_status);
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("board_num", board_num);
		filters.put("board_status", board_status);
		
		sqlSession.update("W_STATUS_UPDATE",filters);
	}

	@Override
	public int doneinsert(int board_num, String seller) {
		log.info("doneinsert:{},{}",board_num,seller);
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("board_num", board_num);
		filters.put("seller", seller);
		
		int flag = sqlSession.insert("W_DONE_INSERT",filters);
		return flag;
	}

	@Override
	public int donesellinsert(int board_num, String buyer) {
		log.info("donesellinsert:{},{}",board_num,buyer);
		
		Map<String, Object> filters = new HashMap<>();
		filters.put("board_num", board_num);
		filters.put("buyer", buyer);
		
		int flag = sqlSession.insert("W_DONESELL_INSERT",filters);
		return flag;
	}

	@Override
	public int delete(int board_num) {
		log.info("donesellinsert:{},{}",board_num);

		int flag = sqlSession.insert("W_DELETE",board_num);
		return flag;
	}
}
