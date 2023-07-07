package test.com.idle.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String address;
	private int member_report;
	private String member_savename;
	private MultipartFile multipartFile;
	
}


