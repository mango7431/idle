package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.BoardVO;
import test.com.admin.vo.PagingVO;

public interface BoardDAO {

	List<BoardVO> selectAll();

	List<BoardVO> selectAllPage(PagingVO vo);

	int boardCount();

	BoardVO selectOne(BoardVO vo);

	int reportDown(BoardVO vo);

	int reportUp(BoardVO vo);

	int delete(BoardVO vo);

	List<BoardVO> searchList(String searchKey, String searchWord, PagingVO vo);

	int boardSearchCount(String searchKey, String searchWord);

}
