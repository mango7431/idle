package test.com.idle.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.MessageService;
import test.com.idle.vo.MessageVO;

@Controller
@Slf4j
public class MessageRestController {
	
	@Autowired
	MessageService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonMessageSelectAll.do", method = RequestMethod.GET)
	public List<MessageVO> jsonMessageSelectAll(MessageVO vo) {
		log.info("message : {}",vo);
		
		List<MessageVO> vos = service.selectAll(vo);
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/readCheck.do", method = RequestMethod.POST)
	public int readCheck(MessageVO vo) {
		log.info("readCheck : {}",vo);
		
		int result = service.readCheck(vo);
		log.info("result : {}",result);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonReadCount.do", method = RequestMethod.GET)
	public int jsonReadCount(MessageVO vo) {
		log.info("readCheck : {}",vo);
		
		int result = service.readCount(vo);
		log.info("result : {}",result);
		
		return result;
	}

}
