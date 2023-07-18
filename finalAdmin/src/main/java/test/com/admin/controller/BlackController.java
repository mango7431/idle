package test.com.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.BlackService;
import test.com.admin.vo.Criteria;
import test.com.admin.vo.PageVO;

@Controller
@Slf4j
public class BlackController {
	
	@Autowired
	BlackService service;

	@RequestMapping(value = "/blackSelectAll.do", method = RequestMethod.GET)
	public String blackSelectAll(Criteria cri, Model model) {
		log.info("blackSelectAll()..{}",cri);
		
		PageVO pagevo = new PageVO(cri,service.getTotal());
		log.info("pagevo:{}",pagevo);
			
		//없어도됨
		model.addAttribute("pageVO",pagevo);
	
		return "black/selectAll";
	}
}
