package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.TDeptUuidMapper;
import com.zheng.upms.dao.model.TDeptUuid;
import com.zheng.upms.dao.model.TDeptUuidExample;
import com.zheng.upms.rpc.api.TDeptUuidService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* TDeptUuidService实现
* Created by shuzheng on 2017/11/13.
*/
@Service
@Transactional
@BaseService
public class TDeptUuidServiceImpl extends BaseServiceImpl<TDeptUuidMapper, TDeptUuid, TDeptUuidExample> implements TDeptUuidService {

    private static Logger _log = LoggerFactory.getLogger(TDeptUuidServiceImpl.class);

    @Autowired
    TDeptUuidMapper tDeptUuidMapper;

}