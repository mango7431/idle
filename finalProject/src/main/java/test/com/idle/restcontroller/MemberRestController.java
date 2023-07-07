package test.com.idle.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.MemberService;
import test.com.idle.vo.MemberVO;

@Controller
@Slf4j
public class MemberRestController {
	
	@Autowired
	MemberService service;
	
	@ResponseBody
	@RequestMapping(value = "/jsonIdCheck.do", method = RequestMethod.GET)
	public Map<String, String> jsonIdCheck(MemberVO vo) {
		log.info("/jsonIdCheck.do");
		log.info("{}",vo);//id
		
		MemberVO vo2 = service.idCheck(vo);
		log.info("{}",vo2);//null or not null
		
		String msg="OK";
		if (vo2 != null) {
			msg="Not OK";
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", msg);
		return map;
	}//end jsonIdCheck
	
	@ResponseBody
	@RequestMapping(value = "/jsonMemberSelectOne.do", method = RequestMethod.GET)
	public MemberVO jsonMemberSelectOne(MemberVO vo) {
		log.info("/jsonMemberSelectOne.do...vo:{}", vo);
		log.info("{}",vo);
		
		MemberVO vo2 = service.selectOne(vo);
		log.info("vo2:{}", vo2);
		return vo2;
	}//end jsonMemberSelectOne
	
}//end class
