package test.com.idle.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.MyWriteService;

@Controller
@Slf4j
public class myWriteRestController {
	
	@Autowired
	MyWriteService service;
	
	//상위로이동
	@RequestMapping(value = "/jsonBoardDateUpdate.do", method = RequestMethod.GET)
	@ResponseBody
	public int jsonBoardDateUpdate(@RequestParam("board_num") int board_num) {
		log.info("/jsonBoardDateUpdate.do...{}",board_num);
		
		int result = service.dateupdate(board_num);
		log.info("{}",result);
		
		return result;
	}
	
	//구매완료
	@RequestMapping(value = "/doneBuyInsertOK.do", method = RequestMethod.POST)
	@ResponseBody
	public int doneBuyInsertOK(@RequestParam("board_num") int board_num, @RequestParam("seller") String seller) {
		log.info("/doneBuyInsertOK.do...{,{}}",board_num,seller);
		
		//board_status를 2로 변경
		service.updateBoardStatus(board_num, 2);
		
		int result = service.doneinsert(board_num,seller);
		log.info("{}",result);
		
		return result;
	}
	
	//판매완료
	@RequestMapping(value = "/doneSellInsertOK.do", method = RequestMethod.POST)
	@ResponseBody
	public int doneSellInsertOK(@RequestParam("board_num") int board_num, @RequestParam("buyer") String buyer) {
		log.info("/doneSellInsertOK.do...{,{}}",board_num,buyer);
		
		//board_status를 2로 변경
		service.updateBoardStatus(board_num, 2);
		
		int result = service.donesellinsert(board_num,buyer);
		log.info("{}",result);
		
		return result;
	}
	
	//비공개 //구매중
	@RequestMapping(value = "/jsonStatusUpdate.do", method = RequestMethod.GET)
	@ResponseBody
	public int jsonStatusUpdate(@RequestParam("board_num") int board_num, @RequestParam("board_status") int board_status) {
		log.info("/jsonStatusUpdate.do:{},{}",board_num,board_status);
		
		int result = service.statusupdate(board_num,board_status);
		log.info("{}",result);
		
		return result;
	}
	
	//삭제
	@RequestMapping(value = "/jsonMyBoardDelete.do", method = RequestMethod.GET)
	@ResponseBody
	public int jsonMyBoardDelete(@RequestParam("board_num") int board_num) {
		log.info("/jsonMyBoardDelete.do...{}",board_num);
		
		int result = service.delete(board_num);
		log.info("{}",result);
		
		return result;
	}

}
