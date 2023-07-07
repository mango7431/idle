package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.MessageDAO;
import test.com.idle.vo.MessageVO;

@Service
@Slf4j
public class MessageService {
	
	@Autowired
	MessageDAO dao;
	
	public MessageService() {
		log.info("MessageService()...");
	}

	public int insert(MessageVO vo) {
		return dao.insert(vo);
	}

	public List<MessageVO> selectAll(MessageVO vo) {
		return dao.selectAll(vo);
	}

	public MessageVO selectSavename(MessageVO vo) {
		return dao.selectSavename(vo);
	}

	public int readCheck(MessageVO vo) {
		return dao.readCheck(vo);
	}

	public int readCount(MessageVO vo) {
		return dao.readCount(vo);
	}

}
