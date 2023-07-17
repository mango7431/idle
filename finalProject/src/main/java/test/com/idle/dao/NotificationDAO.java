package test.com.idle.dao;

import java.util.List;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import test.com.idle.vo.MemberVO;
import test.com.idle.vo.NotificationVO;

public interface NotificationDAO {
	public List<NotificationVO> selectAll(NotificationVO vo);
	
	public NotificationVO insert(NotificationVO vo);
}
