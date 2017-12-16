package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.TPositionUuidMapper;
import com.zheng.upms.dao.model.TPositionUuid;
import com.zheng.upms.dao.model.TPositionUuidExample;
import com.zheng.upms.rpc.api.TPositionUuidService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* TPositionUuidService实现
* Created by shuzheng on 2017/12/12.
*/
@Service
@Transactional
@BaseService
public class TPositionUuidServiceImpl extends BaseServiceImpl<TPositionUuidMapper, TPositionUuid, TPositionUuidExample> implements TPositionUuidService {

    private static Logger _log = LoggerFactory.getLogger(TPositionUuidServiceImpl.class);

    @Autowired
    TPositionUuidMapper tPositionUuidMapper;

}