package com.zheng.upms.rpc.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.common.constant.ToolUtil;
import com.zheng.upms.dao.mapper.SysTableinfoMapper;
import com.zheng.upms.dao.mapper.SysTemplateTableMapper;
import com.zheng.upms.dao.model.SysColumnInfo;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.SysTemplateTableExample;
import com.zheng.upms.dao.model.TDeptUuid;
import com.zheng.upms.rpc.api.SysTemplateTableService;
import com.zheng.upms.rpc.mapper.TableInfoAPIMapper;

import net.sf.json.JSONObject;

/**
* SysTemplateTableService实现
* Created by shuzheng on 2017/11/14.
*/
@Service
@Transactional
@BaseService
public class SysTemplateTableServiceImpl extends BaseServiceImpl<SysTemplateTableMapper, SysTemplateTable, SysTemplateTableExample> implements SysTemplateTableService {

    private static Logger _log = LoggerFactory.getLogger(SysTemplateTableServiceImpl.class);

   /* @Autowired
    SysTemplateTableMapper sysTemplateTableMapper;*/
    @Autowired
    private TableInfoAPIMapper tableInfoAPIMapper;
    @Autowired
    private SysTableinfoMapper tDeptUuidMapper;

	@Override
	public List<SysTemplateTable> getDataInfo(String tableName, List<String> list) {
		return tableInfoAPIMapper.getDataInfo(tableName, list);
	}

	@Override
	public int insertSubsetData(String tableName, String organizationId, String data) {
    	
    	String subId = UUID.randomUUID().toString();
    	TDeptUuid tDeptUuid = new TDeptUuid();
    	tDeptUuid.setDeptId(organizationId);
    	tDeptUuid.setSubId(subId);
    	int count = tableInfoAPIMapper.insertTDeptUuid(tDeptUuid);
    	SysTemplateTable sysTemplateTable = new SysTemplateTable();
    	
    	
    	JSONObject jsonObject=JSONObject.fromObject(data);
    	@SuppressWarnings("unchecked")
		Iterator<Object> iterator = jsonObject.keys();
    	while(iterator.hasNext()){
    		String key = (String) iterator.next();
    		String value = jsonObject.getString(key);
    		sysTemplateTable.setId(UUID.randomUUID().toString());
    		sysTemplateTable.setSubId(subId);
    		sysTemplateTable.setProperty(key);
    		sysTemplateTable.setValue(value);
    		sysTemplateTable.setTablename(tableName);
    		tableInfoAPIMapper.insertSysTemplateTable(sysTemplateTable);
    	}
		return count;
	}

	@Override
	public int createSubsetTable(SysTableinfo sysTableinfo) {
		//sys_tableinfo中添加表信息
		sysTableinfo.setId(UUID.randomUUID().toString());
    	sysTableinfo.setType(ToolUtil.ORGANIZATION_SUBSET_TYPE);
    	sysTableinfo.setAvailable(ToolUtil.AVAILABLE);
    	sysTableinfo.setCreatetime(ToolUtil.getCurrentTime());
    	int count = tDeptUuidMapper.insert(sysTableinfo);
    	//创建子集表
    	tableInfoAPIMapper.createTable(sysTableinfo.getEnTableName());
    	return count;
	}

	@Override
	public int insertSubsetTableData(SysColumnInfo sysColumnInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

}