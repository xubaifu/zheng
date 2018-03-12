package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.UpmsDictDataMapper;
import com.zheng.upms.dao.model.UpmsDictData;
import com.zheng.upms.dao.model.UpmsDictDataExample;
import com.zheng.upms.rpc.api.UpmsDictDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* UpmsDictDataService实现
* Created by shuzheng on 2018/3/11.
*/
@Service
@Transactional
@BaseService
public class UpmsDictDataServiceImpl extends BaseServiceImpl<UpmsDictDataMapper, UpmsDictData, UpmsDictDataExample> implements UpmsDictDataService {

    private static Logger _log = LoggerFactory.getLogger(UpmsDictDataServiceImpl.class);

    @Autowired
    UpmsDictDataMapper upmsDictDataMapper;

}