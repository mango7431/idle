package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.RoomVO;

public interface RoomDAO {

	List<RoomVO> selectAll(RoomVO vo);

	int insert(RoomVO vo);

	RoomVO roomCheck(RoomVO vo);

	int delete(RoomVO vo);

}
