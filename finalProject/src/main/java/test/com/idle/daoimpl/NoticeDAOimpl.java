package test.com.idle.daoimpl;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.com.idle.dao.NoticeDAO;
import test.com.idle.vo.NoticeVO;

@Repository
@Slf4j
public class NoticeDAOimpl implements NoticeDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public NoticeDAOimpl() {
		log.info("NoticeDAOimpl()");
	}

	@Override
	public List<NoticeVO> selectAllMain() {
		log.info("selectAllMain()...");
		
		List<NoticeVO> vos = sqlSession.selectList("N_SELECT_ALL_MAIN");
		
		return vos;
	}

}
