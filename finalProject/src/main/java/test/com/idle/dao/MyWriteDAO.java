package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.BoardVO;

public interface MyWriteDAO {

	List<BoardVO> myWriteBuySelectAll(String userId);

	List<BoardVO> myWriteSellSelectAll(String userId);

}
