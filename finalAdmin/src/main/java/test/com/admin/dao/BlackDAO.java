package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.BlackVO;

public interface BlackDAO {

	public List<BlackVO> jsonBlackSelectAll();

	public void boardreportUp(BlackVO vo);

	public void memberreportUp(BlackVO vo);

	public void removeBoard(int board_num);

	public void removeMember(String targetid);

}
