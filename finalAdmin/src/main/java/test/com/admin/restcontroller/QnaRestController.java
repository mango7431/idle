package test.com.admin.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.QnaService;
import test.com.admin.vo.Criteria;
import test.com.admin.vo.PageVO;
import test.com.admin.vo.QnaVO;


@Controller
@Slf4j
public class QnaRestController {
	
	@Autowired
	QnaService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonQnaSelectAll.do", method = RequestMethod.GET)
	public List<QnaVO> jsonQnaSelectAll(Criteria cri) {
		log.info("/jsonQnaSelectAll.do");
		log.info("Criteria:{}", cri);
		
		List<QnaVO> vos = service.qnaPaging(cri);
		log.info("vos.size():{}", vos.size());
		return vos;
	}// end jsonQnaSelectAll
	
	@ResponseBody
	@RequestMapping(value = {"/jsonQnaSelectCount.do"}, method = RequestMethod.GET)
	public PageVO jsonQnaSelectCount(Criteria cri) {
		log.info("/jsonQnaSelectCount.do");
		log.info("Criteria:{}", cri);
		
		int total = service.getTotalCount(cri);
		log.info("total:{}", total);
		
		PageVO pageVO = new PageVO(cri, total);
		return pageVO;
	}//end jsonQnaSelectCount
	
	@ResponseBody
	@RequestMapping(value = "/jsonQnaSelectOne.do", method = RequestMethod.GET)
	public QnaVO jsonQnaSelectOne(QnaVO vo) {
		log.info("/jsonQnaSelectOne.do...{}",vo);
		log.info("{}", vo);

		QnaVO vo2 = service.selectOne(vo);
		log.info("{}", vo2);

		return vo2;
	}//end jsonQnaSelectOne
	
}
