package test.com.idle.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.QnaService;
import test.com.idle.vo.Criteria;
import test.com.idle.vo.PageVO;
import test.com.idle.vo.QnaVO;

@Slf4j
@Controller
public class QnaRestController {
	
	@Autowired
	private QnaService service;
	
	
	/*@ResponseBody
	@RequestMapping(value = "/jsonQnaSelectAll.do", method = RequestMethod.GET)
	public List<QnaVO> jsonQnaSelectAll(QnaVO vo) {
		log.info("/jsonQnaSelectAll.do...vo:{}", vo);
		
		List<QnaVO> vos = service.qnaSelectAll(vo);
		log.info("vos.size:{}", vos.size());
		return vos;
	}*/
	
	@ResponseBody
	@RequestMapping(value = "/jsonQnaSelectAll.do", method = RequestMethod.GET)
	public List<QnaVO> jsonQnaSelectAll(Criteria cri, QnaVO vo) {
		log.info("/jsonQnaSelectAll.do...vo:{}", vo);

		List<QnaVO> vos = service.paging(cri, vo);
		log.info("vos.size:{}", vos.size());
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonQnaSelectCount.do", method = RequestMethod.GET)
	public PageVO jsonQnaSelectCount(Criteria cri, QnaVO vo) {
		log.info("/jsonQnaSelectCount.do...vo:{}", vo);
		log.info("Criteria: " + cri);
		
		int total = service.getTotalCount(cri, vo);
		log.info("total: " + total);
		
		PageVO pageVO = new PageVO(cri, total);
		return pageVO;
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonQnaSelectOne.do", method = RequestMethod.GET)
	public QnaVO jsonQnaSelectOne(QnaVO vo) {
		log.info("/jsonQnaSelectOne.do...vo:{}", vo);
		
		QnaVO vo2 = service.qnaSelectOne(vo);
		log.info("vo2:{}", vo2);
		return vo2;
	}
}
