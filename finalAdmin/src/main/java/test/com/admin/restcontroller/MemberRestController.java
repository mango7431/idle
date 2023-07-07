package test.com.admin.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.MemberService;
import test.com.admin.vo.Criteria;
import test.com.admin.vo.MemberVO;
import test.com.admin.vo.PageVO;

@Controller
@Slf4j
public class MemberRestController {
	
	@Autowired
	private MemberService service;
	
//	@ResponseBody
//	@RequestMapping(value = {"/jsonMemberSelectAll.do"}, method = RequestMethod.GET)
//	public List<MemberVO> jsonMemberSelectAll() {
//		log.info("/jsonMemberSelectAll.do");
//		
//		List<MemberVO> vos = service.memberSelectAll();
//		log.info("vos size:{}", vos.size());
//		return vos;
//	}
	
	@ResponseBody
	@RequestMapping(value = {"/jsonMemberSelectAll.do"}, method = RequestMethod.GET)
	public List<MemberVO> jsonMemberSelectAll(Criteria cri) {
		log.info("/jsonMemberSelectAll.do");
		log.info("Criteria:{}", cri);
		
		List<MemberVO> vos = service.memberPaging(cri);
		log.info("vos size:{}", vos.size());
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/jsonMemberSelectCount.do"}, method = RequestMethod.GET)
	public PageVO jsonMemberSelectCount(Criteria cri) {
		log.info("/jsonMemberSelectCount.do");
		log.info("Criteria:{}", cri);
		
		int total = service.getTotalCount(cri);
		log.info("total:{}", total);
		
		PageVO pageVO = new PageVO(cri, total);
		return pageVO;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/jsonMemberSearchList.do"}, method = RequestMethod.GET)
	public List<MemberVO> jsonMemberSearchList(String searchKey, String searchWord) {
		log.info("/jsonMemberSearchList.do");
		log.info("searchKey:{}", searchKey);
		log.info("searchWord:{}", searchWord);
		
		List<MemberVO> vos = service.memberSearchList(searchKey, searchWord);
		log.info("vos size:{}", vos.size());
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/jsonMemberSelectOne.do"}, method = RequestMethod.GET)
	public MemberVO jsonMemberSelectOne(MemberVO vo) {
		log.info("/jsonMemberSelectOne.do");
		
		MemberVO vo2 = service.memberSelectOne(vo);
		log.info("vo2:{}", vo2);
		return vo2;
	}
	
}
