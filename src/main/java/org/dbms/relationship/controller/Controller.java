package org.dbms.relationship.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.dbms.relationship.constant.Constant;
import org.dbms.relationship.domain.dao.entity.GroupEntity;
import org.dbms.relationship.domain.dao.entity.RelationshipEntity;
import org.dbms.relationship.domain.dao.service.IGroupService;
import org.dbms.relationship.domain.dao.service.IRelationshipService;
import org.dbms.relationship.domain.dto.AddRelationshipDto;
import org.dbms.relationship.domain.dto.ListRelationshipDto;
import org.dbms.util.JSONUtil;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.*;

@RestController
@RequestMapping("/dbms")
public class Controller {
    @Resource
    IGroupService groupService;

    @Resource
    IRelationshipService relationshipService;

    @PostMapping("/relationship/add")
    @ResponseBody
    public JSONObject addRelationship(@RequestBody AddRelationshipDto addRelationshipDto) {
        if (Objects.isNull(addRelationshipDto.getGroup_attribute())) {
            addRelationshipDto.setGroup_attribute(Constant.group_attribute_multiple);
        }
        addRelationshipDto.setLast_update(new Date(System.currentTimeMillis()));
        GroupEntity groupEntity = (GroupEntity) addRelationshipDto.toEntity();
        groupService.save(groupEntity);
        for (String userId : addRelationshipDto.getUserList()) {
            relationshipService.save(RelationshipEntity.builder().group_id(groupEntity.getId()).user_id(userId).build());
        }
        return JSONUtil.success(new JSONObject());
    }

    @PostMapping("/relationship/join")
    @ResponseBody
    public JSONObject joinGroup(@RequestBody RelationshipEntity relationshipEntity) {
        relationshipService.save(relationshipEntity);
        return JSONUtil.success(new JSONObject());
    }

    @PostMapping("/relationship/remove")
    @ResponseBody
    public JSONObject removeRelationship(@RequestBody RelationshipEntity relationshipEntity) {
        relationshipService.removeById(relationshipEntity.getId());
        return JSONUtil.success(new JSONObject());
    }

    @PostMapping("/relationship/list")
    @ResponseBody
    public JSONObject listRelationship(@RequestBody ListRelationshipDto listRelationshipDto) {
        RelationshipEntity relationshipEntity = (RelationshipEntity) listRelationshipDto.toEntity();
        List<RelationshipEntity> relationshipEntities = relationshipService.listByMap(new HashMap(){{put("user_id", relationshipEntity.getUser_id());}});
        List<GroupEntity> res = new LinkedList<>();
        for (RelationshipEntity entity : relationshipEntities) {
            GroupEntity groupEntity = groupService.getById(entity.getGroup_id());
            if (groupEntity.getGroup_attribute().equals(Constant.group_attribute_single)) {
                String name1 = groupEntity.getMember1_name();
                String name2 = groupEntity.getMember2_name();
                groupEntity.setGroup_name(name1.equals(listRelationshipDto.getUserName())?name2:name1);
            }
            res.add(groupEntity);
        }
        res.sort((o1, o2) -> o1.getLast_update().before(o2.getLast_update())?-1:1);
        JSONObject result = new JSONObject();
        JSONArray datas = new JSONArray();
        for (GroupEntity groupEntity : res) {
            datas.add(groupEntity.toJSON());
        }
        result.put("datas", datas);
        return JSONUtil.success(result);
    }

}
