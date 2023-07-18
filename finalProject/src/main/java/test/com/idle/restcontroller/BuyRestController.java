package test.com.idle.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BuyService;
import test.com.idle.vo.BuyVO;

@Slf4j
@Controller
public class BuyRestController {
	
	@Autowired
	BuyService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonBuyInsert.do", method = RequestMethod.GET)
	public int jsonBuyInsert(BuyVO vo) {
		log.info("/jsonBuyInsert.do...{}",vo);
		
		int result = 0;
		
		BuyVO vo2 = service.selectOne(vo);
		if(vo2==null) {
			result = service.insert(vo);			
		}
	
		return result;
	}

}
