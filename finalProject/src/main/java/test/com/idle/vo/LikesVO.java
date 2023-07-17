package test.com.idle.vo;

import lombok.Data;

@Data
public class LikesVO {
	private int likes_num;
	private int board_num;
	private String id;
	
	//조인으로 추가
	private int board_status; //1판매중, 2판매완료, 3숨기기
	private int board_type;  //1팔아요, 2구해요
	private String board_title;
	private int price;
	private String deal_region;
	private int likecount;
	private int chatcount;
	private int view_count;
	private String board_savename1;
}
