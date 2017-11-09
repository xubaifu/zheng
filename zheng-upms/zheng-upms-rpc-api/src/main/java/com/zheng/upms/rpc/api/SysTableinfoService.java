package com.zheng.upms.rpc.api;

import com.zheng.common.base.BaseService;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTableinfoExample;

/**
* SysTableinfoService接口
* Created by shuzheng on 2017/11/7.
*/
public interface SysTableinfoService extends BaseService<SysTableinfo, SysTableinfoExample> {
	public String creatTable(String tableName);
}