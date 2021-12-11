package org.dbms.message.domain.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.dbms.message.domain.dao.entity.MessageEntity;
import org.dbms.util.IToEntity;
import org.dbms.util.ReflectiveUtil;

import java.sql.Timestamp;

@Data
//@Builder
@TableName(value = "message", autoResultMap = true)
public class AddMessageDto extends MessageEntity implements IToEntity {

    private Long groupId;

    private String senderId;

    private String message;

    private Timestamp createTime;

    @Override
    public Object toEntity() {
        return ReflectiveUtil.copyToClass(this, MessageEntity.class);
    }
}
