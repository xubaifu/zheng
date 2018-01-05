package com.zheng.upms.rpc.api;

import java.util.List;

import com.zheng.common.base.BaseService;
import com.zheng.upms.dao.model.TPositionOrganization;
import com.zheng.upms.dao.model.TPositionOrganizationExample;

/**
* TPositionOrganizationService接口
* Created by shuzheng on 2017/12/29.
*/
public interface TPositionOrganizationService extends BaseService<TPositionOrganization, TPositionOrganizationExample> {
	int deleteOrg(String positionId, String orgIds);
	int deletePosition(String organizationId, String positionIds);
	
	List<String> getAllUser();
}