package test.com.admin.vo;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
@NoArgsConstructor
public class NotificationVO {
	private int notification_num;
	private String id;
	private String notification_title;
	private String notification_content;
	private Timestamp notification_date;
	private int notification_status;
	private int notification_type;
	private String notification_link;
	
	public NotificationVO(int notification_num, String id, String notification_title, String notification_content, Timestamp notification_date,
	        int notification_status, int notification_type, String notification_link) {
	    this.notification_num = notification_num;
	    this.id = id;
	    this.notification_title = notification_title;
	    this.notification_content = notification_content;
	    this.notification_date = notification_date;
	    this.notification_status = notification_status;
	    this.notification_type = notification_type;
	    this.notification_link = notification_link;
	}

}
