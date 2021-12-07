package org.dbms.message.domain.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.Builder;
import org.dbms.message.domain.dao.entity.MessageEntity;
import org.dbms.util.IToEntity;
import org.dbms.util.ReflectiveUtil;

import java.util.Date;

@Data
//@Builder
@TableName(value = "message", autoResultMap = true)
public class AddMessageDto extends MessageEntity implements IToEntity {

    private Long group_id;

    private Long sender_id;

    private String message;

    private Date create_time;

    @Override
    public Object toEntity() {
        return ReflectiveUtil.copyToClass(this, MessageEntity.class);
    }
}
