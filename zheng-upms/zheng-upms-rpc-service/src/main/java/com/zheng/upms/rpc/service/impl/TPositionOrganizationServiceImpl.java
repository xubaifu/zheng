package com.zheng.upms.rpc.service.impl;

import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.zheng.upms.dao.mapper.TPositionOrganizationMapper;
import com.zheng.upms.dao.model.TPositionOrganization;
import com.zheng.upms.dao.model.TPositionOrganizationExample;
import com.zheng.upms.dao.model.TPositionOrganizationHis;
import com.zheng.upms.rpc.api.TPositionOrganizationService;
import com.zheng.upms.rpc.mapper.UpmsPositionAPIMapper;

/**
* TPositionOrganizationService实现
* Created by shuzheng on 2017/12/29.
*/
@Service
@Transactional
@BaseService
public class TPositionOrganizationServiceImpl extends BaseServiceImpl<TPositionOrganizationMapper, TPositionOrganization, TPositionOrganizationExample> implements TPositionOrganizationService {

    private static Logger _log = LoggerFactory.getLogger(TPositionOrganizationServiceImpl.class);

    @Autowired
    private TPositionOrganizationMapper tPositionOrganizationMapper;
    
    /*@Autowired
    private TPositionOrganizationHisMapper tPositionOrganizationHisMapper;*/
    
    @Autowired 
    private UpmsPositionAPIMapper upmsPositionAPIMapper;

	@Override
	public int deleteOrg(String positionId, String orgIds) {
		String[] ids = orgIds.split(",");
		for(int i = 0;i < ids.length; i++){
			tPositionOrganizationMapper.deleteByPrimaryKey(positionId, ids[i]);
			//此处添加历史记录
			TPositionOrganizationHis tPositionOrganizationHis = new TPositionOrganizationHis();
			tPositionOrganizationHis.setId(UUID.randomUUID().toString());
			tPositionOrganizationHis.setOrganizationId(ids[i]);
			tPositionOrganizationHis.setPositionId(positionId);
			upmsPositionAPIMapper.insertTPositionOrganizationHis(tPositionOrganizationHis);
		}
		return 0;
	}

	@Override
	public int deletePosition(String organizationId, String positionIds) {
		String[] ids = positionIds.split(",");
		for(int i = 0;i < ids.length; i++){
			tPositionOrganizationMapper.deleteByPrimaryKey(ids[i], organizationId);
			TPositionOrganizationHis tPositionOrganizationHis = new TPositionOrganizationHis();
			tPositionOrganizationHis.setId(UUID.randomUUID().toString());
			tPositionOrganizationHis.setOrganizationId(organizationId);
			tPositionOrganizationHis.setPositionId(ids[i]);
			//此处添加历史记录
			upmsPositionAPIMapper.insertTPositionOrganizationHis(tPositionOrganizationHis);
		}
		return 0;
	}

}