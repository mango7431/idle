package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.idle.dao.MyWriteDAO;
import test.com.idle.vo.BoardVO;

@Service
public class MyWriteService {
	
	@Autowired
	MyWriteDAO dao;

	public List<BoardVO> myWriteBuySelectAll(String userId) {
		return dao.myWriteBuySelectAll(userId);
	}
	
	public List<BoardVO> myWriteSellSelectAll(String userId) {
		return dao.myWriteSellSelectAll(userId);
	}

	public int dateupdate(int board_num) {
		return dao.dateupdate(board_num);
	}

	public int statusupdate(int board_num, int board_status) {
		return dao.statusupdate(board_num,board_status);
	}

	//board_status를 2로 변경
	public void updateBoardStatus(int board_num, int board_status) {
		dao.updateBoardStatus(board_num,board_status);
	}

	public int doneinsert(int board_num, String buyer) {
		return dao.doneinsert(board_num,buyer);
	}

	public int donesellinsert(int board_num, String buyer) {
		return dao.donesellinsert(board_num,buyer);
	}

	public int delete(int board_num) {
		return dao.delete(board_num);
	}

}
