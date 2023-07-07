package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.BuyVO;

public interface BuyDAO {
	
	public List<BuyVO> selectAll(int cpage);

	public int delete(BuyVO vo);

	public int buyRowCount();

}
