package test.com.admin.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.BlackDAO;
import test.com.admin.vo.BlackVO;
import test.com.admin.vo.Criteria;

@Repository
@Slf4j
public class BlackDAOimpl implements BlackDAO {
	
	@Autowired
	SqlSession sqlSession;

	public BlackDAOimpl() {
		log.info("BlackDAOimpl...");
	}

	@Override
	public List<BlackVO> jsonBlackSelectAll(Criteria cri) {
		log.info("jsonBlackSelectAll..{}",cri);
		
		List<BlackVO> vos = sqlSession.selectList("BLACK_SELECT_ALL",cri);
		log.info("vos:{}",vos);
		return vos;
	}
	
	@Override
	public int getTotal() {
		return sqlSession.selectOne("getTotal");
	}
	
	@Override
	public void boardreportUp(BlackVO vo) {
		log.info("boardreportUp:{}",vo);
		sqlSession.selectList("BOARD_REPORT_UP",vo);
	}

	@Override
	public void memberreportUp(BlackVO vo) {
		log.info("memberreportUp:{}",vo);
		sqlSession.selectList("MEMBER_REPORT_UP",vo);
	}

	@Override
	public void removeBoard(int board_num) {
		log.info("removeBoard:{}",board_num);
		sqlSession.delete("REMOVE_BOARD",board_num);
	}

	@Override
	public void removeMember(String targetid) {
		log.info("removeMember:{}",targetid);
		sqlSession.delete("REMOVE_MEMBER",targetid);
	}
	
	@Override
	public void changeStatus(int black_num) {
		log.info("changeStatus:{}",black_num);
		sqlSession.delete("CHANGE_STATUS",black_num);
	}

	@Override
	public int totalCount() {
		log.info("totalCount...");
		return sqlSession.selectOne("TOTAL_COUNT");
	}
}
