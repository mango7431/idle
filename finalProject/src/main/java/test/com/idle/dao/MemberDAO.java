package test.com.idle.dao;

import test.com.idle.vo.MemberVO;

public interface MemberDAO {

	public int insert(MemberVO vo);

	public MemberVO idCheck(MemberVO vo);
	
	public MemberVO login(MemberVO vo);

	public MemberVO selectOne(MemberVO vo);
	
}
