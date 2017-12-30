package com.zheng.ehr.dao.mapper;

import com.zheng.ehr.dao.model.TDept;
import com.zheng.ehr.dao.model.TDeptExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TDeptMapper {
    long countByExample(TDeptExample example);

    int deleteByExample(TDeptExample example);

    int deleteByPrimaryKey(String id);

    int insert(TDept record);

    int insertSelective(TDept record);

    List<TDept> selectByExample(TDeptExample example);

    TDept selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") TDept record, @Param("example") TDeptExample example);

    int updateByExample(@Param("record") TDept record, @Param("example") TDeptExample example);

    int updateByPrimaryKeySelective(TDept record);

    int updateByPrimaryKey(TDept record);
}