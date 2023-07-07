package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.SellDAO;
import test.com.idle.vo.SellVO;

@Slf4j
@Service
public class SellService {
	
	@Autowired
	SellDAO dao;

	public SellService() {
		log.info("SellService");
	}
	
	public List<SellVO> selectAll(int cpage) {
		return dao.selectAll(cpage);
	}

	public int delete(SellVO vo) {
		return dao.delete(vo);
	}

	public int sellRowCount() {
		return dao.sellRowCount();
	}

	

}
