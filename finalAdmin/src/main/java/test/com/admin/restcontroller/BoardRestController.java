package test.com.admin.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.BoardService;
import test.com.admin.vo.BoardVO;
import test.com.admin.vo.PagingVO;

@Controller
@Slf4j
public class BoardRestController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value = "/jsonBoardSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public BoardVO jsonBoardSelectOne(BoardVO vo) {
		log.info("/jsonBoardSelectOne.do...{}",vo);
		
		BoardVO vo2 = service.selectOne(vo);
		log.info("{}",vo2);
		
		return vo2;
	}
	
	@RequestMapping(value = "/jsonBoardSearchList.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> jsonBoardSearchList(String searchKey,String searchWord,PagingVO vo) {
		log.info("/jsonBoardSearchList.do...{},{}",searchKey,searchWord);
		log.info("pageVO : {}",vo);
		
		Map<String, Object> response = new HashMap<String, Object>();
		
		int boardSearchCount = service.boardSearchCount(searchKey,searchWord);
		log.info("boardCount : {}",boardSearchCount);
		
		PagingVO page = new PagingVO(vo.getPage(),10,boardSearchCount);
		
		List<BoardVO> vos = service.searchList(searchKey,searchWord,page);
		log.info("{}",vos);
		
		response.put("vos", vos);
		response.put("page", page);
		
		return response;
	}

}
