package com.zheng.upms.rpc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zheng.upms.dao.model.TPositionOrganizationHis;
import com.zheng.upms.dao.model.UpmsOrganization;
import com.zheng.upms.dao.model.UpmsPosition;

public interface UpmsPositionAPIMapper {
	int insertTPositionOrganization(@Param("list")List<Object> paramsList);
	int selectMaxsequence();
	List<UpmsPosition> getPositionByOrg(Map<Object, Object> params);
	int getPositionByOrgCount(Map<Object, Object> params);
	List<UpmsPosition> getPositionByOrgAll(String organizationId);
	
	List<UpmsOrganization> getOrgByPosition(Map<Object, Object> params);
	int getOrgByPositionCount(Map<Object, Object> params);
	List<UpmsOrganization> getOrgByPositionAll(String positionId);
	int insertTPositionOrganizationHis(TPositionOrganizationHis tPositionOrganizationHis);
}
