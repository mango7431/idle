package test.com.idle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BoardService;
import test.com.idle.vo.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value = {"/","/home.do"}, method = RequestMethod.GET)
	public String home(Model model) {
		log.info("home.do...");
		
		List<BoardVO> vos = service.selectAllMain();
		List<BoardVO> sellvos = service.selectAllSell();
		List<BoardVO> buyvos = service.selectAllBuy();
		
		model.addAttribute("vos",vos);
		model.addAttribute("sellvos",sellvos);
		model.addAttribute("buyvos",buyvos);
		
		return "home";
	}
	
}
