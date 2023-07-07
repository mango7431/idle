package test.com.idle.daoimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.BlackDAO;
import test.com.idle.vo.BlackVO;

@Repository
@Slf4j
public class BlackDAOimpl implements BlackDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public BlackDAOimpl() {
		log.info("BlackDAOimpl()");
	}

	@Override
	public int blackInsert(BlackVO vo) {
		log.info("blackInsert...");
		
		int flag = sqlSession.update("BLACK_INSERT",vo);
		
		return flag;
	}

}
