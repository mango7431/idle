package test.com.admin.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.service.BlackService;
import test.com.admin.vo.BlackVO;
import test.com.admin.vo.Criteria;
import test.com.admin.vo.PageVO;

@Controller
@Slf4j
public class BlackRestController {
	
	@Autowired
	BlackService service;

	@RequestMapping(value = "/jsonBlackSelectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<BlackVO> jsonBlackSelectAll(Criteria cri, Model model) {
		log.info("jsonBlackSelectAll()..{}",cri);
		
		PageVO pagevo = new PageVO(cri,service.getTotal());
		log.info("pagevo:{}",pagevo);
		
		List<BlackVO> vos = service.jsonBlackSelectAll(cri);
		log.info(vos.toString());
		
		model.addAttribute("pageVO",pagevo);
		
		return vos;
	}
	
	//경고+1
	@RequestMapping(value = "/reportUp.do", method = RequestMethod.GET)
	@ResponseBody
	public void reportUp(BlackVO vo, @RequestParam("black_type") int black_type) {
		log.info("reportUp()..{},{}",vo,black_type);
		
		if(black_type == 2) {
			service.boardreportUp(vo);
		}else if(black_type == 1) {
			service.memberreportUp(vo);
		}
	}
	
	//신고처리
	@RequestMapping(value = "/changeStatus.do", method = RequestMethod.GET)
	@ResponseBody
	public void changeStatus(BlackVO vo, @RequestParam("black_num") int black_num) {
		log.info("changeStatus()..{},{}",vo,black_num);
		
		service.changeStatus(black_num);

	}
	
	//신고게시글 삭제
	@RequestMapping(value = "/removeBoard.do/{board_num}", method = RequestMethod.GET)
	@ResponseBody
	public void removeBoard(BlackVO vo, @PathVariable int board_num) {
		log.info("removeBoard()..{},{}",vo,board_num);

		service.removeBoard(board_num);
		service.memberreportUp(vo);
	}
	
	//신고회원 삭제
	@RequestMapping(value = "/removeMember.do/{targetid}", method = RequestMethod.GET)
	@ResponseBody
	public void removeMember(@PathVariable String targetid) {
		log.info("removeMember()..{}",targetid);

		service.removeMember(targetid);
	}
}