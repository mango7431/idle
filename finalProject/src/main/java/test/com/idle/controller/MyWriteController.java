package test.com.idle.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/myWriteBuySelectAll.do", method = RequestMethod.GET)
	public String myWriteBuySelectAll(Model model) {
		log.info("/myWriteBuySelectAll.do");
		
		String userId=(String)session.getAttribute("user_id");
		
		List<BoardVO> buyvos = service.myWriteBuySelectAll(userId);
		model.addAttribute("buyvos",buyvos);			
		
		List<BoardVO> sellvos = service.myWriteSellSelectAll(userId);
		model.addAttribute("sellvos",sellvos);			
		
		return "myMarket/myWrite/selectAll";
	}
}
