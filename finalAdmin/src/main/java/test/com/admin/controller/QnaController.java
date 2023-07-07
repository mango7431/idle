package test.com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.QnaService;
import test.com.admin.vo.QnaVO;

@Controller
@Slf4j
public class QnaController {

	@Autowired
	QnaService service;

	@RequestMapping(value = "/qnaSelectAll.do", method = RequestMethod.GET)
	public String qnaSelectAll(Model model) {
		log.info("/qnaSelectAll.do");

		List<QnaVO> vos = service.selectAll();
		for (QnaVO x : vos) {
			log.info(x.toString());
		}

		model.addAttribute("vos", vos);

		return "qna/selectAll";
	}// end qnaSelectAll

	@RequestMapping(value = "/qnaSelectOne.do", method = RequestMethod.GET)
	public String qnaSelectOne(QnaVO vo) {
		log.info("/qnaSelectOne.do");
		log.info("{}", vo);

		return "qna/selectOne";
	}// end qnaSelectOne

}
