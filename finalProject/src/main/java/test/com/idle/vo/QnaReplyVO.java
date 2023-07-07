package test.com.idle.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaReplyVO {
	private int qnareply_num;
	private int qna_num;
	private String qnareply_title;
	private String qnareply_content;
	private Timestamp qnareply_date;
}
