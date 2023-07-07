package test.com.idle.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MessageVO {
	
	private int message_num;
	private int room_num;
	private String sender;
	private String message;
	private Timestamp message_date;
	private String sender_savename;
	private int readcounts;

}
