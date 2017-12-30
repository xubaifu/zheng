package com.zheng.upms.rpc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UpmsPositionAPIMapper {
	int insertTPositionOrganization(@Param("list")List<Object> paramsList);
	int selectMaxsequence();
}
