package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.BoardVO;

public interface MyWriteDAO {

	List<BoardVO> myWriteBuySelectAll(String userId);

	List<BoardVO> myWriteSellSelectAll(String userId);

	int dateupdate(int board_num);

	int statusupdate(int board_num, int board_status);

	//board_status를 2로 변경
	void updateBoardStatus(int board_num, int board_status);

	int doneinsert(int board_num, String buyer);

	int donesellinsert(int board_num, String buyer);

	int delete(int board_num);

}
