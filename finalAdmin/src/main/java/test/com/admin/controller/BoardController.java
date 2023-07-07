package test.com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.BoardService;
import test.com.admin.vo.BoardVO;
import test.com.admin.vo.PagingVO;

@Controller
@Slf4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value = "/boardSelectAll.do", method = RequestMethod.GET)
	public String boardSelectAll(PagingVO vo,Model model) {
		log.info("/boardSelectAll.do...{}",vo);
		
		int boardCount = service.boardCount();
		log.info("boardCount : {}",boardCount);
		
		PagingVO page = new PagingVO(vo.getPage(),10,boardCount);
		log.info("{}",page);
		
		List<BoardVO> vos = service.selectAllPage(page);
		log.info("vos : {}",vos);
		
		model.addAttribute("vos", vos);
		model.addAttribute("page",page);
		
		return "board/selectAll";
	}
	
	@RequestMapping(value = "/boardSelectOne.do", method = RequestMethod.GET)
	public String boardSelectOne(BoardVO vo) {
		log.info("/boardSelectOne.do...{}",vo);
		
		return "board/selectOne";
	}
	
	@RequestMapping(value = "/boardReportDown.do", method = RequestMethod.GET)
	public String boardReportDown(BoardVO vo) {
		log.info("/boardReportDown.do...{}",vo);
		
		int result = service.reportDown(vo);
		log.info("result : {}",result);
		
		return "redirect:boardSelectOne.do?board_num="+vo.getBoard_num();
	}
	
	@RequestMapping(value = "/boardReportUp.do", method = RequestMethod.GET)
	public String boardReportUp(BoardVO vo) {
		log.info("/boardReportUp.do...{}",vo);
		
		int result = service.reportUp(vo);
		log.info("result : {}",result);
		
		return "redirect:boardSelectOne.do?board_num="+vo.getBoard_num();
	}
	
	@RequestMapping(value = "/boardDeleteOK.do", method = RequestMethod.GET)
	public String boardDeleteOK(BoardVO vo) {
		log.info("/boardDeleteOK.do...{}",vo);
		
		int result = service.delete(vo);
		log.info("result : {}",result);
		
		return "redirect:boardSelectAll.do?page=1";
	}
	
	@RequestMapping(value = "/boardSearchList.do", method = RequestMethod.GET)
	public String boardSearchList(String searchKey,String searchWord,PagingVO vo,Model model) {
		log.info("/boardSearchList.do...{}",vo);
		
		int boardSearchCount = service.boardSearchCount(searchKey,searchWord);
		log.info("boardCount : {}",boardSearchCount);
		
		PagingVO page = new PagingVO(vo.getPage(),10,boardSearchCount);
		log.info("{}",page);
		
		List<BoardVO> vos = service.searchList(searchKey,searchWord,page);
		log.info("{}",vos);
		
		model.addAttribute("vos", vos);
		model.addAttribute("page",page);
		
		return "board/selectAll";
	}
	
	
	
}
