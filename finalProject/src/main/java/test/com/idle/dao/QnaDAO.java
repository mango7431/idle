package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.Criteria;
import test.com.idle.vo.QnaVO;

public interface QnaDAO {
	public int qnaInsert(QnaVO vo);
	
	public int qnaUpdate(QnaVO vo);
	
	public int qnaDelete(QnaVO vo);
	
	public QnaVO qnaSelectOne(QnaVO vo);
	
	public List<QnaVO> qnaSelectAll(QnaVO vo);

	public List<QnaVO> paging(Criteria cri, QnaVO vo);
	
	public int getTotalCount(Criteria cri, QnaVO vo);
}
