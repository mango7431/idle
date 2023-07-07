package test.com.idle.vo;

import java.sql.Timestamp;

import lombok.Data;
import lombok.ToString;

@Data
public class QnaVO {
	private int qna_num;
	private String qna_title;
	private String qna_content;
	private String writer;
	private Timestamp qna_date;
	private int qna_status;
	private int qna_category;
	private QnaReplyVO qnareplyVO;
}
