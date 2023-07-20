package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.NotificationVO;

public interface NotificationDAO {
	public List<NotificationVO> selectAll(NotificationVO vo);
	
	public NotificationVO insert(NotificationVO vo);
}
