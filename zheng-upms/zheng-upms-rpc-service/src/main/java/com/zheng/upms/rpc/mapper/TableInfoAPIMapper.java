package com.zheng.upms.rpc.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.TDeptUuid;
import com.zheng.upms.dao.model.TPositionUuid;
import com.zheng.upms.dao.model.TUserUuid;

public interface TableInfoAPIMapper {
	/**
	 * 根据表名和列信息获取数据
	 * @param tableName
	 * @param list
	 * @return
	 */
	List<SysTemplateTable> getDataInfo(@Param("tableName") String tableName ,@Param("list") List<String> list,@Param("search") String search);
	/**
	 * 根据条件获取数据
	 * @param tableName
	 * @param list
	 * @return
	 */
	List<SysTemplateTable> getDataInfoPage(Map<String, Object> params);
	int getDataInfoPageCount(Map<String, Object> params);
	
	List<SysTemplateTable> getDataInfoPagePosition(Map<String, Object> params);
	int getDataInfoPagePositionCount(Map<String, Object> params);
	/**
	 * 查询条件筛选掉的数据数量
	 * @param tableName
	 * @param list
	 * @param search
	 * @return
	 */
	int getDataInfoCountNolike(@Param("tableName") String tableName ,@Param("list") List<String> list,@Param("search") String search);
	int insertTDeptUuid(TDeptUuid tDeptUuid);
	int insertTPositionUuid(TPositionUuid tPositionUuid);
	int insertTUserUuid(TUserUuid tUserUuid);
	int insertSysTemplateTable(SysTemplateTable sysTemplateTable/*, String tableName*/);
	void createTable(@Param("tableName") String tableName);
	int deleteBySubId(@Param("tableName") String tableName, @Param("subId") String subId);
	int updateSysTemplateTable(SysTemplateTable sysTemplateTable);
	/**
	 * Get User Subset data
	 * @param params
	 * @return
	 */
	List<SysTemplateTable> getDataInfoPageUser(Map<String, Object> params);
	int getDataInfoPageUserCount(Map<String, Object> params);
}
