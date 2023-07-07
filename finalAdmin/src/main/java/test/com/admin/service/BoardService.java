package test.com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.BoardDAO;
import test.com.admin.vo.BoardVO;
import test.com.admin.vo.PagingVO;

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

	public List<BoardVO> selectAllPage(PagingVO vo) {
		return dao.selectAllPage(vo);
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

	public List<BoardVO> searchList(String searchKey, String searchWord, PagingVO vo) {
		return dao.searchList(searchKey,searchWord,vo);
	}

	public int boardSearchCount(String searchKey, String searchWord) {
		return dao.boardSearchCount(searchKey,searchWord);
	}

}
