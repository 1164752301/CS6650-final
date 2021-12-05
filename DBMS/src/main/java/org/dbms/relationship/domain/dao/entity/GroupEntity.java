package org.dbms.relationship.domain.dao.entity;

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
@TableName("group")
public class GroupEntity implements IToJSON {
    private Long id;
    private String group_name;
    private Integer group_attribute;
    private String member1_name;
    private String member2_name;
    private Date last_update;


    @Override
    public JSONObject toJSON() {
        JSONObject res = new JSONObject();
        res.put("id", id);
        res.put("group_name", group_name);
        res.put("group_attribute", group_attribute);
        res.put("member1_name", member1_name);
        res.put("member2_name", member2_name);
        res.put("last_update", last_update);
        return res;
    }
}
