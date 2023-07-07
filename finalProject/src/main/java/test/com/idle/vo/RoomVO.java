package test.com.idle.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RoomVO {
	
	private int room_num;
	private int board_num;
	private String buyer;
	private String seller;
	private Timestamp room_date;
	private String member_savename;
	private String board_title;
	private int price;
	private int readcount;

}
