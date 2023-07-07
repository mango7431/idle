package test.com.admin.dao;

import java.util.List;

import test.com.admin.vo.NoticeVO;

public interface NoticeDAO {
	
	public int insert(NoticeVO vo);
	
	public int update(NoticeVO vo);
	
	public int delete(NoticeVO vo);
	
	public List<NoticeVO> selectAll(int cpage);
	
	public NoticeVO selectOne(NoticeVO vo);

	public List<NoticeVO> searchList(String searchKey, String searchWord);

	public int noticeRowCount();
	

}
