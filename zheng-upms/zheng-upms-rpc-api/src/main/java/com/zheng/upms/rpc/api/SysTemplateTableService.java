package com.zheng.upms.rpc.api;

import java.util.List;

import com.zheng.common.base.BaseService;
import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.SysTemplateTableExample;

/**
* SysTemplateTableService接口
* Created by shuzheng on 2017/11/14.
*/
public interface SysTemplateTableService extends BaseService<SysTemplateTable, SysTemplateTableExample> {
	List<SysTemplateTable> getDataInfo( String tableName , List<String> list);
}