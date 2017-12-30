package com.zheng.upms.rpc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.UpmsPositionMapper;
import com.zheng.upms.dao.model.TPositionOrganization;
import com.zheng.upms.dao.model.UpmsPosition;
import com.zheng.upms.dao.model.UpmsPositionExample;
import com.zheng.upms.rpc.api.UpmsPositionService;
import com.zheng.upms.rpc.mapper.UpmsPositionAPIMapper;

/**
* UpmsPositionService实现
* Created by shuzheng on 2017/12/12.
*/
@Service
@Transactional
@BaseService
public class UpmsPositionServiceImpl extends BaseServiceImpl<UpmsPositionMapper, UpmsPosition, UpmsPositionExample> implements UpmsPositionService {

    private static Logger _log = LoggerFactory.getLogger(UpmsPositionServiceImpl.class);

    @Autowired
    UpmsPositionMapper upmsPositionMapper;
    
    @Autowired
    UpmsPositionAPIMapper upmsPositionAPIMapper;

	@Override
	public int insertTPositionOrganization(String orgNodes, String positionNodes) {
		String[] orgNodesArr = orgNodes.split(",");
    	String[] positionNodesArr = positionNodes.split(",");
    	List<Object> list = new ArrayList<Object>();
    	int maxsequence = upmsPositionAPIMapper.selectMaxsequence();
    	TPositionOrganization tPositionOrganization;
    	for(int i = 0; i < orgNodesArr.length; i++){
    		for(int j = 0; j < positionNodesArr.length; j++){
    			maxsequence ++;
    			tPositionOrganization = new TPositionOrganization();
    			tPositionOrganization.setOrganizationId(orgNodesArr[i]);
    			tPositionOrganization.setPositionId(positionNodesArr[j]);
    			tPositionOrganization.setSequence(maxsequence);
    			list.add(tPositionOrganization);
    		}
    	}
		int count = upmsPositionAPIMapper.insertTPositionOrganization(list);
		return count;
	}

}