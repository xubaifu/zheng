package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.UpmsDictMapper;
import com.zheng.upms.dao.model.UpmsDict;
import com.zheng.upms.dao.model.UpmsDictExample;
import com.zheng.upms.rpc.api.UpmsDictService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* UpmsDictService实现
* Created by shuzheng on 2018/1/25.
*/
@Service
@Transactional
@BaseService
public class UpmsDictServiceImpl extends BaseServiceImpl<UpmsDictMapper, UpmsDict, UpmsDictExample> implements UpmsDictService {

    private static Logger _log = LoggerFactory.getLogger(UpmsDictServiceImpl.class);

    @Autowired
    UpmsDictMapper upmsDictMapper;

}