package test.com.admin.repository;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Repository
public class EmitterRepositoryImpl implements EmitterRepository {
	// ��� Emitters�� �����ϴ� ConcurrentHashMap
	private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
	private final Map<String, Object> eventCache = new ConcurrentHashMap<>();

	// id�� sseEmitter�� ����
	public SseEmitter save(String emitterId, SseEmitter sseEmitter) {
		emitters.put(emitterId, sseEmitter);
		return sseEmitter;
	}

	// �־��� ���̵��� Emitter�� ����
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
