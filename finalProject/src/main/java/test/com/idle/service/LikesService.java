package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.LikesDAO;
import test.com.idle.vo.LikesVO;

@Service
@Slf4j
public class LikesService {

	@Autowired
	LikesDAO dao;
	
	public LikesService() {
		log.info("LikesService()...");
	}

	public int insert(LikesVO vo) {
		return dao.insert(vo);
	}

	public LikesVO selectOne(LikesVO vo) {
		return dao.selectOne(vo);
	}

	public int delete(LikesVO vo) {
		return dao.delete(vo);
	}

	public List<LikesVO> selectAll(String user_id) {
		return dao.selectAll(user_id);
	}
}
