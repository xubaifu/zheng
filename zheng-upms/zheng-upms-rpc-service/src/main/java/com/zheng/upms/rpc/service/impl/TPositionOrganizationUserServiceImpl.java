package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.TPositionOrganizationUserMapper;
import com.zheng.upms.dao.model.TPositionOrganizationUser;
import com.zheng.upms.dao.model.TPositionOrganizationUserExample;
import com.zheng.upms.rpc.api.TPositionOrganizationUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* TPositionOrganizationUserService实现
* Created by shuzheng on 2017/12/29.
*/
@Service
@Transactional
@BaseService
public class TPositionOrganizationUserServiceImpl extends BaseServiceImpl<TPositionOrganizationUserMapper, TPositionOrganizationUser, TPositionOrganizationUserExample> implements TPositionOrganizationUserService {

    private static Logger _log = LoggerFactory.getLogger(TPositionOrganizationUserServiceImpl.class);

    @Autowired
    TPositionOrganizationUserMapper tPositionOrganizationUserMapper;

}