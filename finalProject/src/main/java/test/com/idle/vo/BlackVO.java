package test.com.idle.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BlackVO {
	private int black_num;
	private int black_type;
	private String reporterid;
	private String targetid;
	private int board_num;
	private Timestamp black_date;
	private String comments;
	private int black_category;
}
