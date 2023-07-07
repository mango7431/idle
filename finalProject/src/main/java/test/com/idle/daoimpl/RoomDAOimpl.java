package test.com.idle.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.RoomDAO;
import test.com.idle.vo.RoomVO;

@Repository
@Slf4j
public class RoomDAOimpl implements RoomDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public RoomDAOimpl() {
		log.info("RoomDAOimpl()...");
	}

	@Override
	public List<RoomVO> selectAll(RoomVO vo) {
		log.info("selectAll()...{}",vo);
		List<RoomVO> vos = sqlSession.selectList("R_SELECT_ALL",vo);
		return vos;
	}

	@Override
	public int insert(RoomVO vo) {
		log.info("insert()...{}",vo);
		
		int flag = sqlSession.insert("R_INSERT",vo);
		
		return flag;
	}

	@Override
	public RoomVO roomCheck(RoomVO vo) {
		log.info("roomCheck()...{}",vo);
		
		RoomVO vo2 = sqlSession.selectOne("R_CHECK",vo);
		
		return vo2;
	}

	@Override
	public int delete(RoomVO vo) {
		log.info("insert()...{}",vo);
		
		int flag = sqlSession.delete("R_DELETE",vo);
		
		return flag;
	}
	
	

}
