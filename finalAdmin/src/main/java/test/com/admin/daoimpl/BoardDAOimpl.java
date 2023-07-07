package test.com.admin.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.BoardDAO;
import test.com.admin.vo.BoardVO;
import test.com.admin.vo.PagingVO;

@Repository
@Slf4j
public class BoardDAOimpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;

	public BoardDAOimpl() {
		log.info("BoardDAOimpl()...");
	}

	@Override
	public List<BoardVO> selectAll() {
		log.info("selectAll()...");
		List<BoardVO> vos = sqlSession.selectList("B_SELECT_ALL");
		return vos;
	}

	@Override
	public List<BoardVO> selectAllPage(PagingVO vo) {
		log.info("selectAllPage()...{}", vo);
		List<BoardVO> vos = sqlSession.selectList("B_SELECT_ALL_PAGE", vo);
		return vos;
	}

	@Override
	public int boardCount() {
		log.info("boardCount()...");
		int result = sqlSession.selectOne("B_COUNT");

		return result;
	}

	@Override
	public BoardVO selectOne(BoardVO vo) {
		log.info("selectOne()...{}", vo);

		BoardVO vo2 = sqlSession.selectOne("B_SELECT_ONE", vo);

		return vo2;
	}

	@Override
	public int reportDown(BoardVO vo) {
		log.info("reportDown()...{}",vo);
		
		int flag = sqlSession.update("B_REPORT_DOWN",vo);
		
		return flag;
	}

	@Override
	public int reportUp(BoardVO vo) {
		log.info("reportUp()...{}", vo);

		int flag = sqlSession.update("B_REPORT_UP", vo);

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
	public List<BoardVO> searchList(String searchKey, String searchWord, PagingVO vo) {
		log.info("searchList() ...");
		log.info("searchKey : {}",searchKey);
		log.info("searchWord : {}",searchWord);
		log.info("PageVO : {}",vo);
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("searchWord", "%"+searchWord+"%");
		params.put("start", vo.getStart());
		params.put("end", vo.getEnd());
		
		List<BoardVO> vos = null;
		if(searchKey.equals("board_title")) {
			vos = sqlSession.selectList("B_SEARCH_LIST_TITLE",params);
		}else if(searchKey.equals("writer")) {
			vos = sqlSession.selectList("B_SEARCH_LIST_WRITER",params);
		}
		
		return vos;
	}

	@Override
	public int boardSearchCount(String searchKey, String searchWord) {
		log.info("boardSearchCount()...{},{}",searchKey,searchWord);
		int result = 0;
		
		if(searchKey.equals("board_title")) {
			result = sqlSession.selectOne("B_COUNT_TITLE","%"+searchWord+"%");
		}else if(searchKey.equals("writer")) {
			result = sqlSession.selectOne("B_COUNT_WRITER","%"+searchWord+"%");
		}
		
		return result;
	}

}
