package org.dbms.message.domain.dto;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Builder;
import lombok.Data;
import org.dbms.message.domain.dao.entity.MessageEntity;
import org.dbms.util.IToEntity;
import org.dbms.util.ReflectiveUtil;


@Data
//@Builder
@TableName(value = "message", autoResultMap = true)
public class ListMessageDto extends MessageEntity implements IToEntity {
    private Long group_id;

    @Override
    public Object toEntity() {
        return ReflectiveUtil.copyToClass(this, MessageEntity.class);
    }
}
