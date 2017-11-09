package com.zheng.upms.rpc.api;

import com.zheng.common.base.BaseServiceMock;
import com.zheng.upms.dao.mapper.SysTableinfoMapper;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTableinfoExample;

/**
* 降级实现SysTableinfoService接口
* Created by shuzheng on 2017/11/7.
*/
public class SysTableinfoServiceMock extends BaseServiceMock<SysTableinfoMapper, SysTableinfo, SysTableinfoExample> implements SysTableinfoService {

	@Override
	public String creatTable(String tableName) {
		// TODO 自动生成的方法存根
		return null;
	}

}
