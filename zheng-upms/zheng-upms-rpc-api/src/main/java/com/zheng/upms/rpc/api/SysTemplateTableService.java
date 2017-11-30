package com.zheng.upms.rpc.api;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;

import com.zheng.common.base.BaseService;
import com.zheng.upms.dao.model.SysColumnInfo;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.SysTemplateTableExample;

/**
* SysTemplateTableService接口
* Created by shuzheng on 2017/11/14.
*/
public interface SysTemplateTableService extends BaseService<SysTemplateTable, SysTemplateTableExample> {
	/**
	 * 根据表名和列信息获取数据
	 * @param tableName
	 * @param list
	 * @return
	 */
	List<SysTemplateTable> getDataInfo( String tableName , List<String> list);
	
	/**
	 * 向子集表添加数据
	 * @param tableName
	 * @param organizationId
	 * @param data
	 * @return
	 */
	int insertSubsetData(String tableName, String organizationId, String data);
	
	/**
	 * 创建子集表
	 * @param sysTableinfo
	 * @return
	 */
	int createSubsetTable(SysTableinfo sysTableinfo);
	/**
	 * 新增子集表属性
	 * @param sysColumnInfo
	 * @return
	 */
	int insertSubsetTableData(SysColumnInfo sysColumnInfo);
	/**
	 * 删除子集数据
	 * @param tableName
	 * @param subId
	 * @return
	 */
	int deleteSubsetData(String tableName, String subId);
	/**
	 * 修改子集数据
	 * @param tableName
	 * @param subId
	 * @param data
	 * @return
	 */
	int updateSubsetData(String tableName, String subId, String data);
}