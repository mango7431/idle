package test.com.idle.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.BoardService;
import test.com.idle.vo.BoardVO;

@Controller
@Slf4j
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	ServletContext sContext;
	
	//수정
	// 중고거래 목록
	@RequestMapping(value = "/boardSelectAll.do", method = RequestMethod.GET)
	public String boardSelectAll(Model model, @RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "minPrice", required = false) Integer minPrice,
			@RequestParam(value = "maxPrice", required = false) Integer maxPrice,
			@RequestParam(value = "sortType", required = false) String sortType,
			@RequestParam(value = "board_type", required = false) Integer board_type) {
		log.info("/boardSelectAll.do,{},{}", category, minPrice);
		log.info("/boardSelectAll.do,{},{}", sortType, board_type);

		if (category == null || category.equals("all")) {
			if (sortType == null || sortType.equals("latest")) {
				List<BoardVO> vos = service.boardSelectAll(minPrice, maxPrice, board_type);
				model.addAttribute("vos", vos);
			} else if (sortType.equals("views")) {
				List<BoardVO> vos = service.boardSelectAllViews(minPrice, maxPrice, board_type);
				model.addAttribute("vos", vos);
			}
		} else {
			List<BoardVO> vos = service.boardSelectAll(category, minPrice, maxPrice, board_type);
			model.addAttribute("vos", vos);
		}

		return "board/selectAll";
	}

	
	@RequestMapping(value = "/boardSelectOne.do", method = RequestMethod.GET)
	public String boardSelectOne(BoardVO vo, Model model) {
		log.info("/boardSelectOne.do...{}",vo);
		
		int result = service.viewCountUp(vo);
		log.info("result : {}",result);
		
		BoardVO vo2 = service.selectOne(vo);
		model.addAttribute("vo2",vo2);
		
		return "board/selectOne";
	}
	
	@RequestMapping(value = "/boardInsert.do", method = RequestMethod.GET)
	public String insert() {
		log.info("/insert.do...");
		
		return "board/insert";
	}
	
	@RequestMapping(value = "/boardInsertOK.do", method = RequestMethod.POST)
	public String insertOK(BoardVO vo) throws IllegalStateException, IOException {
		log.info("/insertOK.do...{}",vo);
		
		List<String> list = new ArrayList<String>(Arrays.asList("board_default.png","board_default.png","board_default.png"));
		
		for(int i=0;i<vo.getMultipartFiles().size();i++) {
			String getOriginalFileName = vo.getMultipartFiles().get(i).getOriginalFilename();
			int fileNameLength = vo.getMultipartFiles().get(i).getOriginalFilename().length();
			log.info("진짜 파일 이름 : {}", getOriginalFileName);
			log.info("진짜 파일 이름 길이 : {}", fileNameLength);
			
			if(getOriginalFileName.length()!=0){
				list.set(i,getOriginalFileName);
				String realPath = sContext.getRealPath("resources/img");
				String adminRealPath = realPath.replaceAll("finalProject", "finalAdmin");
				log.info("realPath : {}", realPath);
				log.info("adminRealPath : {}", adminRealPath);
				
				// 관리자 프로젝트쪽에도 이미지 생성
				File adminf = new File(adminRealPath+"\\"+list.get(i));
				FileCopyUtils.copy(vo.getMultipartFiles().get(i).getBytes(),adminf);
				
				File f = new File(realPath + "\\" + list.get(i));
				vo.getMultipartFiles().get(i).transferTo(f);
				
				BufferedImage original_buffer_img = ImageIO.read(f);
				BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
				Graphics2D graphic = thumb_buffer_img.createGraphics();
				graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);
				
				File thumb_file = new File(realPath + "/thumb_" + list.get(i));
				String formatName = list.get(i).substring(list.get(i).lastIndexOf(".")+1);
				log.info("{}",formatName);
				ImageIO.write(thumb_buffer_img, formatName, thumb_file);
				
				// 관리자쪽에 썸네일 추가
				File admin_thumb_file = new File(adminRealPath + "/thumb_" + list.get(i));
				log.info("{}",formatName);
				ImageIO.write(thumb_buffer_img, formatName, admin_thumb_file);
			}
		}
		
		vo.setBoard_savename1(list.get(0));
		vo.setBoard_savename2(list.get(1));
		vo.setBoard_savename3(list.get(2));
		
		
		int result = service.insert(vo);
		log.info("result : {}",result);
		
		if(result==1) {
			return "redirect:boardSelectAll.do";
		}else {
			return "redirect:boardInsert.do";
		}
	}
	
	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(BoardVO vo, Model model) {
		log.info("/boardUpdate.do...{}",vo);
		
		BoardVO vo2 = service.selectOne(vo);
		
		model.addAttribute("vo2",vo2);
		
		return "board/update";
	}
		
	@RequestMapping(value = "/boardUpdateOK.do", method = RequestMethod.POST)
	public String boardUpdateOK(BoardVO vo) throws IllegalStateException, IOException {
		log.info("/boardUpdateOK.do...{}",vo);
		log.info("사이즈 : {}",vo.getMultipartFiles().size());
		
		List<MultipartFile> selectedFiles = new ArrayList<MultipartFile>();
		
		for (MultipartFile file : vo.getMultipartFiles()) {
			if(!file.isEmpty()) {
				log.info("{}",file);
				selectedFiles.add(file);
			}
		}
		log.info("selectedFiles {}",selectedFiles);
		
		if(selectedFiles.size()!=0) {
			
			List<String> list = new ArrayList<String>(Arrays.asList("board_default.png","board_default.png","board_default.png"));
			
			for(int i=0;i<vo.getMultipartFiles().size();i++) {
				String getOriginalFileName = vo.getMultipartFiles().get(i).getOriginalFilename();
				int fileNameLength = vo.getMultipartFiles().get(i).getOriginalFilename().length();
				log.info("진짜 파일 이름 : {}", getOriginalFileName);
				log.info("진짜 파일 이름 길이 : {}", fileNameLength);
				
				if(getOriginalFileName.length()!=0){
					list.set(i,getOriginalFileName);
					String realPath = sContext.getRealPath("resources/img");
					String adminRealPath = realPath.replaceAll("finalProject", "finalAdmin");
					log.info("realPath : {}", realPath);
					log.info("adminRealPath : {}", adminRealPath);
					
					// 관리자 프로젝트쪽에도 이미지 생성
					File adminf = new File(adminRealPath+"\\"+list.get(i));
					FileCopyUtils.copy(vo.getMultipartFiles().get(i).getBytes(),adminf);
					
					File f = new File(realPath + "\\" + list.get(i));
					vo.getMultipartFiles().get(i).transferTo(f);
					
					BufferedImage original_buffer_img = ImageIO.read(f);
					BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
					Graphics2D graphic = thumb_buffer_img.createGraphics();
					graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);
					
					File thumb_file = new File(realPath + "/thumb_" + list.get(i));
					String formatName = list.get(i).substring(list.get(i).lastIndexOf(".")+1);
					log.info("{}",formatName);
					ImageIO.write(thumb_buffer_img, formatName, thumb_file);
					
					File admin_thumb_file = new File(adminRealPath + "/thumb_" + list.get(i));
					log.info("{}",formatName);
					ImageIO.write(thumb_buffer_img, formatName, admin_thumb_file);
				}
			}
			
			vo.setBoard_savename1(list.get(0));
			vo.setBoard_savename2(list.get(1));
			vo.setBoard_savename3(list.get(2));
		}
		
		int result = service.update(vo);
		log.info("result : {}",result);
		
		if(result==1) {
			return "redirect:boardSelectOne.do?board_num="+vo.getBoard_num();
		}else {
			return "redirect:boardUpdate.do?board_num="+vo.getBoard_num();
		}
	}
	
	@RequestMapping(value = "/boardDeleteOK.do", method = RequestMethod.GET)
	public String boardDeleteOK(BoardVO vo) {
		log.info("/boardDeleteOK.do...{}",vo);
		
		int result = service.delete(vo);
		log.info("result : {}",result);
		
		if(result==1) {
			return "redirect:boardSelectAll.do";
		}else {
			return "redirect:boardSelectOne.do?board_num="+vo.getBoard_num();
		}
	}
}
