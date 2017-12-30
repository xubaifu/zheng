package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.TPositionOrganization;
import com.zheng.upms.dao.model.TPositionOrganizationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TPositionOrganizationMapper {
    long countByExample(TPositionOrganizationExample example);

    int deleteByExample(TPositionOrganizationExample example);

    int deleteByPrimaryKey(@Param("positionId") String positionId, @Param("organizationId") String organizationId);

    int insert(TPositionOrganization record);

    int insertSelective(TPositionOrganization record);

    List<TPositionOrganization> selectByExample(TPositionOrganizationExample example);

    TPositionOrganization selectByPrimaryKey(@Param("positionId") String positionId, @Param("organizationId") String organizationId);

    int updateByExampleSelective(@Param("record") TPositionOrganization record, @Param("example") TPositionOrganizationExample example);

    int updateByExample(@Param("record") TPositionOrganization record, @Param("example") TPositionOrganizationExample example);

    int updateByPrimaryKeySelective(TPositionOrganization record);

    int updateByPrimaryKey(TPositionOrganization record);
}