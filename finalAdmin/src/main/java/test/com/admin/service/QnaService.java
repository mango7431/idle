package test.com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.QnaDAO;
import test.com.admin.vo.Criteria;
import test.com.admin.vo.QnaVO;

@Service
@Slf4j
public class QnaService {
	
	@Autowired
	QnaDAO dao;

	public QnaService() {
		log.info("QnaService()...");
	}

	public List<QnaVO> selectAll() {
		return dao.selectAll();
	}

	public List<QnaVO> qnaPaging(Criteria cri) {
		return dao.qnaPaging(cri);
	}

	public int getTotalCount(Criteria cri) {
		return dao.getTotalCount(cri);
	}

	public QnaVO selectOne(QnaVO vo) {
		return dao.selectOne(vo);
	}

	
}
