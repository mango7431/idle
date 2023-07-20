package test.com.admin.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.NotificationDAO;
import test.com.admin.vo.NotificationVO;

@Slf4j
@Repository
public class NotificationDAOimpl implements NotificationDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<NotificationVO> selectAll(NotificationVO vo) {
		return sqlSession.selectList("NOTIFICATION_SELECT_ALL", vo);
	}

	@Override
	public NotificationVO insert(NotificationVO vo) {
		log.info("insert:{}", vo);
		sqlSession.insert("NOTIFICATION_INSERT", vo);
		
		int generatedKey = vo.getNotification_num();
		log.info("generatedKey:{}", generatedKey);
        // ������ Ű ���� ������� ������ ��ȸ�Ͽ� ��ü�� ��ȯ
        return sqlSession.selectOne("NOTIFICATION_SELECT_BY_KEY", generatedKey);
	}	
}
