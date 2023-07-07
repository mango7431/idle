package test.com.idle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.com.idle.dao.BlackDAO;
import test.com.idle.vo.BlackVO;

@Service
public class BlackService {

	@Autowired
	BlackDAO dao;
	
	public int blackInsert(BlackVO vo) {
		return dao.blackInsert(vo);
	}

}
