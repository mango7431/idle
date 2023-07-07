package test.com.idle;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String home(Locale locale, Model model) {
		log.info("home.do...");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/testlogin1.do", method = RequestMethod.GET)
	public String testlogin1() {
		log.info("/testlogin1.do...");
		
		session.setAttribute("user_id", "tester1");
		
		return "redirect:home.do";
	}
	
	@RequestMapping(value = "/testlogin2.do", method = RequestMethod.GET)
	public String testlogin2() {
		log.info("/testlogin2.do...");
		
		session.setAttribute("user_id", "tester2");
		
		return "redirect:home.do";
	}
	
	@RequestMapping(value = "/testlogin123.do", method = RequestMethod.GET)
	public String testlogin123() {
		log.info("/testlogin123.do...");
		
		session.setAttribute("user_id", "tester123");
		
		return "redirect:home.do";
	}
	
	@RequestMapping(value = "/testlogout.do", method = RequestMethod.GET)
	public String testlogout() {
		log.info("/testlogout.do...");
		
		session.invalidate();
		
		return "redirect:home.do";
	}
	
}
