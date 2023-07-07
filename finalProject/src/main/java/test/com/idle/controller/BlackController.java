package test.com.idle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BlackService;
import test.com.idle.vo.BlackVO;

@Controller
@Slf4j
public class BlackController {

	@Autowired
	BlackService service;
	
	//신고하기 기능
	@RequestMapping(value = "/blackInsertOK.do", method = RequestMethod.POST)
	public String blackInsertOK(BlackVO vo) {
		log.info("/blackInsertOK.do:{}",vo);

		int result = service.blackInsert(vo);
		log.info("result:{}", result);
		
		return "redirect:boardSelectOne.do?board_num="+vo.getBoard_num();
	}
}
