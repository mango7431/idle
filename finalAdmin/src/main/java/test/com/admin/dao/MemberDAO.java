package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.Criteria;
import test.com.admin.vo.MemberVO;

public interface MemberDAO {
	public List<MemberVO> memberSelectAll();

	public MemberVO memberSelectOne(MemberVO vo); 
	
	public int memberDelete(MemberVO vo);
	
	public List<MemberVO> memberSearchList(String searchKey, String searchWord);
	
	public List<MemberVO> memberPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
