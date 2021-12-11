package org.dbms.relationship.domain.dao.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.dbms.message.domain.dao.entity.MessageEntity;
import org.dbms.message.domain.dao.service.IMessageService;
import org.dbms.relationship.constant.Constant;
import org.dbms.relationship.domain.dao.entity.GroupEntity;
import org.dbms.relationship.domain.dao.entity.RelationshipEntity;
import org.dbms.relationship.domain.dao.mapper.RelationshipMapper;
import org.dbms.relationship.domain.dao.service.IGroupService;
import org.dbms.relationship.domain.dao.service.IRelationshipService;
import org.dbms.relationship.domain.dto.AddRelationshipDto;
import org.dbms.relationship.domain.dto.ListRelationshipDto;
import org.dbms.tools.JmsProducer;
import org.dbms.util.JSONUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

@Service
public class RelationshipServiceImpl extends ServiceImpl<RelationshipMapper, RelationshipEntity> implements IRelationshipService {
    @Resource
    IGroupService groupService;

    @Resource
    IMessageService messageService;

    @Autowired
    JmsProducer jmsProducer;

    @Override
    public JSONObject listRelationship(@RequestBody ListRelationshipDto listRelationshipDto) {
        RelationshipEntity relationshipEntity = (RelationshipEntity) listRelationshipDto.toEntity();
        List<RelationshipEntity> relationshipEntities = this.list(new QueryWrapper<RelationshipEntity>().eq("user_id", relationshipEntity.getUserId()));
        System.out.println(relationshipEntities);
        List<GroupEntity> res = new LinkedList<>();
        for (RelationshipEntity entity : relationshipEntities) {
            GroupEntity groupEntity = groupService.getOne(new QueryWrapper<GroupEntity>().eq("id", entity.getGroupId()));
            res.add(groupEntity);
        }
        res.sort((o1, o2) -> o1.getLastUpdate().before(o2.getLastUpdate())?-1:1);
        JSONObject result = new JSONObject();
        JSONArray datas = new JSONArray();
        for (GroupEntity groupEntity : res) {
            datas.add(groupEntity.toJSON());
        }
        result.put("datas", datas);
        return JSONUtil.success(result);
    }

    @Override
    public JSONObject addRelationship(AddRelationshipDto addRelationshipDto) {
        if (Objects.isNull(addRelationshipDto.getGroupAttribute())) {
            addRelationshipDto.setGroupAttribute(Constant.group_attribute_multiple);
        }
        addRelationshipDto.setLastUpdate(Timestamp.valueOf(LocalDateTime.now()));
        GroupEntity groupEntity = (GroupEntity) addRelationshipDto.toEntity();
        groupService.save(groupEntity);
        for (String userId : addRelationshipDto.getUserList()) {
            this.save(RelationshipEntity.builder().groupId(groupEntity.getId()).userId(userId).build());
        }
        return JSONUtil.success(new JSONObject());
    }

    // 增 message
    @Override
    public boolean addMessage(MessageEntity messageEntity) throws IOException {
        System.out.println("adding message: " + messageEntity);
        boolean ret = messageService.save(messageEntity);

        // convert entity to json string
        String jsonStr = messageEntity.toJSON().toJSONString() + "\n";

        // send to active mq
        jmsProducer.sendMessage(messageEntity.getGroupId().toString(), jsonStr);



        return true;
    }
}
