package test.com.idle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.QnaService;
import test.com.idle.vo.Criteria;
import test.com.idle.vo.PageVO;
import test.com.idle.vo.QnaVO;

@Slf4j
@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@RequestMapping(value = "/qnaSelectAll.do", method = RequestMethod.GET)
	public String qnaSelectAll(Criteria cri, Model model) {
		log.info("/qnaSelectAll.do");
		
		model.addAttribute("cri", cri);
		
		return "qna/selectAll";
	}
	
	@RequestMapping(value = "/qnaSelectOne.do", method = RequestMethod.GET)
	public String qnaSelectOne(@ModelAttribute("cri") Criteria cri, Model model, QnaVO vo) {
		log.info("/qnaSelectOne.do");
		
		model.addAttribute("qna_category", vo.getQna_category());
		
		return "qna/selectOne";
	}
	
	@RequestMapping(value = "/qnaInsert.do", method = RequestMethod.GET)
	public String qnaInsert(Model model) {
		log.info("/qnaInsert.do");
		
		return "qna/insert";
	}
	
	@RequestMapping(value = "/qnaInsertOK.do", method = RequestMethod.GET)
	public String qnaInsertOK(QnaVO vo) {
		log.info("/qnaInsertOK.do");
		log.info("{}", vo);
		
		int result = service.qnaInsert(vo);
		log.info("result:{}", result);
		
		if(result == 1) {
			return "redirect:qnaSelectAll.do";
		} else {			
			return "redirect:qnaInsert.do";
		}
	}
	
	@RequestMapping(value = "/qnaUpdate.do", method = RequestMethod.GET)
	public String qnaUpdate(@ModelAttribute("cri") Criteria cri, Model model, QnaVO vo) {
		log.info("/qnaUpdate.do");
		
		model.addAttribute("qna_category", vo.getQna_category());
		
		return "qna/update";
	}
	
	@RequestMapping(value = "/qnaUpdateOK.do", method = RequestMethod.GET)
	public String qnaUpdateOK(@ModelAttribute("cri") Criteria cri, QnaVO qnaVO, 
			RedirectAttributes rttr) {
		log.info("/qnaUpdateOK.do");
		log.info("QnaVO:{}", qnaVO);
		log.info("pageNum:{}", cri.getPageNum());

		int result = service.qnaUpdate(qnaVO);
		log.info("result:{}", result);
				
		rttr.addAttribute("qna_category", qnaVO.getQna_category());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		if(result == 1) {
			return "redirect:qnaSelectOne.do?qna_num="+qnaVO.getQna_num();
		} else {			
			return "redirect:qnaUpdate.do?qna_num="+qnaVO.getQna_num();
		}
	}
	
	@RequestMapping(value = "/qnaDeleteOK.do", method = RequestMethod.GET)
	public String qnaDeleteOK(QnaVO vo) {
		log.info("/qnaDeleteOK.do");
		log.info("{}", vo);
		
		int result = service.qnaDelete(vo);
		log.info("result:{}", result);
		
		if(result==1) {
			return "redirect:qnaSelectAll.do";
		} else {
			return "redirect:qnaSelectOne.do?qna_num=" + vo.getQna_num();
		}

	}
	
}
