package test.com.idle.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.BuyDAO;
import test.com.idle.vo.BuyVO;

@Slf4j
@Repository
public class BuyDAOimpl implements BuyDAO {
	
	@Autowired
	SqlSession sqlSession;

	public BuyDAOimpl() {
		log.info("BuyDAOimpl...");
	}

	@Override
	public List<BuyVO> selectAll(int cpage) {
		log.info("selectAll()...");
		log.info("cpage...{}",cpage);
		int pageBlock = 10;
		int startRow = (cpage -1) * pageBlock +1;
		int endRow = startRow + pageBlock -1;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("BUY_SELECT_ALL",map);
	}

	@Override
	public int delete(BuyVO vo) {
		log.info("delete()...{}",vo);
		return sqlSession.delete("BUY_DELETE", vo);
	}

	@Override
	public int buyRowCount() {
		log.info("buyRowCount()...");
		return sqlSession.selectOne("BUY_ROW_COUNT");
	}

	

}
