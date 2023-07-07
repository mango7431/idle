package test.com.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.MemberService;
import test.com.admin.vo.Criteria;
import test.com.admin.vo.MemberVO;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = {"/memberSelectAll.do"}, method = RequestMethod.GET)
	public String memberSelectAll(Criteria cri, Model model) {
		log.info("/memberSelectAll.do");
		
		model.addAttribute("cri", cri);
		return "member/selectAll";
	}
	
	@RequestMapping(value = {"/memberSelectOne.do"}, method = RequestMethod.GET)
	public String memberSelectOne() {
		log.info("/memberSelectOne.do");
		return "member/selectOne";
	}
	
	@RequestMapping(value = {"/memberDeleteOK.do"}, method = RequestMethod.GET)
	public String memberDeleteOK(MemberVO vo) {
		log.info("/memberDeleteOK.do");
		log.info("{}:", vo);
		
		int result = service.memberDelete(vo);
		log.info("result:{}", result);
		
		if(result==1) {
			return "redirect:memberSelectAll.do";
		} else {
			return "redirect:memberSelectOne.do?id=" + vo.getId();
		}
	}	
}
