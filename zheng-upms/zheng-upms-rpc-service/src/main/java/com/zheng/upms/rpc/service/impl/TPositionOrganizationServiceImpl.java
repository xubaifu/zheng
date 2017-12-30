package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.TPositionOrganizationMapper;
import com.zheng.upms.dao.model.TPositionOrganization;
import com.zheng.upms.dao.model.TPositionOrganizationExample;
import com.zheng.upms.rpc.api.TPositionOrganizationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* TPositionOrganizationService实现
* Created by shuzheng on 2017/12/29.
*/
@Service
@Transactional
@BaseService
public class TPositionOrganizationServiceImpl extends BaseServiceImpl<TPositionOrganizationMapper, TPositionOrganization, TPositionOrganizationExample> implements TPositionOrganizationService {

    private static Logger _log = LoggerFactory.getLogger(TPositionOrganizationServiceImpl.class);

    @Autowired
    TPositionOrganizationMapper tPositionOrganizationMapper;

}