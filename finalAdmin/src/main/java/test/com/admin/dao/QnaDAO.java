package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.Criteria;
import test.com.admin.vo.QnaVO;

public interface QnaDAO {
	
	public List<QnaVO> selectAll();

	public QnaVO selectOne(QnaVO vo);
	
	public List<QnaVO> qnaPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	
}
