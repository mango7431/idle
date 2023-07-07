package test.com.idle.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.MessageService;
import test.com.idle.vo.MessageVO;

@Controller
@Slf4j
public class MessageController {
	
	@Autowired
	MessageService service;
	
	@Autowired
	SimpMessagingTemplate template; // 특정 Broker로 메세지 전달
	
	@MessageMapping(value="/chat/enter")
	public void enter(MessageVO vo) {
		log.info("enter()...{}",vo);
		vo.setMessage(vo.getSender()+"님이 채팅방에 참여하였습니다.");
		log.info("{}",vo);
		
		template.convertAndSend("/sub/chat/room/"+vo.getRoom_num(),vo);
		
	}
	
	@MessageMapping(value = "/chat/message")
	public void message(MessageVO vo) {
		log.info("message()...{}",vo);
		
		if (vo.getMessage_date() == null) {
			  vo.setMessage_date(new Timestamp(System.currentTimeMillis()));
		}

		int result = service.insert(vo);
		if(result==1) {
			template.convertAndSend("/sub/chat/room/"+vo.getRoom_num(),vo);
		}else {
			log.info("메세지 전송 에러");
		}
		
	}

}
