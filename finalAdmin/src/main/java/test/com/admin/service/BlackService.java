package test.com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.admin.dao.BlackDAO;
import test.com.admin.vo.BlackVO;

@Service
public class BlackService {

	@Autowired
	BlackDAO dao;

	public List<BlackVO> jsonBlackSelectAll() {
		return dao.jsonBlackSelectAll();
	}

	public void boardreportUp(BlackVO vo) {
		dao.boardreportUp(vo);
	}

	public void memberreportUp(BlackVO vo) {
		dao.memberreportUp(vo);
	}

	public void removeBoard(int board_num) {
		dao.removeBoard(board_num);
	}

	public void removeMember(String targetid) {
		dao.removeMember(targetid);
	}
}
