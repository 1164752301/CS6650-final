package org.dbms.message.domain.dao.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("message")
public class MessageEntity {
    private Long id;
    private Long group_id;
    private Long sender_id;
    private String message;
    private Date create_time;
}
