package com.zheng.upms.rpc.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.common.db.DataSourceEnum;
import com.zheng.common.db.DynamicDataSource;
import com.zheng.upms.common.constant.ToolUtil;
import com.zheng.upms.dao.mapper.SysTableinfoMapper;
import com.zheng.upms.dao.mapper.SysTemplateTableMapper;
import com.zheng.upms.dao.mapper.TDeptUuidMapper;
import com.zheng.upms.dao.model.SysColumnInfo;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.SysTemplateTableExample;
import com.zheng.upms.dao.model.TDeptUuid;
import com.zheng.upms.dao.model.TDeptUuidExample;
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

    /*@Autowired
    SysTemplateTableMapper sysTemplateTableMapper;*/
    @Autowired
    private TableInfoAPIMapper tableInfoAPIMapper;
    @Autowired
    private SysTableinfoMapper sysTableinfoMapper;
    
    @Autowired
    private TDeptUuidMapper tDeptUuidMapper;

	@Override
	public List<SysTemplateTable> getDataInfo(String tableName, List<String> list, String search) {
		return tableInfoAPIMapper.getDataInfo(tableName, list, search);
	}
	
	@Override
	public List<SysTemplateTable> getDataInfoPage(Map<String, Object> params) {
		DynamicDataSource.setDataSource(DataSourceEnum.SLAVE.getName());
		List<SysTemplateTable> result = tableInfoAPIMapper.getDataInfoPage(params);
		DynamicDataSource.clearDataSource();
		return result;
	}
	
	@Override
	public int getDataInfoPageCount(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return tableInfoAPIMapper.getDataInfoPageCount(params);
	}
	
	@Override
	public int getDataInfoCountNolike(String tableName, List<String> list, String search) {
		return tableInfoAPIMapper.getDataInfoCountNolike(tableName, list, search);
	}


	@Override
	public int insertSubsetData(String tableName, String organizationId, String data) {
    	
    	String subId = UUID.randomUUID().toString();
    	TDeptUuid tDeptUuid = new TDeptUuid();
    	tDeptUuid.setDeptId(organizationId);
    	tDeptUuid.setSubId(subId);
    	tDeptUuid.setEnTableName(tableName);
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
    	int count = sysTableinfoMapper.insert(sysTableinfo);
    	//创建子集表
    	tableInfoAPIMapper.createTable(sysTableinfo.getEnTableName());
    	return count;
	}

	@Override
	public int insertSubsetTableData(SysColumnInfo sysColumnInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSubsetData(String tableName, String subId) {
		if (StringUtils.isBlank(subId)) {
			return 0;
		}
		int count = 0;
		String[] idArray = subId.split(",");
		for (String idStr : idArray) {
			if (StringUtils.isBlank(idStr)) {
				continue;
			}
			TDeptUuidExample tDeptUuidExample = new TDeptUuidExample();
	    	TDeptUuidExample.Criteria criteria=tDeptUuidExample.createCriteria();  
	    	criteria.andSubIdEqualTo(idStr);
	    	//删除部门信息主键存储表数据
	    	Object result = tDeptUuidMapper.deleteByExample(tDeptUuidExample);
			//删除子集表数据
	    	tableInfoAPIMapper.deleteBySubId(tableName, subId);
	    	
	    	count += Integer.parseInt(String.valueOf(result));
		}
		
		
		return count;
	}

	@Override
	public int updateSubsetData(String tableName, String subId, String data) {
		//String subId = UUID.randomUUID().toString();
    	//TDeptUuid tDeptUuid = new TDeptUuid();
    	//tDeptUuid.setDeptId(organizationId);
    	//tDeptUuid.setSubId(subId);
    	
    	//int count = tableInfoAPIMapper.insertTDeptUuid(tDeptUuid);
    	SysTemplateTable sysTemplateTable = new SysTemplateTable();
    	
    	int count = 0;
    	JSONObject jsonObject=JSONObject.fromObject(data);
    	@SuppressWarnings("unchecked")
		Iterator<Object> iterator = jsonObject.keys();
    	while(iterator.hasNext()){
    		String key = (String) iterator.next();
    		String value = jsonObject.getString(key);
    		//sysTemplateTable.setId(UUID.randomUUID().toString());
    		sysTemplateTable.setSubId(subId);
    		sysTemplateTable.setProperty(key);
    		sysTemplateTable.setValue(value);
    		sysTemplateTable.setTablename(tableName);
    		count = tableInfoAPIMapper.updateSysTemplateTable(sysTemplateTable);
    		if(count == 0){//新增时如果没有该数据，则添加（因为当子集新增一个属性（列）时，所有的该子集下的数据都没有该属性（列）值，所以编辑数据时该属性（列）下的内容是无法添加的）
        		/*sysTemplateTable.setSubId(subId);
        		sysTemplateTable.setProperty(key);
        		sysTemplateTable.setValue(value);
        		sysTemplateTable.setTablename(tableName);*/
    			sysTemplateTable.setId(UUID.randomUUID().toString());
        		tableInfoAPIMapper.insertSysTemplateTable(sysTemplateTable);
    		}
    	}
		return count;
	}

}