package test.com.idle.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.RoomService;
import test.com.idle.vo.RoomVO;

@Slf4j
@Controller
public class RoomController {
	
	@Autowired
	RoomService service;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/roomSelectAll.do", method = RequestMethod.GET)
	public String roomSelectAll(Model model) {
		log.info("/roomSelectAll.do");
		
		RoomVO vo = new RoomVO();
		vo.setBuyer(session.getAttribute("user_id").toString());
		log.info("vo : {}",vo);
		
		List<RoomVO> vos = service.selectAll(vo);
		log.info("vos : {}",vos);
		
		model.addAttribute("vos",vos);
		
		return "room/selectAll";
	}

}
