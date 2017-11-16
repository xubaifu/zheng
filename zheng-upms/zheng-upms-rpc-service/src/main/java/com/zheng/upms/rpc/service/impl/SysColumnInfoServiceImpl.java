package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.SysColumnInfoMapper;
import com.zheng.upms.dao.model.SysColumnInfo;
import com.zheng.upms.dao.model.SysColumnInfoExample;
import com.zheng.upms.rpc.api.SysColumnInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* SysColumnInfoService实现
* Created by shuzheng on 2017/11/13.
*/
@Service
@Transactional
@BaseService
public class SysColumnInfoServiceImpl extends BaseServiceImpl<SysColumnInfoMapper, SysColumnInfo, SysColumnInfoExample> implements SysColumnInfoService {

    private static Logger _log = LoggerFactory.getLogger(SysColumnInfoServiceImpl.class);

    @Autowired
    SysColumnInfoMapper sysColumnInfoMapper;

}