package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.TPositionOrganizationUserHisMapper;
import com.zheng.upms.dao.model.TPositionOrganizationUserHis;
import com.zheng.upms.dao.model.TPositionOrganizationUserHisExample;
import com.zheng.upms.rpc.api.TPositionOrganizationUserHisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* TPositionOrganizationUserHisService实现
* Created by shuzheng on 2017/12/29.
*/
@Service
@Transactional
@BaseService
public class TPositionOrganizationUserHisServiceImpl extends BaseServiceImpl<TPositionOrganizationUserHisMapper, TPositionOrganizationUserHis, TPositionOrganizationUserHisExample> implements TPositionOrganizationUserHisService {

    private static Logger _log = LoggerFactory.getLogger(TPositionOrganizationUserHisServiceImpl.class);

    @Autowired
    TPositionOrganizationUserHisMapper tPositionOrganizationUserHisMapper;

}