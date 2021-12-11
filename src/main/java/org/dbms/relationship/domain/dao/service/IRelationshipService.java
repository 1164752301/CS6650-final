package org.dbms.relationship.domain.dao.service;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.IService;
import org.dbms.message.domain.dao.entity.MessageEntity;
import org.dbms.relationship.domain.dao.entity.RelationshipEntity;
import org.dbms.relationship.domain.dto.AddRelationshipDto;
import org.dbms.relationship.domain.dto.ListRelationshipDto;

import java.io.IOException;

public interface IRelationshipService extends IService<RelationshipEntity> {
    JSONObject listRelationship(ListRelationshipDto listRelationshipDto);

    JSONObject addRelationship(AddRelationshipDto addRelationshipDto);

    // 增 message
    public boolean addMessage(MessageEntity messageEntity) throws IOException;

}
