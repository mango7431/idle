package test.com.idle.repository;

import java.util.Map;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

public interface EmitterRepository {
	public SseEmitter save(String emitterId, SseEmitter emitter);
	
	public void saveEventCache(String emitterId, Object event);
	
	Map<String, SseEmitter> findAllEmitterStartWithById(String memberId);
	
    Map<String, Object> findAllEventCacheStartWithById(String memberId);
	
	public void deleteById(String id);
	
	public void deleteAllEmitterStartWithId(String memberId);
	
	public void deleteAllEventCacheStartWithId(String memberId);
}
