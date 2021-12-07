package org.dbms.message.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.dbms.message.domain.dao.entity.MessageEntity;
import org.dbms.message.domain.dao.service.IMessageService;
import org.dbms.message.domain.dto.AddMessageDto;
import org.dbms.util.JSONUtil;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
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
    public JSONObject addMessage(@RequestBody AddMessageDto addmessageDto) {
        MessageEntity messageEntity = (MessageEntity) addmessageDto.toEntity();
        messageEntity.setCreate_time(new Date());

        messageService.save(MessageEntity.builder()
                        .group_id(addmessageDto.getGroup_id())
                        .sender_id(addmessageDto.getSender_id())
                        .message(addmessageDto.getMessage())
                        .create_time(addmessageDto.getCreate_time())
                .build());

        return JSONUtil.success(new JSONObject());
    }


    @PostMapping("/list")
    @ResponseBody
    public JSONObject listMessage(@RequestBody Long groupId) {
        List<MessageEntity> messageEntityList = messageService.list();

        List<MessageEntity> res = new ArrayList<>();

        for (MessageEntity messageEntity : messageEntityList) {
            if (messageEntity.getGroup_id().equals(groupId)) {
                res.add(messageEntity);
            }
        }

        res.sort((o1, o2) ->
                o1.getCreate_time().before(o2.getCreate_time())?1:
                o1.getCreate_time().equals(o2.getCreate_time())? 0:-1);

        JSONObject result = new JSONObject();
        JSONArray data = new JSONArray();
        for (MessageEntity messageEntity : res) {
            data.add(messageEntity.toJSON());
        }
        result.put("datas", data);
        return JSONUtil.success(result);

    }
}
