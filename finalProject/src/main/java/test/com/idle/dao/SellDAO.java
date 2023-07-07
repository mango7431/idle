package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.SellVO;

public interface SellDAO {
	
	public List<SellVO> selectAll(int cpage);

	public int delete(SellVO vo);

	public int sellRowCount();


}
