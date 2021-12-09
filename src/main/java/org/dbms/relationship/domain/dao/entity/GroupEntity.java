package org.dbms.relationship.domain.dao.entity;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.dbms.util.IToJSON;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("group_info")
public class GroupEntity implements IToJSON {
    @TableId
    private Long id;
    private String groupName;
    private Integer groupAttribute;
    private String aName;
    private String bName;
    private Timestamp lastUpdate;


    @Override
    public JSONObject toJSON() {
        JSONObject res = new JSONObject();
        res.put("Id", id.toString());
        res.put("name", groupName);
        res.put("groupAttribute", groupAttribute);
        res.put("aName", aName);
        res.put("bName", bName);
        res.put("lastUpdate", lastUpdate);
        return res;
    }
}
