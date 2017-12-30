package com.zheng.upms.rpc.api;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.zheng.common.base.BaseService;
import com.zheng.upms.dao.model.UpmsPosition;
import com.zheng.upms.dao.model.UpmsPositionExample;

/**
* UpmsPositionService接口
* Created by shuzheng on 2017/12/12.
*/
public interface UpmsPositionService extends BaseService<UpmsPosition, UpmsPositionExample> {
	int insertTPositionOrganization(String orgNodes, String positionNodes);
}