package test.com.idle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.idle.dao.QnaDAO;
import test.com.idle.vo.Criteria;
import test.com.idle.vo.QnaVO;

@Slf4j
@Service
public class QnaService {
	
	@Autowired
	QnaDAO dao;
	
	public QnaService() {
		log.info("QnaService...");
	}
	
	public int qnaInsert(QnaVO vo) {
		return dao.qnaInsert(vo);
	}
	
	public int qnaUpdate(QnaVO vo) {
		return dao.qnaUpdate(vo);
	}
	
	public int qnaDelete(QnaVO vo) {
		return dao.qnaDelete(vo);
	}
	
	public QnaVO qnaSelectOne(QnaVO vo) {
		return dao.qnaSelectOne(vo);
	}
	
	public List<QnaVO> qnaSelectAll(QnaVO vo) {
		return dao.qnaSelectAll(vo);
	}
	
	public List<QnaVO> paging(Criteria cri, QnaVO vo){
		return dao.paging(cri, vo);
	}
	
	public int getTotalCount(Criteria cri, QnaVO vo){
		return dao.getTotalCount(cri, vo);
	}
}
