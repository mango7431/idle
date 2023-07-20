package test.com.admin.restcontroller;

import java.util.Collections;
import java.util.List;

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
	
	@RequestMapping(value = "/jsonBoardBlack.do", method = RequestMethod.GET)
	@ResponseBody
	public List<BoardVO> jsonBoardBlack(BoardVO vo) {
		log.info("/jsonBoardBlack.do...{}",vo);
		
		List<BoardVO> vos = service.selectBlack(vo);
		log.info("{}",vos);
		
		if(vos.size()==1&&vos.get(0).getBlack_num()==0) {
			return Collections.emptyList();
		}
		
		return vos;
	}

}
