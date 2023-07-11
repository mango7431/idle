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
import test.com.admin.vo.Criteria;
import test.com.admin.vo.PageVO;

@Controller
@Slf4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value = "/boardSelectAll.do", method = RequestMethod.GET)
	public String boardSelectAll(Criteria cri,Model model) {
		log.info("/boardSelectAll.do...{}",cri);
		
		int boardCount = service.boardCount();
		log.info("boardCount : {}",boardCount);

		List<BoardVO> vos = service.selectAllPage(cri);
		log.info("vos : {}",vos);
		
		model.addAttribute("vos", vos);
		model.addAttribute("page",new PageVO(cri, boardCount));
		model.addAttribute("total",boardCount);
		
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
	public String boardSearchList(String searchKey,String searchWord,Criteria cri,Model model) {
		log.info("/boardSearchList.do...{}",cri);
		
		int boardSearchCount = service.boardSearchCount(searchKey,searchWord);
		log.info("boardCount : {}",boardSearchCount);

		List<BoardVO> vos = service.searchList(searchKey,searchWord,cri);
		log.info("{}",vos);
		
		model.addAttribute("vos", vos);
		model.addAttribute("page",new PageVO(cri, boardSearchCount));
		model.addAttribute("total",boardSearchCount);
		
		return "board/selectAll";
	}
	
	
	
}
