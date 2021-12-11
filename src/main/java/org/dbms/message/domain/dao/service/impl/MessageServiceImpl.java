package org.dbms.message.domain.dao.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.dbms.message.domain.dao.entity.MessageEntity;
import org.dbms.message.domain.dao.mapper.MessageMapper;
import org.dbms.message.domain.dao.service.IMessageService;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, MessageEntity> implements IMessageService {

}
