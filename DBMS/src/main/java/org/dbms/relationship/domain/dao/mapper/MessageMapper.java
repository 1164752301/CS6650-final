package org.dbms.relationship.domain.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.dbms.relationship.domain.dao.entity.MessageEntity;

@Mapper
public interface MessageMapper extends BaseMapper<MessageEntity> {
}
