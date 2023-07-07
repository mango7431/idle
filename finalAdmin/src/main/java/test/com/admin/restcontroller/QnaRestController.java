package test.com.admin.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.QnaService;
import test.com.admin.vo.QnaVO;


@Controller
@Slf4j
public class QnaRestController {
	
	@Autowired
	QnaService service;
	
	@RequestMapping(value = "/jsonQnaSelectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<QnaVO> jsonQnaSelectAll() {
		log.info("/jsonQnaSelectAll.do");
		
		List<QnaVO> vos = service.selectAll();
		log.info("vos.size():{}", vos.size());
		return vos;
	}// end jsonQnaSelectAll
	

	
	@RequestMapping(value = "/jsonQnaSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public QnaVO jsonQnaSelectOne(QnaVO vo) {
		log.info("/jsonQnaSelectOne.do...{}",vo);
		log.info("{}", vo);

		QnaVO vo2 = service.selectOne(vo);
		log.info("{}", vo2);

		return vo2;
	}//end jsonQnaSelectOne
	
}
