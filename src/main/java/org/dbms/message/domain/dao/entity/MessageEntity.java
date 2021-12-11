package org.dbms.message.domain.dao.entity;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.dbms.util.IToJSON;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("message")
public class MessageEntity implements IToJSON {
    private Long id;
    private Long groupId;
    private String senderId;
    private String message;
    private Timestamp createTime;


    @Override
    public JSONObject toJSON() {
        JSONObject res = new JSONObject();
        res.put("id", id);
        res.put("groupId", groupId);
        res.put("UserID", senderId);
        res.put("message", message);
        res.put("timestamp", createTime);
        return res;
    }
}
