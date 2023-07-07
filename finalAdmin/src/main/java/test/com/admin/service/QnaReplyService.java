package test.com.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.admin.dao.QnaReplyDAO;
import test.com.admin.vo.QnaReplyVO;

@Slf4j
@Service
public class QnaReplyService {

	@Autowired
	QnaReplyDAO dao;

	public QnaReplyService() {
		log.info("QnaReplyService()...");
	}

	public List<QnaReplyVO> selectAll(QnaReplyVO vo) {
		return dao.selectAll(vo);
	}

	public int insert(QnaReplyVO vo) {
		return dao.insert(vo);
	}

	public int delete(QnaReplyVO vo) {
		return dao.delete(vo);
	}

	public int update(QnaReplyVO vo) {
		return dao.update(vo);
	}
}
