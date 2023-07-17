package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.BuyDAO;
import test.com.idle.vo.BoardVO;
import test.com.idle.vo.BuyVO;

@Slf4j
@Service
public class BuyService {
	
	@Autowired
	BuyDAO dao;

	public BuyService() {
		log.info("BuyService");
	}
	
	public List<BoardVO> buySelectAll(int cpage,String userId) {
		return dao.buySelectAll(cpage, userId);
	}
	
	public List<BoardVO> sellSelectAll(int cpage,String userId) {
		return dao.sellSelectAll(cpage, userId);
	}
	
	public List<BuyVO> selectAll(int cpage) {
		return dao.selectAll(cpage);
	}

	public int delete(BuyVO vo) {
		return dao.delete(vo);
	}

	public int buyRowCount(String userId) {
		return dao.buyRowCount(userId);
	}
	
	public int sellRowCount(String userId) {
		return dao.sellRowCount(userId);
	}

}
