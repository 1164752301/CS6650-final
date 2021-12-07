package org.dbms.relationship.domain.dao.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.dbms.relationship.domain.dao.entity.GroupEntity;
import org.dbms.relationship.domain.dao.mapper.GroupMapper;
import org.dbms.relationship.domain.dao.service.IGroupService;
import org.springframework.stereotype.Service;

@Service
public class GroupServiceImpl extends ServiceImpl<GroupMapper, GroupEntity> implements IGroupService {

}
