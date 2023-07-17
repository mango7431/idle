package test.com.idle.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.LikesService;
import test.com.idle.vo.LikesVO;

@Controller
@Slf4j
public class LikesRestController {
	
	@Autowired
	LikesService service;
	
	@RequestMapping(value = "/jsonLikeSelectOne.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> jsonLikeSelectOne(LikesVO vo) {
		log.info("/jsonLikeSelectOne.do...{}",vo);
		
		LikesVO vo2 = service.selectOne(vo);
		log.info("{}",vo2);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("LikesVO", vo2);
		
		if(vo2==null) {
			map.put("result", "OK");
			
		}else {
			map.put("result", "NotOK");
		}
		
		return map;

	}
	
	@RequestMapping(value = "/jsonLikeInsert.do", method = RequestMethod.GET)
	@ResponseBody
	public int jsonLikeInsert(LikesVO vo) {
		log.info("/jsonLikeInsert.do...{}",vo);
		
		int result = service.insert(vo);
		log.info("{}",result);
		
		return result;
	}
	
	@RequestMapping(value = "/jsonLikeDelete.do", method = RequestMethod.GET)
	@ResponseBody
	public int jsonLikeDelete(LikesVO vo) {
		log.info("/jsonLikeDelete.do...{}",vo);
		
		int result = service.delete(vo);
		log.info("{}",result);
		
		return result;
	}
	
	//수정
	@RequestMapping(value = "/jsonLikeSelectAll.do", method = RequestMethod.GET)
	@ResponseBody
	public List<LikesVO> jsonLikeSelectAll(LikesVO vo, Model model) {
		log.info("/jsonLikeSelectAll.do...{}",vo);
		
		String user_id = "tester3";
		
		List<LikesVO> vos = service.selectAll(user_id);
		log.info("restcontroller vos:{}",vos);
		model.addAttribute("vos",vos);
		
		return vos;
	}
	

	//selectAll 찜해제
	@RequestMapping(value = "/jsonLikeOnlyDelete.do", method = RequestMethod.GET)
	@ResponseBody
	public int jsonLikeOnlyDelete(@RequestParam("likes_num") int likesNum) {
		log.info("/jsonLikeOnlyDelete.do...{}",likesNum);
		
		LikesVO vo = new LikesVO();
		vo.setLikes_num(likesNum);
		
		int result = service.delete(vo);
		log.info("{}",result);
		
		return result;
	}

}
