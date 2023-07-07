package test.com.idle.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.SellDAO;
import test.com.idle.vo.SellVO;

@Slf4j
@Repository
public class SellDAOimpl implements SellDAO {
	
	@Autowired
	SqlSession sqlSession;

	public SellDAOimpl() {
		log.info("SellDAOimpl...");
	}

	@Override
	public List<SellVO> selectAll(int cpage) {
		log.info("selectAll()...");
		log.info("cpage...{}",cpage);
		int pageBlock = 10;
		int startRow = (cpage -1) * pageBlock +1;
		int endRow = startRow + pageBlock -1;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("S_SELECT_ALL",map);
	}

	@Override
	public int delete(SellVO vo) {
		log.info("delete()...{}",vo);
		return sqlSession.delete("S_DELETE", vo) ;
	}

	@Override
	public int sellRowCount() {
		log.info("sellRowCount()...");
		return sqlSession.selectOne("S_ROW_COUNT");
	}

	
}
