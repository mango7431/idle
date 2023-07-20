package test.com.idle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.MyWriteService;
import test.com.idle.vo.LikesVO;

@Controller
@Slf4j
public class MyLikesController {
	
	@Autowired
	MyWriteService service;
	
	@RequestMapping(value = "/myLikeSelectAll.do", method = RequestMethod.GET)
	public String myLikeSelectAll(LikesVO vo) {
		log.info("/myLikeSelectAll.do:{}",vo);

		return "myMarket/myLikes/selectAll";
	}
}
