package test.com.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BlackController {

	
	@RequestMapping(value = "/blackSelectAll.do", method = RequestMethod.GET)
	public String blackSelectAll() {
		log.info("blackSelectAll()...");
	
		return "black/selectAll";
	}
}
