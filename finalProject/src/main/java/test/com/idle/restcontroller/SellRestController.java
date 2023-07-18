package test.com.idle.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.SellService;
import test.com.idle.vo.SellVO;

@Controller
@Slf4j
public class SellRestController {
	
	@Autowired
	SellService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonSellInsert.do", method = RequestMethod.GET)
	public int jsonSellInsert(SellVO vo) {
		log.info("/jsonSellInsert.do...{}",vo);
		
		int result = 0;
		
		SellVO vo2 = service.selectOne(vo);
		if(vo2==null) {
			result = service.insert(vo);			
		}
	
		return result;
	}

}
