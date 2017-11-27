package com.zheng.upms.rpc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.TDeptUuid;

public interface TableInfoAPIMapper {
	/**
	 * 根据表名和列信息获取数据
	 * @param tableName
	 * @param list
	 * @return
	 */
	List<SysTemplateTable> getDataInfo(@Param("tableName") String tableName ,@Param("list") List<String> list);
	int insertTDeptUuid(TDeptUuid tDeptUuid);
	int insertSysTemplateTable(SysTemplateTable sysTemplateTable/*, String tableName*/);
	void createTable(@Param("tableName") String tableName);
}
