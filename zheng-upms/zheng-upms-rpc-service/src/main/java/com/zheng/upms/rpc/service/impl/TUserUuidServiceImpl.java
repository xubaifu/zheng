package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.TUserUuidMapper;
import com.zheng.upms.dao.model.TUserUuid;
import com.zheng.upms.dao.model.TUserUuidExample;
import com.zheng.upms.rpc.api.TUserUuidService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* TUserUuidService实现
* Created by shuzheng on 2018/3/3.
*/
@Service
@Transactional
@BaseService
public class TUserUuidServiceImpl extends BaseServiceImpl<TUserUuidMapper, TUserUuid, TUserUuidExample> implements TUserUuidService {

    private static Logger _log = LoggerFactory.getLogger(TUserUuidServiceImpl.class);

    @Autowired
    TUserUuidMapper tUserUuidMapper;

}