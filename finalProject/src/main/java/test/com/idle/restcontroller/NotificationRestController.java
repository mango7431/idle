package test.com.idle.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.NotificationService;
import test.com.idle.vo.NotificationVO;

@Slf4j
@RestController
public class NotificationRestController {
	
	@Autowired
	NotificationService notificationService;
	
	// 나중에 id를 access-token으로 수정해야함.
    @GetMapping(value = "/subscribe.do", produces = "text/event-stream")
    public SseEmitter subscribe(String memberId,
    		@RequestHeader(value = "Last-Event-ID", required = false, defaultValue = "") String lastEventId) {
    	log.info("restController(memberId):{}",memberId);
        return notificationService.subscribe(memberId, lastEventId);
    }
    
    @GetMapping(value = "/jsonNotificationSelectAll.do")
    public List<NotificationVO> jsonNotificationSelectAll(NotificationVO vo) {
    	log.info("jsonNotificationSelectAll()...");
    	List<NotificationVO> vos = notificationService.notificationSeletAll(vo);
    	
    	return vos;
    }
}
