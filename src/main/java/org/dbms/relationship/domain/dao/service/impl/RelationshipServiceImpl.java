package org.dbms.relationship.domain.dao.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.dbms.relationship.domain.dao.entity.RelationshipEntity;
import org.dbms.relationship.domain.dao.mapper.RelationshipMapper;
import org.dbms.relationship.domain.dao.service.IRelationshipService;
import org.springframework.stereotype.Service;

@Service
public class RelationshipServiceImpl extends ServiceImpl<RelationshipMapper, RelationshipEntity> implements IRelationshipService {
}
