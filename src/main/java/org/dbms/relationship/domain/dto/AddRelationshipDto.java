package org.dbms.relationship.domain.dto;

import lombok.Data;
import org.dbms.relationship.domain.dao.entity.GroupEntity;
import org.dbms.util.IToEntity;
import org.dbms.util.ReflectiveUtil;

import java.util.List;

@Data
public class AddRelationshipDto extends GroupEntity implements IToEntity {
    private List<String> userList;

    @Override
    public Object toEntity() {
        return ReflectiveUtil.copyToClass(this, GroupEntity.class);
    }
}
