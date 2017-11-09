package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.SysTableinfoMapper;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTableinfoExample;
import com.zheng.upms.rpc.api.SysTableinfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* SysTableinfoService实现
* Created by shuzheng on 2017/11/7.
*/
@Service
@Transactional
@BaseService
public class SysTableinfoServiceImpl extends BaseServiceImpl<SysTableinfoMapper, SysTableinfo, SysTableinfoExample> implements SysTableinfoService {

    private static Logger _log = LoggerFactory.getLogger(SysTableinfoServiceImpl.class);

    @Autowired
    SysTableinfoMapper sysTableinfoMapper;
    
		public String creatTable(String tableName) {
			String v = sysTableinfoMapper.createTable("T_FNFL9F2O2S3");
			return null;
		}
}