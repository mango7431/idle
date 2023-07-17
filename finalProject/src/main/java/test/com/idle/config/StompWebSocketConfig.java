package test.com.idle.config;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.messaging.SessionConnectEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.service.NotificationService;

@Configuration
@EnableWebSocketMessageBroker
@Slf4j
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer{
	
	@Autowired
	NotificationService service;
	
	private Set<String> chattingUsers = new HashSet<String>();
	
	private String userID = null;
	
	public StompWebSocketConfig() {
		log.info("StompWebSocketConfig()...");
	}
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker("/sub"); 
		registry.setApplicationDestinationPrefixes("/pub");
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		
		registry.addEndpoint("/chat/{roomNum}/info").setAllowedOrigins("*").withSockJS();
		
	}
	
	// STOMP 연결 시 이벤트 처리
    @EventListener
    public void handleConnectEvent(SessionConnectEvent event) {
    	log.info("연결 성공");
    	StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
        log.info("headerAccessor:{}", headerAccessor);

        List<String> connetUserIdHeaders = headerAccessor.getNativeHeader("connect-user-id");
       
        log.info("connetUserIdHeaders:{}", connetUserIdHeaders.toString());
        
        if (connetUserIdHeaders != null && !connetUserIdHeaders.isEmpty()) {
            chattingUsers.add(connetUserIdHeaders.get(0));
            userID = connetUserIdHeaders.get(0);
        }

        log.info("connect - 채팅 중인 유저: {}", chattingUsers);
    }

    // STOMP 연결 종료 시 이벤트 처리
    @EventListener
    public void handleDisconnectEvent(SessionDisconnectEvent event) {
    	log.info("연결 종료");
        
        if (!chattingUsers.isEmpty()) {
            chattingUsers.remove(userID);
        }

        log.info("disconnect - 채팅 중인 유저: {}", chattingUsers);
    }

    // 채팅 유저 반환
    public Set<String> getChattingUser() {
        return chattingUsers;
    }

}
