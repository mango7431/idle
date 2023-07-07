package test.com.idle.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BuyService;
import test.com.idle.vo.BuyVO;

@Controller
@Slf4j
public class BuyController {
	
	@Autowired
	BuyService service;
	
	@RequestMapping(value = {"/buySelectAll.do"}, method = RequestMethod.GET)
	public String buySelectAll(Model model, @RequestParam(defaultValue = "1") int cpage) {
		log.info("/buySelectAll.do");
		log.info("cpage...{}",cpage);
		List<BuyVO> vos = service.selectAll(cpage);
		log.info("{}",vos);
		int result = service.buyRowCount();
		log.info("result...{}", Math.ceil(result/10.0));
		model.addAttribute("totalPageCount",Math.ceil(result/10.0));
		model.addAttribute("vos", vos);
		
		return "myMarket/mydealbuy";
	}
	
	@RequestMapping(value = {"/buyDeleteOK.do"}, method = RequestMethod.GET)
	public String buyDeleteOK(BuyVO vo) {
		log.info("/buyDeleteOK.do");
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:buySelectAll.do";
		}else {
			return "redirect:buySelectAll.do";
//			return "redirect:boardSelectOne.do?board_num="+vo.getBoard_num();		
		}
	}
	
	
}
