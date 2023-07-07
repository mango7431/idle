package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.idle.dao.MyWriteDAO;
import test.com.idle.vo.BoardVO;

@Service
public class MyWriteService {
	
	@Autowired
	MyWriteDAO dao;

	public List<BoardVO> myWriteBuySelectAll(String userId) {
		return dao.myWriteBuySelectAll(userId);
	}
	
	public List<BoardVO> myWriteSellSelectAll(String userId) {
		return dao.myWriteSellSelectAll(userId);
	}

}
