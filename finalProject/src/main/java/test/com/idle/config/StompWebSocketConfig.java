package test.com.idle.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableWebSocketMessageBroker
@Slf4j
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer{
	
	public StompWebSocketConfig() {
		log.info("StompWebSocketConfig()...");
	}
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker("/sub"); 
//		registry.enableSimpleBroker("/sub", "/user/queue"); // "/user/queue/"를 추가하여 개별 사용자 큐를 활성화함
		registry.setApplicationDestinationPrefixes("/pub");
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		
		registry.addEndpoint("/chat/{roomNum}/info").setAllowedOrigins("*").withSockJS();
		
	}

}
