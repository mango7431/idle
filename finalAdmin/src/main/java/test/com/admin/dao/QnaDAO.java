package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.QnaVO;

public interface QnaDAO {
	
	public List<QnaVO> selectAll();
	
	public List<QnaVO> selectAll2();

	public QnaVO selectOne(QnaVO vo);
	
	
}
