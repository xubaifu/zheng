package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.TDeptUuid;
import com.zheng.upms.dao.model.TDeptUuidExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TDeptUuidMapper {
    long countByExample(TDeptUuidExample example);

    int deleteByExample(TDeptUuidExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TDeptUuid record);

    int insertSelective(TDeptUuid record);

    List<TDeptUuid> selectByExample(TDeptUuidExample example);

    TDeptUuid selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TDeptUuid record, @Param("example") TDeptUuidExample example);

    int updateByExample(@Param("record") TDeptUuid record, @Param("example") TDeptUuidExample example);

    int updateByPrimaryKeySelective(TDeptUuid record);

    int updateByPrimaryKey(TDeptUuid record);
}