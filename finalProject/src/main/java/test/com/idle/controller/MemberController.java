package test.com.idle.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.MemberService;
import test.com.idle.vo.MemberVO;

@Controller
@Slf4j
public class MemberController {

	@Autowired
	MemberService service;

	@Autowired
	ServletContext sContext;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "/memberInsert.do", method = RequestMethod.GET)
	public String memberInsert3() {
		log.info("/memberInsert.do");

		return "member/insert";
	}// end memberInsert

	@RequestMapping(value = "/memberInsertOK.do", method = RequestMethod.POST)
	public String memberInsertOK(MemberVO vo) throws IllegalStateException, IOException {
		log.info("/memberInsertOK.do");
		log.info("{}", vo);

		String getOriginalFilename = vo.getMultipartFile().getOriginalFilename();
		int fileNameLength = vo.getMultipartFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}", getOriginalFilename);
		log.info("fileNameLength:{}", fileNameLength);

		if (getOriginalFilename.length() == 0) {
			vo.setMember_savename("default.png");
		} else {
			vo.setMember_savename(getOriginalFilename);
			// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			// 오리지날 사진저장
			File f = new File(realPath + "\\" + vo.getMember_savename());
			vo.getMultipartFile().transferTo(f);

			// 썸네일 사진저장
			//// create thumbnail image/////////
			BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);

			File thumb_file = new File(realPath + "/thumb_" + vo.getMember_savename());

			String formatName = vo.getMember_savename().substring(vo.getMember_savename().lastIndexOf(".") + 1);
			log.info("formatName : {}", formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file);

		} // end else
		log.info("{}", vo);

		int result = service.insert(vo);
		log.info("result : {}", result);
		if (result == 1) {
			return "redirect:home.do";
		} else {
			return "redirect:memberInsert3.do";
		}

	}// end memberInsertOK

	@RequestMapping(value = "/memberSelectOne.do", method = RequestMethod.GET)
	public String memberSelectOne(MemberVO vo) {
		log.info("/memberSelectOne.do");
		log.info("{}", vo);

		return "member/myPage";
	}// end memberSelectOne

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(String message, Model model) {
		log.info("/login.do....{}", message);

		if (message != null)
			message = "아이디또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요";
		model.addAttribute("message", message);

		return "member/login";
	}// end login

	@RequestMapping(value = "/loginOK.do", method = RequestMethod.POST)
	public String loginOK(MemberVO vo) {
		log.info("/loginOK.do...{}", vo);

		MemberVO vo2 = service.login(vo);
		log.info("vo2...{}", vo2);

		if (vo2 == null) {
			return "redirect:login.do?message=fail";
		} else {
			session.setAttribute("user_id", vo2.getId());
			return "redirect:home.do";
		}

	}// end loginOK

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout() {
		log.info("/logout.do");

		session.invalidate();

		return "redirect:home.do";
	}// end logout

}// end class
