package test.com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.NoticeService;
import test.com.admin.vo.NoticeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@RequestMapping(value = {"/noticeSelectAll.do"}, method = RequestMethod.GET)
	public String noticeSelectAll(Model model, @RequestParam(defaultValue = "1") int cpage) {
		log.info("/noticeSelectAll.do");
		log.info("cpage...{}",cpage);
		List<NoticeVO> vos = service.selectAll(cpage);
		log.info("{}",vos);
		int result = service.noticeRowCount();
		log.info("result...{}",Math.ceil(result/10.0));
		model.addAttribute("vos",vos);
		model.addAttribute("totalPageCount",Math.ceil(result/10.0));
		
		
		return "notice/selectAll";
	}
	
	
	
	@RequestMapping(value = {"/noticeSelectOne.do"}, method = RequestMethod.GET)
	public String noticeSelectOne(NoticeVO vo, Model model) {
		log.info("/noticeSelectOne.do...{}",vo);
		
		NoticeVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2",vo2);
		
		return "notice/selectOne";
	}
	
	@RequestMapping(value = {"/noticeSearchList.do"}, method = RequestMethod.GET)
	public String noticeSearchList(Model model,String searchKey, String searchWord) {
		log.info("/noticeSearchList.do");
		log.info("searchKey:{}",searchKey);
		log.info("searchWord:{}",searchWord);
		
		List<NoticeVO> vos = service.searchList(searchKey,searchWord);
		
		model.addAttribute("vos",vos);
		
		return "notice/selectAll";
	}
	
	@RequestMapping(value = {"/noticeInsert.do"}, method = RequestMethod.GET)
	public String noticeInsert() {
		log.info("/noticeInsert.do");
		
		return "notice/insert";
	}
	
	@RequestMapping(value = {"/noticeInsertOK.do"}, method = RequestMethod.POST)
	public String noticeInsertOK(NoticeVO vo) {
		log.info("/noticeInsertOK.do...{}",vo);
		
		int result = service.insert(vo);
		log.info("result...{}", result);
		
		if(result == 1) {
			return "redirect:n_selectAll.do";
		}else {
			return "redirect:n_insert.do";
		}
		
	}
	
	@RequestMapping(value = {"/noticeUpdate.do"}, method = RequestMethod.GET)
	public String noticeUpdate(NoticeVO vo, Model model) {
		log.info("/noticeUpdate.do...{}",vo);
		
		NoticeVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2",vo2);
		
		return "notice/update";
	}
	
	@RequestMapping(value = {"/noticeUpdateOK.do"}, method = RequestMethod.POST)
	public String noticeUpdateOK(NoticeVO vo) {
		log.info("/noticeUpdateOK.do...{}",vo);
		
		int result = service.update(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:noticeSelectOne.do?notice_num="+vo.getNotice_num();
		}else {
			return "redirect:noticeUpdate.do?notice_num="+vo.getNotice_num();			
		}
	}
	
	@RequestMapping(value = {"/noticeDeleteOK.do"}, method = RequestMethod.GET)
	public String noticeDeleteOK(NoticeVO vo) {
		log.info("/noticeDeleteOK.do...{}",vo);
		
		int result = service.delete(vo);
		log.info("result...{}", result);
		
		if(result==1) {
			return "redirect:noticeSelectAll.do";
		}else {
			return "redirect:noticeSelectOne.do?notice_num="+vo.getNotice_num();			
		}
	}
	
}
