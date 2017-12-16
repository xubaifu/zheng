package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.UpmsPositionMapper;
import com.zheng.upms.dao.model.UpmsPosition;
import com.zheng.upms.dao.model.UpmsPositionExample;
import com.zheng.upms.rpc.api.UpmsPositionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* UpmsPositionService实现
* Created by shuzheng on 2017/12/12.
*/
@Service
@Transactional
@BaseService
public class UpmsPositionServiceImpl extends BaseServiceImpl<UpmsPositionMapper, UpmsPosition, UpmsPositionExample> implements UpmsPositionService {

    private static Logger _log = LoggerFactory.getLogger(UpmsPositionServiceImpl.class);

    @Autowired
    UpmsPositionMapper upmsPositionMapper;

}