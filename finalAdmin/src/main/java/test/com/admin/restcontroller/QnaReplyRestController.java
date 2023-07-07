package test.com.admin.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.QnaReplyService;
import test.com.admin.vo.QnaReplyVO;


@Controller
@Slf4j
public class QnaReplyRestController {
	
	@Autowired
	QnaReplyService service;
	
	@RequestMapping(value = "/jsonQnaReplySelectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<QnaReplyVO> jsonQnaReplySelectAll(QnaReplyVO vo) {
		log.info("/jsonQnaReplySelectAll.do..{}",vo);
		
		List<QnaReplyVO> vos = service.selectAll(vo);
		log.info("vos.size():{}", vos.size());
		return vos;
	}// end jsonQnaReplySelectAll
	
	@ResponseBody
	@RequestMapping(value = "/jsonQnaReplyInsertOK.do", method = RequestMethod.GET)
	public String jsonQnaReplyInsertOK(QnaReplyVO vo) {
		log.info("/jsonQnaReplyInsertOK.do..{}",vo);
		
		int result = service.insert(vo);
		log.info("result : {}",result);
		if(result==1) {
			return "{\"result\":1}";
		}else {
			return "{\"result\":0}";
		}
	}// end jsonQnaReplyInsertOK
	
	@ResponseBody
	@RequestMapping(value = "/jsonQnaReplyUpdateOK.do", method = RequestMethod.GET)
	public String jsonQnaReplyUpdateOK(QnaReplyVO vo) {
		log.info("/jsonQnaReplyUpdateOK.do...{}",vo);
		
		int result = service.update(vo);
		log.info("result : {}",result);
		if(result==1) {
			return "{\"result\":1}";
		}else {
			return "{\"result\":0}";
		}
	}//end jsonQnaReplyUpdateOK
	
	@ResponseBody
	@RequestMapping(value = "/jsonQnaReplyDeleteOK.do", method = RequestMethod.GET)
	public String jsonQnaReplyDeleteOK(QnaReplyVO vo) {
		log.info("/jsonQnaReplyDeleteOK.do....{}",vo);
		
		int result = service.delete(vo);
		log.info("result : {}",result);
		if(result==1) {
			return "{\"result\":1}";
		}else {
			return "{\"result\":0}";
		}
	}//end jsonQnaReplyDeleteOK
	
	

	
}//end class
