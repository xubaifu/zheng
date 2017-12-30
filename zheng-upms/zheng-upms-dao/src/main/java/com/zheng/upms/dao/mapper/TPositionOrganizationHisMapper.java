package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.TPositionOrganizationHis;
import com.zheng.upms.dao.model.TPositionOrganizationHisExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TPositionOrganizationHisMapper {
    long countByExample(TPositionOrganizationHisExample example);

    int deleteByExample(TPositionOrganizationHisExample example);

    int deleteByPrimaryKey(@Param("positionId") String positionId, @Param("organizationId") String organizationId);

    int insert(TPositionOrganizationHis record);

    int insertSelective(TPositionOrganizationHis record);

    List<TPositionOrganizationHis> selectByExample(TPositionOrganizationHisExample example);

    TPositionOrganizationHis selectByPrimaryKey(@Param("positionId") String positionId, @Param("organizationId") String organizationId);

    int updateByExampleSelective(@Param("record") TPositionOrganizationHis record, @Param("example") TPositionOrganizationHisExample example);

    int updateByExample(@Param("record") TPositionOrganizationHis record, @Param("example") TPositionOrganizationHisExample example);

    int updateByPrimaryKeySelective(TPositionOrganizationHis record);

    int updateByPrimaryKey(TPositionOrganizationHis record);
}