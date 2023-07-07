package test.com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.MemberDAO;
import test.com.admin.vo.Criteria;
import test.com.admin.vo.MemberVO;

@Slf4j
@Service
public class MemberService {
	
	@Autowired
	MemberDAO dao;
	
	public MemberService() {
		log.info("MemberService...");
	}
	
	public List<MemberVO> memberSelectAll() {
		return dao.memberSelectAll();
	}
	
	public List<MemberVO> memberPaging(Criteria cri) {
		return dao.memberPaging(cri);
	}
	
	public int getTotalCount(Criteria cri) {
		return dao.getTotalCount(cri);
	}

	public MemberVO memberSelectOne(MemberVO vo) {
		return dao.memberSelectOne(vo);
	}

	public int memberDelete(MemberVO vo) {
		return dao.memberDelete(vo);
	}

	public List<MemberVO> memberSearchList(String searchKey, String searchWord) {
		return dao.memberSearchList(searchKey, searchWord);
	}
}
