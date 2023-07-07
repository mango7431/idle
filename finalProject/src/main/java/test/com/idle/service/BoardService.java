package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.BoardDAO;
import test.com.idle.vo.BoardVO;

@Service
@Slf4j
public class BoardService {
	
	@Autowired
	BoardDAO dao;
	
	public BoardService() {
		log.info("BoardService()...");
	}

	public List<BoardVO> boardSelectAll(String category, Integer minPrice, Integer maxPrice, Integer board_type) {
		return dao.boardSelectAll(category, minPrice, maxPrice, board_type);
	}

	public List<BoardVO> boardSelectAll(Integer minPrice, Integer maxPrice, Integer board_type) {
		return dao.boardSelectAll(minPrice, maxPrice, board_type);
	}

	public List<BoardVO> boardSelectAllViews(Integer minPrice, Integer maxPrice, Integer board_type) {
		return dao.boardSelectAllViews(minPrice, maxPrice, board_type);
	}	

	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(vo);
	}

	public int viewCountUp(BoardVO vo) {
		return dao.viewCountUp(vo);
	}

	public int insert(BoardVO vo) {
		return dao.insert(vo);
	}

	public int update(BoardVO vo) {
		return dao.update(vo);
	}

	public int delete(BoardVO vo) {
		return dao.delete(vo);
	}

	public int changeStatus(BoardVO vo) {
		return dao.changeStatus(vo);
	}

}
