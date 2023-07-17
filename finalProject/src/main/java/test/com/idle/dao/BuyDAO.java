package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.BoardVO;
import test.com.idle.vo.BuyVO;

public interface BuyDAO {
	
	public List<BuyVO> selectAll(int cpage);
	
	List<BoardVO> buySelectAll(int cpage, String userId);

	List<BoardVO> sellSelectAll(int cpage, String userId);

	public int delete(BuyVO vo);

	public int buyRowCount(String userId);
	
	public int sellRowCount(String userId);

	public int insert(BuyVO vo);

	public BuyVO selectOne(BuyVO vo);

}
