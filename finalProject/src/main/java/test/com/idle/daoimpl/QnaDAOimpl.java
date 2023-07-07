package test.com.idle.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.QnaDAO;
import test.com.idle.vo.Criteria;
import test.com.idle.vo.QnaVO;

@Slf4j
@Repository
public class QnaDAOimpl implements QnaDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public QnaDAOimpl() {
		log.info("QnaDAOimpl...");
	}

	@Override
	public int qnaInsert(QnaVO vo) {
		log.info("qnaInsert...{}", vo);
		return sqlSession.insert("Q_INSERT", vo);
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		log.info("qnaUpdate...{}", vo);
		return sqlSession.update("Q_UPDATE", vo);
	}

	@Override
	public int qnaDelete(QnaVO vo) {
		log.info("qnaDelete...{}", vo);
		return sqlSession.delete("Q_DELETE", vo);
	}

	@Override
	public QnaVO qnaSelectOne(QnaVO vo) {
		log.info("qnaSelectOne...{}", vo);
		return sqlSession.selectOne("Q_SELECT_ONE", vo);
	}

	@Override
	public List<QnaVO> qnaSelectAll(QnaVO vo) {
		log.info("qnaSelectAll...{}", vo);
		return sqlSession.selectList("Q_SELECT_ALL", vo);
	}

	@Override
	public List<QnaVO> paging(Criteria cri, QnaVO vo) {
		log.info("paging...Criteria:{}", cri);
		
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		paramMap.put("criteria", cri);
		paramMap.put("qnaVO", vo);		
		
		return sqlSession.selectList("Q_PAGING", paramMap);
	}

	@Override
	public int getTotalCount(Criteria cri, QnaVO vo) {
		log.info("getTotalCount...Criteria:{}", cri);
		
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		paramMap.put("criteria", cri);
		paramMap.put("qnaVO", vo);	
		
		return sqlSession.selectOne("Q_TOTAL_COUNT", paramMap);
	}
}
