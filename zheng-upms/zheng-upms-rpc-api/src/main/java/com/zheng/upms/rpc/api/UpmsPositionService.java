package com.zheng.upms.rpc.api;

import java.util.List;
import java.util.Map;

import com.zheng.common.base.BaseService;
import com.zheng.upms.dao.model.UpmsOrganization;
import com.zheng.upms.dao.model.UpmsPosition;
import com.zheng.upms.dao.model.UpmsPositionExample;

/**
* UpmsPositionService接口
* Created by shuzheng on 2017/12/12.
*/
public interface UpmsPositionService extends BaseService<UpmsPosition, UpmsPositionExample> {
	int insertTPositionOrganization(String orgNodes, String positionNodes);
	List<UpmsPosition> getPositionByOrg(Map<Object, Object> map);
	int getPositionByOrgCount(Map<Object, Object> map);
	List<UpmsPosition> getPositionByOrgAll(String organizationId);
	
	List<UpmsOrganization> getOrgByPosition(Map<Object, Object> params);
	int getOrgByPositionCount(Map<Object, Object> params);
	List<UpmsOrganization> getOrgByPositionAll(String positionId);
}