package org.dbms.relationship.domain.dto;

import lombok.Data;
import org.dbms.relationship.domain.dao.entity.RelationshipEntity;
import org.dbms.util.IToEntity;
import org.dbms.util.ReflectiveUtil;

@Data
public class ListRelationshipDto extends RelationshipEntity implements IToEntity {
    private String userName;

    @Override
    public Object toEntity() {
        return ReflectiveUtil.copyToClass(this, RelationshipEntity.class);
    }
}
