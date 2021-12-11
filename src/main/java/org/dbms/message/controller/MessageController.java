package org.dbms.message.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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

}
