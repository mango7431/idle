package test.com.idle;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = {"/","/home.do"}, method = RequestMethod.GET)
	public String home() {
		log.info("home.do...");

		return "home";
	}
	
}
