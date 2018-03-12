package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.UpmsDictTypeMapper;
import com.zheng.upms.dao.model.UpmsDictType;
import com.zheng.upms.dao.model.UpmsDictTypeExample;
import com.zheng.upms.rpc.api.UpmsDictTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* UpmsDictTypeService实现
* Created by shuzheng on 2018/3/11.
*/
@Service
@Transactional
@BaseService
public class UpmsDictTypeServiceImpl extends BaseServiceImpl<UpmsDictTypeMapper, UpmsDictType, UpmsDictTypeExample> implements UpmsDictTypeService {

    private static Logger _log = LoggerFactory.getLogger(UpmsDictTypeServiceImpl.class);

    @Autowired
    UpmsDictTypeMapper upmsDictTypeMapper;

}