package test.com.admin.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.BoardService;
import test.com.admin.vo.BoardVO;

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

}
