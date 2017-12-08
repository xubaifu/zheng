package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.UpmsOrganizationHis;
import com.zheng.upms.dao.model.UpmsOrganizationHisExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UpmsOrganizationHisMapper {
    long countByExample(UpmsOrganizationHisExample example);

    int deleteByExample(UpmsOrganizationHisExample example);

    int deleteByPrimaryKey(String id);

    int insert(UpmsOrganizationHis record);

    int insertSelective(UpmsOrganizationHis record);

    List<UpmsOrganizationHis> selectByExample(UpmsOrganizationHisExample example);

    UpmsOrganizationHis selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UpmsOrganizationHis record, @Param("example") UpmsOrganizationHisExample example);

    int updateByExample(@Param("record") UpmsOrganizationHis record, @Param("example") UpmsOrganizationHisExample example);

    int updateByPrimaryKeySelective(UpmsOrganizationHis record);

    int updateByPrimaryKey(UpmsOrganizationHis record);
}