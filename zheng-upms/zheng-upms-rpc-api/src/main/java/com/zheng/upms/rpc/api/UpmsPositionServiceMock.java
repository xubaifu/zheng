package com.zheng.upms.rpc.api;

import java.util.List;
import java.util.Map;

import com.zheng.common.base.BaseServiceMock;
import com.zheng.upms.dao.mapper.UpmsPositionMapper;
import com.zheng.upms.dao.model.UpmsOrganization;
import com.zheng.upms.dao.model.UpmsPosition;
import com.zheng.upms.dao.model.UpmsPositionExample;

/**
* 降级实现UpmsPositionService接口
* Created by shuzheng on 2017/12/12.
*/
public class UpmsPositionServiceMock extends BaseServiceMock<UpmsPositionMapper, UpmsPosition, UpmsPositionExample> implements UpmsPositionService {

	@Override
	public int insertTPositionOrganization(String orgNodes, String positionNodes) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UpmsPosition> getPositionByOrg(Map<Object, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPositionByOrgCount(Map<Object, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UpmsPosition> getPositionByOrgAll(String organizationId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UpmsOrganization> getOrgByPosition(Map<Object, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getOrgByPositionCount(Map<Object, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UpmsOrganization> getOrgByPositionAll(String positionId) {
		// TODO Auto-generated method stub
		return null;
	}

}
