package test.com.admin.vo;

import lombok.Data;

@Data
public class QnaVO {
	public int qna_num;
	public String qna_title;
	public String qna_content;
	public String writer;
	public String qna_date;
	public int qna_status; 
	//1.미답변 2.답변완료
	public String qna_category; 
	//1. 계정문의 2. 채팅,알림문의 3. 거래문의 4. 광고문의 5. 기타문의
}
