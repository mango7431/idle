package test.com.idle.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import test.com.idle.vo.NotificationVO;

public class NotificationDTO {
    @AllArgsConstructor
    @Builder
    @NoArgsConstructor
    @Getter
    @Setter
    public static class Response {
        String id;
        String name;
        String title;
        Timestamp date;
        String content;
        String createdAt;
        String url;
        public static Response createResponse(NotificationVO notificationVO) {
            return Response.builder()
            		.id(notificationVO.getId().toString())
            		.title(notificationVO.getNotification_title())
                    .content(notificationVO.getNotification_content())
                    .date(notificationVO.getNotification_date())
                    .url(notificationVO.getNotification_link())
                    .build();

        }
    }
}