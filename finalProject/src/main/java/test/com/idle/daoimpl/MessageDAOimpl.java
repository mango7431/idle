package test.com.idle.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.MessageDAO;
import test.com.idle.vo.MessageVO;

@Repository
@Slf4j
public class MessageDAOimpl implements MessageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public MessageDAOimpl() {
		log.info("MessageDAOimpl()...");
	}

	@Override
	public int insert(MessageVO vo) {
		log.info("insert()...{}",vo);
		int flag = 0;
		try {
			flag = sqlSession.insert("MESSAGE_INSERT",vo);			
		}catch (Exception e) {
			log.info("방삭제됨 ㅅㄱ");
		}
		return flag;
	}

	@Override
	public List<MessageVO> selectAll(MessageVO vo) {
		log.info("selectAll()...{}",vo);
		List<MessageVO> vos = sqlSession.selectList("MESSAGE_SELECT_ALL",vo);
		log.info("{}",vos);
		return vos;
	}

	@Override
	public MessageVO selectSavename(MessageVO vo) {
		log.info("selectSavename()...{}",vo);
		
		MessageVO vo2 = sqlSession.selectOne("MESSAGE_SELECT_SAVENAME",vo);
		
		return vo2;
	}

	@Override
	public int readCheck(MessageVO vo) {
		log.info("readCheck()...{}",vo);
		
		int flag = sqlSession.update("MESSAGE_READ_CHECK",vo);
		
		return flag;
	}

	@Override
	public int readCount(MessageVO vo) {
		log.info("readCount()...{}",vo);
		
		int flag = sqlSession.selectOne("READ_COUNT",vo);
		
		return flag;
	}

}
