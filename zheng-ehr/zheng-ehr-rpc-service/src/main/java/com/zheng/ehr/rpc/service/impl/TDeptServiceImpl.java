package com.zheng.ehr.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.ehr.dao.mapper.TDeptMapper;
import com.zheng.ehr.dao.model.TDept;
import com.zheng.ehr.dao.model.TDeptExample;
import com.zheng.ehr.rpc.api.TDeptService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* TDeptService实现
* Created by shuzheng on 2017/12/27.
*/
@Service
@Transactional
@BaseService
public class TDeptServiceImpl extends BaseServiceImpl<TDeptMapper, TDept, TDeptExample> implements TDeptService {

    private static Logger _log = LoggerFactory.getLogger(TDeptServiceImpl.class);

    @Autowired
    TDeptMapper tDeptMapper;

}