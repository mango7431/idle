package test.com.admin.vo;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class NoticeVO {
	
	private int notice_num;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_date;

}
