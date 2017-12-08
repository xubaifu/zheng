package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.UpmsOrganizationHisMapper;
import com.zheng.upms.dao.model.UpmsOrganizationHis;
import com.zheng.upms.dao.model.UpmsOrganizationHisExample;
import com.zheng.upms.rpc.api.UpmsOrganizationHisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* UpmsOrganizationHisService实现
* Created by shuzheng on 2017/12/8.
*/
@Service
@Transactional
@BaseService
public class UpmsOrganizationHisServiceImpl extends BaseServiceImpl<UpmsOrganizationHisMapper, UpmsOrganizationHis, UpmsOrganizationHisExample> implements UpmsOrganizationHisService {

    private static Logger _log = LoggerFactory.getLogger(UpmsOrganizationHisServiceImpl.class);

    @Autowired
    UpmsOrganizationHisMapper upmsOrganizationHisMapper;

}