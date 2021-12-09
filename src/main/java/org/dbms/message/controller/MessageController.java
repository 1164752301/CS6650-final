package org.dbms.message.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.dbms.BIOClient;
import org.dbms.message.domain.dao.entity.MessageEntity;
import org.dbms.message.domain.dao.service.IMessageService;
import org.dbms.message.domain.dto.AddMessageDto;
import org.dbms.util.JSONUtil;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/dbms/message")
public class MessageController {
    @Resource
    IMessageService messageService;

    @PostMapping("/add")
    @ResponseBody
    public JSONObject addMessage(@RequestBody AddMessageDto addmessageDto) throws IOException {
        MessageEntity messageEntity = (MessageEntity) addmessageDto.toEntity();
        messageEntity.setCreateTime(new Date());

        messageService.save(MessageEntity.builder()
                        .groupId(addmessageDto.getGroupId())
                        .senderId(addmessageDto.getSenderId())
                        .message(addmessageDto.getMessage())
                        .createTime(messageEntity.getCreateTime())
                .build());

        BIOClient bioClient = new BIOClient();
        bioClient.send();

        return JSONUtil.success(new JSONObject());
    }


    @PostMapping("/list")
    @ResponseBody
    public JSONObject listMessage(@RequestBody Long groupId) {
        System.out.println("Received list message request with groupId: " + groupId);
        List<MessageEntity> messageEntityList = messageService.list();

        List<MessageEntity> res = new ArrayList<>();

        for (MessageEntity messageEntity : messageEntityList) {
            Long currGroupId = messageEntity.getGroupId();
            if (currGroupId == groupId) {
                res.add(messageEntity);
            }
        }

        System.out.println(res.size());

        res.sort((o1, o2) ->
                o1.getCreateTime().before(o2.getCreateTime())?1:
                o1.getCreateTime().equals(o2.getCreateTime())? 0:-1);

        JSONObject result = new JSONObject();
        JSONArray data = new JSONArray();
        for (MessageEntity messageEntity : res) {
            data.add(messageEntity.toJSON());
        }
        result.put("datas", data);
        return JSONUtil.success(result);

    }
}
