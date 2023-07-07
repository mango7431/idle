package test.com.idle.dao;

import test.com.idle.vo.LikesVO;

public interface LikesDAO {

	int insert(LikesVO vo);

	LikesVO selectOne(LikesVO vo);

	int delete(LikesVO vo);

}
