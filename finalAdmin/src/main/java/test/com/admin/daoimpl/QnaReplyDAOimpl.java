package test.com.admin.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.QnaReplyDAO;
import test.com.admin.vo.QnaReplyVO;

@Slf4j
@Repository
public class QnaReplyDAOimpl implements QnaReplyDAO {

	@Autowired
	SqlSession sqlSession;
	
	public QnaReplyDAOimpl() {
		log.info("QnaReplyDAOimpl()...");
	}
	
	@Override
	public int insert(QnaReplyVO vo) {
		log.info("insert()..." + vo);
		int flag = sqlSession.insert("QNAREPLY_INSERT", vo);
		//insert성공하면 update
		if(flag==1)sqlSession.update("QNA_STATUS_UPDATE",vo.getQna_num());

		return flag;
	}

	@Override
	public int update(QnaReplyVO vo) {
		log.info("update()..." + vo);
		int flag = sqlSession.update("QNAREPLY_UPDATE", vo);

		return flag;
	}

	@Override
	public int delete(QnaReplyVO vo) {
		log.info("delete()..." + vo);
		int flag = sqlSession.delete("QNAREPLY_DELETE", vo);
		//delete성공하면 update
		if(flag==1)sqlSession.update("QNA_STATUS_DOWN_UPDATE",vo.getQna_num());
				
		return flag;
	}

	@Override
	public List<QnaReplyVO> selectAll(QnaReplyVO vo) {
		log.info("selectAll()..." + vo);
		List<QnaReplyVO> vos = sqlSession.selectList("QNAREPLY_SELECT_ALL",vo);

		return vos;
	}

	

}
