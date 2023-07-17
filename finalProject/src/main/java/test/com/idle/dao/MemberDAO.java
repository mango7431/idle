package test.com.idle.dao;

import test.com.idle.vo.MemberVO;

public interface MemberDAO {

	public int insert(MemberVO vo);

	public MemberVO idCheck(MemberVO vo);
	
	public MemberVO login(MemberVO vo);

	public MemberVO selectOne(MemberVO vo);
	
	public int buyCount(MemberVO vo);
	
	public int sellCount(MemberVO vo);

	public int update(MemberVO vo);

	public int delete(MemberVO vo);
	
	
}