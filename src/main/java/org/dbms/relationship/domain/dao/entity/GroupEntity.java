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
        res.put("id", id);
        res.put("group_name", groupName);
        res.put("group_attribute", groupAttribute);
        res.put("member1_name", aName);
        res.put("member2_name", bName);
        res.put("last_update", lastUpdate);
        return res;
    }
}
