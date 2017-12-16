package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.UpmsPositionHisMapper;
import com.zheng.upms.dao.model.UpmsPositionHis;
import com.zheng.upms.dao.model.UpmsPositionHisExample;
import com.zheng.upms.rpc.api.UpmsPositionHisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* UpmsPositionHisService实现
* Created by shuzheng on 2017/12/12.
*/
@Service
@Transactional
@BaseService
public class UpmsPositionHisServiceImpl extends BaseServiceImpl<UpmsPositionHisMapper, UpmsPositionHis, UpmsPositionHisExample> implements UpmsPositionHisService {

    private static Logger _log = LoggerFactory.getLogger(UpmsPositionHisServiceImpl.class);

    @Autowired
    UpmsPositionHisMapper upmsPositionHisMapper;

}