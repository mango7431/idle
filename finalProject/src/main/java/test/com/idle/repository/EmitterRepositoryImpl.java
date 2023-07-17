package test.com.idle.repository;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Repository
public class EmitterRepositoryImpl implements EmitterRepository {
	// 모든 Emitters를 저장하는 ConcurrentHashMap
	private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
	private final Map<String, Object> eventCache = new ConcurrentHashMap<>();

	// id와 sseEmitter를 저장
	public SseEmitter save(String emitterId, SseEmitter sseEmitter) {
		emitters.put(emitterId, sseEmitter);
		return sseEmitter;
	}

	// 주어진 아이디의 Emitter를 제거
	public void deleteById(String id) {
		emitters.remove(id);
	}

	@Override
	public Map<String, SseEmitter> findAllEmitterStartWithById(String memberId) {
		return emitters.entrySet().stream().filter(entry -> entry.getKey().startsWith(memberId))
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	@Override
	public Map<String, Object> findAllEventCacheStartWithById(String memberId) {
		return eventCache.entrySet().stream().filter(entry -> entry.getKey().startsWith(memberId))
				.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	@Override
	public void deleteAllEmitterStartWithId(String memberId) {
		emitters.forEach((key, emitter) -> {
			if (key.startsWith(memberId)) {
				emitters.remove(key);
			}
		});
	}

	@Override
	public void deleteAllEventCacheStartWithId(String memberId) {
		eventCache.forEach((key, emitter) -> {
			if (key.startsWith(memberId)) {
				eventCache.remove(key);
			}
		});
	}

	@Override
	public void saveEventCache(String emitterId, Object event) {
		eventCache.put(emitterId, event);
	}
}
