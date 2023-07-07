package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.QnaReplyVO;

public interface QnaReplyDAO {
	
	public int insert(QnaReplyVO vo);

	public int update(QnaReplyVO vo);

	public int delete(QnaReplyVO vo);

	public List<QnaReplyVO> selectAll(QnaReplyVO vo);
}
