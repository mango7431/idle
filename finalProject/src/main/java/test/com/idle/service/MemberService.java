package test.com.idle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.MemberDAO;
import test.com.idle.vo.MemberVO;

@Slf4j
@Service
public class MemberService {
	@Autowired
	MemberDAO dao;

	public MemberService() {
		log.info("MemberService()...");
	}

	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}

	public MemberVO idCheck(MemberVO vo) {
		return dao.idCheck(vo);
	}

	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}

	public int buyCount(MemberVO vo) {
		return dao.buyCount(vo);
	}
	
	public int sellCount(MemberVO vo) {
		return dao.sellCount(vo);
	}

	public int update(MemberVO vo) {
		return dao.update(vo);
	}

	public int delete(MemberVO vo) {
		return dao.delete(vo);
	}

}//end class

