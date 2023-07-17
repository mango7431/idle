package test.com.idle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BoardService;
import test.com.idle.service.NoticeService;
import test.com.idle.vo.BoardVO;
import test.com.idle.vo.NoticeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	BoardService bService;
	
	@Autowired
	NoticeService nService;
	
	@RequestMapping(value = {"/","/home.do"}, method = RequestMethod.GET)
	public String home(Model model) {
		log.info("home.do...");
		
		List<BoardVO> vos = bService.selectAllMain();
		List<BoardVO> sellvos = bService.selectAllSell();
		List<BoardVO> buyvos = bService.selectAllBuy();
		
		List<NoticeVO> nvos = nService.selectAllMain();
		
		model.addAttribute("vos",vos);
		model.addAttribute("sellvos",sellvos);
		model.addAttribute("buyvos",buyvos);
		model.addAttribute("nvos",nvos);
		
		return "home";
	}
	
}