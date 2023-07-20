package test.com.idle.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BuyService;
import test.com.idle.vo.BoardVO;
import test.com.idle.vo.BuyVO;

@Controller
@Slf4j
public class BuyController {
	
	@Autowired
	BuyService service;
	
	@Autowired
	HttpSession session;
	
//	@RequestMapping(value = "/buySelectAll.do", method = RequestMethod.GET)
//	public String buySelectAll(Model model, @RequestParam(defaultValue = "1") int cpage) {
//		log.info("/buySelectAll.do");
//		log.info("cpage...{}",cpage);
//		
//		String userId = "tester3"; //임시로 tester3값 넣어놓음. 로그인유저로 바꿀예정.
//		
//		List<BoardVO> buyvos = service.buySelectAll(cpage,userId);
//		model.addAttribute("buyvos",buyvos);	
//		
//		List<BoardVO> sellvos = service.sellSelectAll(cpage,userId);
//		model.addAttribute("sellvos",sellvos);	
//		
//		int buyRowCount = service.buyRowCount(userId);
//		log.info("buyRowCount...{}", Math.ceil(buyRowCount/10.0));
//		model.addAttribute("buyPageCount",Math.ceil(buyRowCount/10.0));
//		
//		int sellRowCount = service.sellRowCount(userId);
//		log.info("sellRowCount...{}", Math.ceil(sellRowCount/10.0));
//		model.addAttribute("sellPageCount",Math.ceil(sellRowCount/10.0));
//		
//		
//		return "myMarket/myDeal/buySelectAll";
//	}
	
	@RequestMapping(value = "/buySelectAll.do", method = RequestMethod.GET)
	public String buySelectAll(Model model, @RequestParam(defaultValue = "1") int cpage) {
		log.info("/buySelectAll.do");
		log.info("cpage...{}",cpage);
		
		String userId=(String)session.getAttribute("user_id");
		
		List<BoardVO> buyvos = service.buySelectAll(cpage,userId);
		model.addAttribute("buyvos",buyvos);	
		
			
		
		int buyRowCount = service.buyRowCount(userId);
		log.info("buyRowCount...{}", Math.ceil(buyRowCount/10.0));
		model.addAttribute("buyPageCount",Math.ceil(buyRowCount/10.0));
		
		
		
		
		return "myMarket/myDeal/buySelectAll";
	}
	@RequestMapping(value = "/sellSelectAll.do", method = RequestMethod.GET)
	public String sellSelectAll(Model model, @RequestParam(defaultValue = "1") int cpage) {
		log.info("/sellSelectAll.do");
		log.info("cpage...{}",cpage);
		
		String userId=(String)session.getAttribute("user_id");
		
		List<BoardVO> sellvos = service.sellSelectAll(cpage,userId);
		model.addAttribute("sellvos",sellvos);	
		
		
		
		int sellRowCount = service.sellRowCount(userId);
		log.info("sellRowCount...{}", Math.ceil(sellRowCount/10.0));
		model.addAttribute("sellPageCount",Math.ceil(sellRowCount/10.0));
		
		
		
		
		return "myMarket/myDeal/sellSelectAll";
	}
	
	
	@RequestMapping(value = {"/buyDeleteOK.do"}, method = RequestMethod.GET)
	public String dealDeleteOK(BuyVO vo) {
		log.info("/buyDeleteOK.do...{}",vo);
		
		int result = service.buyDelete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:buySelectAll.do";
		}else {
			return "redirect:buySelectAll.do";		
		}
	}
	
	@RequestMapping(value = {"/sellDeleteOK.do"}, method = RequestMethod.GET)
	public String sellDeleteOK(BuyVO vo) {
		log.info("/sellDeleteOK.do...{}",vo);
		
		int result = service.sellDelete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:sellSelectAll.do";
		}else {
			return "redirect:sellSelectAll.do";
//			return "redirect:boardSelectOne.do?board_num="+vo.getBoard_num();		
		}
	}
	
	
}
