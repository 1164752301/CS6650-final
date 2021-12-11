package org.dbms.relationship.domain.dao.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.dbms.relationship.domain.dao.entity.AddressEntity;
import org.dbms.relationship.domain.dao.mapper.AddressMapper;
import org.dbms.relationship.domain.dao.service.IAddressService;
import org.springframework.stereotype.Service;

@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, AddressEntity> implements IAddressService  {
}
