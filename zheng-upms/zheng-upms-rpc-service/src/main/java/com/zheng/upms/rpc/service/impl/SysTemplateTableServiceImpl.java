package com.zheng.upms.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.SysTemplateTableMapper;
import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.SysTemplateTableExample;
import com.zheng.upms.rpc.api.SysTemplateTableService;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* SysTemplateTableService实现
* Created by shuzheng on 2017/11/14.
*/
@Service
@Transactional
@BaseService
public class SysTemplateTableServiceImpl extends BaseServiceImpl<SysTemplateTableMapper, SysTemplateTable, SysTemplateTableExample> implements SysTemplateTableService {

    private static Logger _log = LoggerFactory.getLogger(SysTemplateTableServiceImpl.class);

    @Autowired
    SysTemplateTableMapper sysTemplateTableMapper;

	@Override
	public List<SysTemplateTable> getDataInfo(String tableName, List<String> list) {
		return sysTemplateTableMapper.getDataInfo(tableName, list);
	}

}