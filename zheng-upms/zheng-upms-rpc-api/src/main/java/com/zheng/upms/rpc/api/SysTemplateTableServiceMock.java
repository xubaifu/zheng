package com.zheng.upms.rpc.api;

import java.util.List;
import java.util.Map;

import com.zheng.common.base.BaseServiceMock;
import com.zheng.upms.dao.mapper.SysTemplateTableMapper;
import com.zheng.upms.dao.model.SysColumnInfo;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.SysTemplateTableExample;

/**
* 降级实现SysTemplateTableService接口
* Created by shuzheng on 2017/11/14.
*/
public class SysTemplateTableServiceMock extends BaseServiceMock<SysTemplateTableMapper, SysTemplateTable, SysTemplateTableExample> implements SysTemplateTableService {

	@Override
	public List<SysTemplateTable> getDataInfo(String tableName, List<String> list, String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertSubsetData(String tableName, String organizationId, String data) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createSubsetTable(SysTableinfo sysTableinfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSubsetTableData(SysColumnInfo sysColumnInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSubsetData(String tableName, String subId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSubsetData(String tableName, String subId, String data) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getDataInfoCountNolike(String tableName, List<String> list, String search) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SysTemplateTable> getDataInfoPage(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getDataInfoPageCount(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

}
