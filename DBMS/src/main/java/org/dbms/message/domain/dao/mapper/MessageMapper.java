package org.dbms.message.domain.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.dbms.message.domain.dao.entity.MessageEntity;

@Mapper
public interface MessageMapper extends BaseMapper<MessageEntity> {
}
