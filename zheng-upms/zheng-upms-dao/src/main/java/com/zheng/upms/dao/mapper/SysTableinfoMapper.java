package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTableinfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysTableinfoMapper {
    long countByExample(SysTableinfoExample example);

    int deleteByExample(SysTableinfoExample example);

    int deleteByPrimaryKey(String id);

    int insert(SysTableinfo record);

    int insertSelective(SysTableinfo record);

    List<SysTableinfo> selectByExample(SysTableinfoExample example);

    SysTableinfo selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") SysTableinfo record, @Param("example") SysTableinfoExample example);

    int updateByExample(@Param("record") SysTableinfo record, @Param("example") SysTableinfoExample example);

    int updateByPrimaryKeySelective(SysTableinfo record);

    int updateByPrimaryKey(SysTableinfo record);
    
    String createTable(@Param("tableName") String tablename);
}