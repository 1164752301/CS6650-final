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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/dbms/message")
public class MessageController {
    @Resource
    IMessageService messageService;

    @PostMapping("/add")
    @ResponseBody
    public JSONObject addMessage(@RequestBody AddMessageDto addmessageDto) throws IOException {
        System.out.println("received add message: " + addmessageDto.toString());
        MessageEntity messageEntity = (MessageEntity) addmessageDto.toEntity();
        messageEntity.setCreateTime(new Timestamp(System.currentTimeMillis()));

        messageService.save(MessageEntity.builder()
                        .groupId(addmessageDto.getGroupId())
                        .senderId(addmessageDto.getSenderId())
                        .message(addmessageDto.getMessage())
                        .createTime(messageEntity.getCreateTime())
                .build());

        // convert entity to json string
        String jsonStr = messageEntity.toJSON().toJSONString() + "\n";

        BIOClient bioClient = new BIOClient();
        bioClient.send(jsonStr);

        return JSONUtil.success(new JSONObject());
    }


    @PostMapping("/list")
    @ResponseBody
    public JSONObject listMessage(@RequestBody JSONObject chatRoomId) {
        Long id = Long.parseLong(chatRoomId.getString("chatRoomId"));
        System.out.println("Received list message request with groupId: " + chatRoomId);
        List<MessageEntity> messageEntityList = messageService.list();

        List<MessageEntity> res = new ArrayList<>();

        for (MessageEntity messageEntity : messageEntityList) {
            Long currGroupId = messageEntity.getGroupId();
            if (currGroupId == id) {
                res.add(messageEntity);
            }
        }

        System.out.println("list mesaage size" + res.size());

        res.sort((o1, o2) ->
                o1.getCreateTime().before(o2.getCreateTime())?1:
                o1.getCreateTime().equals(o2.getCreateTime())? 0:-1);

        JSONObject result = new JSONObject();
        JSONArray data = new JSONArray();
        for (MessageEntity messageEntity : res) {
            data.add(messageEntity.toJSON());
        }
        result.put("datas", data);
        System.out.println("list message / send to front end: " + result);
        return JSONUtil.success(result);

    }
}
