package org.dbms.message.domain.dao.entity;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.dbms.util.IToJSON;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("message")
public class MessageEntity implements IToJSON {
    private Long id;
    private Long group_id;
    private String sender_id;
    private String message;
    private Date create_time;


    @Override
    public JSONObject toJSON() {
        JSONObject res = new JSONObject();
        res.put("id", id);
        res.put("group_id", group_id);
        res.put("sender_id", sender_id);
        res.put("message", message);
        res.put("create_time", create_time);
        return res;
    }
}
