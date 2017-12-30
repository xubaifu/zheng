package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.TPositionOrganizationHisMapper;
import com.zheng.upms.dao.model.TPositionOrganizationHis;
import com.zheng.upms.dao.model.TPositionOrganizationHisExample;
import com.zheng.upms.rpc.api.TPositionOrganizationHisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* TPositionOrganizationHisService实现
* Created by shuzheng on 2017/12/29.
*/
@Service
@Transactional
@BaseService
public class TPositionOrganizationHisServiceImpl extends BaseServiceImpl<TPositionOrganizationHisMapper, TPositionOrganizationHis, TPositionOrganizationHisExample> implements TPositionOrganizationHisService {

    private static Logger _log = LoggerFactory.getLogger(TPositionOrganizationHisServiceImpl.class);

    @Autowired
    TPositionOrganizationHisMapper tPositionOrganizationHisMapper;

}