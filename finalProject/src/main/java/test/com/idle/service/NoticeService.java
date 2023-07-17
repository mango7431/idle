package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.NoticeDAO;
import test.com.idle.vo.NoticeVO;

@Slf4j
@Service
public class NoticeService {
	
	@Autowired
	NoticeDAO dao;

	public NoticeService() {
		log.info("NoticeService...");
	}

	
	public List<NoticeVO> selectAll(int cpage){
		return dao.selectAll(cpage);
		
	}
	
	public NoticeVO selectOne(NoticeVO vo) {
		return dao.selectOne(vo);
	}
	
	public List<NoticeVO> searchList(String searchKey, String searchWord){
		return dao.searchList(searchKey, searchWord);
	}

	public int noticeRowCount() {
		return dao.noticeRowCount();
	}

	
}