package test.com.idle.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.MyWriteService;
import test.com.idle.vo.BoardVO;

@Controller
@Slf4j
public class MyWriteController {
	
	@Autowired
	MyWriteService service;
	
	@RequestMapping(value = "/myWriteBuySelectAll.do", method = RequestMethod.GET)
	public String myWriteBuySelectAll(Model model) {
		log.info("/myWriteBuySelectAll.do");
		
		String userId = "tester3"; //임시로 tester3값 넣어놓음. 로그인유저로 바꿀예정.
		
		List<BoardVO> buyvos = service.myWriteBuySelectAll(userId);
		model.addAttribute("buyvos",buyvos);			
		
		List<BoardVO> sellvos = service.myWriteSellSelectAll(userId);
		model.addAttribute("sellvos",sellvos);			
		
		return "myMarket/myWrite/selectAll";
	}
}
