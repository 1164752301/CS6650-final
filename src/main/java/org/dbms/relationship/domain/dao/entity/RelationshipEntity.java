package org.dbms.relationship.domain.dao.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("relation")
public class RelationshipEntity {
    private Long id;
    private Long user_id;
    private Long group_id;
}
