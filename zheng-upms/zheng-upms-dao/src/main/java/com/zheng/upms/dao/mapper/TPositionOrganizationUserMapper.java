package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.TPositionOrganizationUser;
import com.zheng.upms.dao.model.TPositionOrganizationUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TPositionOrganizationUserMapper {
    long countByExample(TPositionOrganizationUserExample example);

    int deleteByExample(TPositionOrganizationUserExample example);

    int deleteByPrimaryKey(@Param("positionId") String positionId, @Param("organizationId") String organizationId, @Param("userId") String userId);

    int insert(TPositionOrganizationUser record);

    int insertSelective(TPositionOrganizationUser record);

    List<TPositionOrganizationUser> selectByExample(TPositionOrganizationUserExample example);

    TPositionOrganizationUser selectByPrimaryKey(@Param("positionId") String positionId, @Param("organizationId") String organizationId, @Param("userId") String userId);

    int updateByExampleSelective(@Param("record") TPositionOrganizationUser record, @Param("example") TPositionOrganizationUserExample example);

    int updateByExample(@Param("record") TPositionOrganizationUser record, @Param("example") TPositionOrganizationUserExample example);

    int updateByPrimaryKeySelective(TPositionOrganizationUser record);

    int updateByPrimaryKey(TPositionOrganizationUser record);
}