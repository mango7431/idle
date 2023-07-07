package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.MessageVO;

public interface MessageDAO {

	int insert(MessageVO vo);

	List<MessageVO> selectAll(MessageVO vo);

	MessageVO selectSavename(MessageVO vo);

	int readCheck(MessageVO vo);

	int readCount(MessageVO vo);

}
