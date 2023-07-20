package test.com.idle.dao;

import java.util.List;

import test.com.idle.vo.NoticeVO;

public interface NoticeDAO {
	
	public List<NoticeVO> selectAll(int cpage);
	
	public NoticeVO selectOne(NoticeVO vo);

	public List<NoticeVO> searchList(String searchKey, String searchWord);

	public int noticeRowCount();
	
	List<NoticeVO> selectAllMain();

}
