package org.dbms.relationship.domain.dto;

import lombok.Data;
import org.dbms.relationship.domain.dao.entity.GroupEntity;
import org.dbms.relationship.util.ReflectiveUtil;

@Data
public class AddRelationshipDto extends GroupEntity implements IToEntity {
    private Long selfId;
    private Long otherId;

    @Override
    public Object toEntity() {
        return ReflectiveUtil.copyToClass(this, GroupEntity.class);
    }
}
