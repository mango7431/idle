package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.NoticeDAO;
import test.com.idle.vo.NoticeVO;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired
	NoticeDAO dao;
	
	public NoticeService() {
		log.info("NoticeService()");
	}

	public List<NoticeVO> selectAllMain() {
		return dao.selectAllMain();
	}

}
