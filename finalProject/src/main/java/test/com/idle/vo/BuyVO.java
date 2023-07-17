package test.com.idle.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BuyVO {

	private int buy_num;

	private int board_num;

	private String id;

	private String board_savename1;

	private List<MultipartFile> multipartFiles;

	private String board_title;

	private int view_count;

	private String deal_region;

	private int price;

}
