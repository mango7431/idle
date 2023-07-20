package test.com.idle.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.config.StompWebSocketConfig;
import test.com.idle.dao.NotificationDAO;
import test.com.idle.dto.NotificationDTO;
import test.com.idle.repository.EmitterRepository;
import test.com.idle.vo.MemberVO;
import test.com.idle.vo.NotificationVO;
@Slf4j
@Service
public class NotificationService {
	// 기본 타임아웃 설정
    private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60;
    
    private final EmitterRepository emitterRepository;
    private final NotificationDAO notificationDAO;
    private final StompWebSocketConfig webSocketConfig;
    
    @Autowired
    public NotificationService(EmitterRepository emitterRepository, NotificationDAO notificationDAO, StompWebSocketConfig webSocketConfig) {
        this.emitterRepository = emitterRepository;
        this.notificationDAO = notificationDAO;
        this.webSocketConfig = webSocketConfig;
    }
    
    // 클라이언트가 구독을 위해 메소드
    // memberId : 구독하는 클라이언트의 사용자 아이디
    // SseEmitter : 서버에서 보낸 이벤트 Emitter
    // lastEventId : 유실된 데이터를 재전송하기 위함
    public SseEmitter subscribe(String memberId, String lastEventId) {
    	log.info("memberId:{}", memberId);
    	String emitterId = makeTimeIncludeId(memberId);
    	
        SseEmitter emitter = emitterRepository.save(emitterId, new SseEmitter(DEFAULT_TIMEOUT));
        
        // SseEmitter의 시간 초과 및 네트워크 오류를 포함한 모든 이유로 비동기 요청이 정상 동작할 수 없으면 SseEmitter를 삭제
        emitter.onCompletion(()-> emitterRepository.deleteById(emitterId));
        
        // 503 에러를 방지하기 위한 더미 에벤트 전송
        String eventId = makeTimeIncludeId(memberId);
        sendNotification(emitter, eventId, emitterId, "EventStream Created. [userEmail=" + memberId + "]");
        
        // 클라이언트가 미수신한 Event 목록이 존재할 경우 전송하여 Event 유실을 예방
        if (!lastEventId.isEmpty()) {
            sendLostData(lastEventId, memberId, emitterId, emitter);
        }
        return emitter;
    }
    
    private void sendLostData(String lastEventId, String userEmail, String emitterId, SseEmitter emitter) {
        Map<String, Object> eventCaches = emitterRepository.findAllEventCacheStartWithById(String.valueOf(userEmail));
        eventCaches.entrySet().stream()
                .filter(entry -> lastEventId.compareTo(entry.getKey()) < 0)
                .forEach(entry -> sendNotification(emitter, entry.getKey(), emitterId, entry.getValue()));
    }

    // 실질적인 전송 : 알림이 필요한 곳에 추가하기
    public void send(MemberVO receiver, String title, String content,
    		int type, String link) {
    	
    	log.info("vo:{}", createNotification(receiver, title, content,type, link));
    	
    	NotificationVO notificationVO = insertNotification(receiver, title, content, type, link);
    	
		String receiverId = String.valueOf(receiver.getId());
		String eventId = receiverId + "_" + System.currentTimeMillis();
		Map<String, SseEmitter> emitters = emitterRepository.findAllEmitterStartWithById(receiverId);
		emitters.forEach(
		    (key, emitter) -> {
		        emitterRepository.saveEventCache(key, notificationVO);
		        sendNotification(emitter, eventId, key, NotificationDTO.Response.createResponse(notificationVO));
		    }
		);
    }
    
    private String makeTimeIncludeId(String memebrId) {
        return memebrId + "_" + System.currentTimeMillis();
    }

    // 클라이언트에게 데이터를 전송
    // id : 데이터를 받을 사용자 아이디
    // data : 전송할 데이터
    private void sendNotification(SseEmitter emitter, String eventId, String emitterId, Object data) {
    	 try {
             emitter.send(SseEmitter.event()
                                    .id(eventId)
                                    .name("message")
                                    .data(data));
         } catch (IOException exception) {
             emitterRepository.deleteById(emitterId);
             log.info("연결 오류!");
             //throw new RuntimeException("연결 오류!");
         }
    }

    // 사용자 아이디를 기반으로 이벤트 Emitter를 생성
    private NotificationVO createNotification(MemberVO receiver, String title, String content,
    		int type, String link) {
    	return NotificationVO.builder()
                .id(receiver.getId())
                .notification_title(title)
                .notification_content(content)
                .notification_type(type)
                .notification_link(link)
                .build();
    }
    
    
    public List<NotificationVO> notificationSeletAll(NotificationVO vo) {
    	return notificationDAO.selectAll(vo);
    }
    
    public Set<String> getChattingUser() {
    	return webSocketConfig.getChattingUser();
    }
    
    public NotificationVO insertNotification(MemberVO receiver, String title, String content,
    		int type, String link) {
    	return notificationDAO.insert(
					createNotification(receiver, title, content,
						    	type, link));
	}
}
