package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.BoardVO;
import test.com.admin.vo.Criteria;

public interface BoardDAO {

	List<BoardVO> selectAll();

	int boardCount();

	BoardVO selectOne(BoardVO vo);

	int reportDown(BoardVO vo);

	int reportUp(BoardVO vo);

	int delete(BoardVO vo);

	int boardSearchCount(String searchKey, String searchWord);

	List<BoardVO> selectAllPage(Criteria cri);

	List<BoardVO> searchList(String searchKey, String searchWord, Criteria cri);

	List<BoardVO> selectBlack(BoardVO vo);

}
