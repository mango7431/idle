package test.com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.BoardDAO;
import test.com.admin.vo.BoardVO;
import test.com.admin.vo.Criteria;

@Service
@Slf4j
public class BoardService {
	
	@Autowired
	BoardDAO dao;
	
	public BoardService() {
		log.info("BoardService()...");
	}

	public List<BoardVO> selectAll() {
		return dao.selectAll();
	}
	
	public int boardCount() {
		return dao.boardCount();
	}

	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(vo);
	}

	public int reportDown(BoardVO vo) {
		return dao.reportDown(vo);
	}

	public int reportUp(BoardVO vo) {
		return dao.reportUp(vo);
	}

	public int delete(BoardVO vo) {
		return dao.delete(vo);
	}

	public int boardSearchCount(String searchKey, String searchWord) {
		return dao.boardSearchCount(searchKey,searchWord);
	}

	public List<BoardVO> selectAllPage(Criteria cri) {
		return dao.selectAllPage(cri);
	}

	public List<BoardVO> searchList(String searchKey, String searchWord, Criteria cri) {
		return dao.searchList(searchKey,searchWord,cri);
	}

	public List<BoardVO> selectBlack(BoardVO vo) {
		return dao.selectBlack(vo);
	}

}
