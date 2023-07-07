package test.com.idle.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.SellService;
import test.com.idle.vo.SellVO;

@Controller
@Slf4j
public class SellController {
	
	@Autowired
	SellService service;
	
	@RequestMapping(value = {"/sellSelectAll.do"}, method = RequestMethod.GET)
	public String sellSelectAll(Model model, @RequestParam(defaultValue = "1") int cpage) {
		log.info("/sellSelectAll.do");
		log.info("cpage...{}",cpage);
		List<SellVO> vos = service.selectAll(cpage);
		log.info("{}",vos);
		int result = service.sellRowCount();
		log.info("result...{}", Math.ceil(result/10.0));
		model.addAttribute("totalPageCount",Math.ceil(result/10.0));
		model.addAttribute("vos",vos);
	
		
		return "myMarket/mydealsell";
	}

	
	@RequestMapping(value = {"/sellDeleteOK.do"}, method = RequestMethod.GET)
	public String sellDeleteOK(SellVO vo) {
		log.info("/sellDeleteOK.do");
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:sellSelectAll.do";
		}else {
			return "redirect:sellSelectAll.do";
//			return "redirect:boardSelectOne.do?board_num="+vo.getBoard_num();		
		}
	}
	
	
}
