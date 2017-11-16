package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.SysColumnInfo;
import com.zheng.upms.dao.model.SysColumnInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysColumnInfoMapper {
    long countByExample(SysColumnInfoExample example);

    int deleteByExample(SysColumnInfoExample example);

    int deleteByPrimaryKey(String id);

    int insert(SysColumnInfo record);

    int insertSelective(SysColumnInfo record);

    List<SysColumnInfo> selectByExample(SysColumnInfoExample example);

    SysColumnInfo selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") SysColumnInfo record, @Param("example") SysColumnInfoExample example);

    int updateByExample(@Param("record") SysColumnInfo record, @Param("example") SysColumnInfoExample example);

    int updateByPrimaryKeySelective(SysColumnInfo record);

    int updateByPrimaryKey(SysColumnInfo record);
}