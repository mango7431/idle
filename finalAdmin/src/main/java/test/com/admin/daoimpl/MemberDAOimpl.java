package test.com.admin.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.MemberDAO;
import test.com.admin.vo.Criteria;
import test.com.admin.vo.MemberVO;

@Slf4j
@Repository
public class MemberDAOimpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public MemberDAOimpl() {
		log.info("MemberDAOimpl...");
	}

	@Override
	public List<MemberVO> memberSelectAll() {
		log.info("memberSelectAll...");
		return sqlSession.selectList("M_SELECT_ALL");
	}
	
	@Override
	public List<MemberVO> memberPaging(Criteria cri) {
		return sqlSession.selectList("M_PAGING", cri);
	}

	@Override
	public MemberVO memberSelectOne(MemberVO vo) {
		log.info("memberSelectOne...");
		return sqlSession.selectOne("M_SELECT_ONE", vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		log.info("memberDelete...");
		return sqlSession.delete("M_DELETE", vo);
	}

	@Override
	public List<MemberVO> memberSearchList(String searchKey, String searchWord) {
		log.info("memberSearchList...");
		log.info("searchKey: " + searchKey);
		log.info("searchWord: " + searchWord);
		
		List<MemberVO> vos = null;
		
		if (searchKey.equals("id")) {
			vos = sqlSession.selectList("M_SEARCHLIST_ID", "%" + searchWord + "%");		
		} else {
			vos = sqlSession.selectList("M_SEARCHLIST_NAME", "%" + searchWord + "%");					
		}
		return vos;
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		log.info("getTotalCount...Criteria:{}", cri);
		
		return sqlSession.selectOne("M_TOTAL_COUNT", cri);
	}

}
