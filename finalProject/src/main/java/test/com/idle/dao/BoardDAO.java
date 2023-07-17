package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.BoardVO;

public interface BoardDAO {

	public List<BoardVO> boardSelectAll(String category, Integer minPrice, Integer maxPrice, Integer board_type, String deal_region);

	public List<BoardVO> boardSelectAll(Integer minPrice, Integer maxPrice, Integer board_type, String deal_region);

	public List<BoardVO> boardSelectAllViews(Integer minPrice, Integer maxPrice, Integer board_type, String deal_region);
	
	public List<BoardVO> searchList(String searchWord);	

	BoardVO selectOne(BoardVO vo);

	int viewCountUp(BoardVO vo);

	int insert(BoardVO vo);

	int update(BoardVO vo);

	int delete(BoardVO vo);

	int changeStatus(BoardVO vo);

	public List<BoardVO> selectAllMain();

	public List<BoardVO> selectAllBuy();

	public List<BoardVO> selectAllSell();

}
