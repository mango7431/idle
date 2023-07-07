package test.com.admin.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.QnaDAO;
import test.com.admin.vo.QnaVO;

@Repository
@Slf4j
public class QnaDAOimpl implements QnaDAO {

	@Autowired
	SqlSession sqlSession;
	
	public QnaDAOimpl() {
		log.info("QnaDAOimpl()...");
	}
	
	@Override
	public List<QnaVO> selectAll() {
		log.info("selectAll()...");
		List<QnaVO> vos = sqlSession.selectList("QNA_SELECT_ALL");
		return vos;
	}

	@Override
	public QnaVO selectOne(QnaVO vo) {
		log.info("selectOne()...." + vo);

		QnaVO vo2 = sqlSession.selectOne("QNA_SELECT_ONE", vo);

		return vo2;
	}

	@Override
	public List<QnaVO> selectAll2() {
		log.info("selectAll2()...");
		List<QnaVO> vos = sqlSession.selectList("QNA_SELECT_ALL2");
		return vos;
	}

}
