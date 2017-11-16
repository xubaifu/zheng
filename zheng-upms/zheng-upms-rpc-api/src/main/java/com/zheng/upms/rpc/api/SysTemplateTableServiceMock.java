package com.zheng.upms.rpc.api;

import java.util.List;

import com.zheng.common.base.BaseServiceMock;
import com.zheng.upms.dao.mapper.SysTemplateTableMapper;
import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.SysTemplateTableExample;

/**
* 降级实现SysTemplateTableService接口
* Created by shuzheng on 2017/11/14.
*/
public class SysTemplateTableServiceMock extends BaseServiceMock<SysTemplateTableMapper, SysTemplateTable, SysTemplateTableExample> implements SysTemplateTableService {

	@Override
	public List<SysTemplateTable> getDataInfo(String tableName, List<String> list) {
		// TODO Auto-generated method stub
		return null;
	}

}
