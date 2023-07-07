package test.com.idle.vo;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {
	
	private int board_num;
	private String board_title;
	private String board_content;
	private String writer;
	private int board_report;
	private Timestamp board_date;
	private int view_count;
	private String category;
	private String deal_region;
	private int price;
	private String board_savename1;
	private String board_savename2;
	private String board_savename3;
	private int board_status; //1판매중, 2판매완료, 3숨기기
	private int board_type; //1팔아요, 2구해요
	private int likecount;
	private int chatcount;
	private String id;
	private String name;
	private String address;
	private String member_savename;
	private List<MultipartFile> multipartFiles;

}
