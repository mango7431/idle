package test.com.idle.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.LikesDAO;
import test.com.idle.vo.LikesVO;

@Repository
@Slf4j
public class LikesDAOimpl implements LikesDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public LikesDAOimpl() {
		log.info("LikesDAOimpl()...");
	}

	@Override
	public int insert(LikesVO vo) {
		log.info("insert...{}",vo);
		
		int flag = sqlSession.insert("L_INSERT",vo);
		
		return flag;
	}

	@Override
	public LikesVO selectOne(LikesVO vo) {
		log.info("selectOne()...{}",vo);
		
		LikesVO vo2 = sqlSession.selectOne("L_SELECT_ONE",vo);
		
		return vo2;
	}

	@Override
	public int delete(LikesVO vo) {
		log.info("insert...{}",vo);
		
		int flag = sqlSession.insert("L_DELETE",vo);
		
		return flag;
	}

}
