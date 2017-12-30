package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.TPositionOrganizationUserHis;
import com.zheng.upms.dao.model.TPositionOrganizationUserHisExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TPositionOrganizationUserHisMapper {
    long countByExample(TPositionOrganizationUserHisExample example);

    int deleteByExample(TPositionOrganizationUserHisExample example);

    int deleteByPrimaryKey(String id);

    int insert(TPositionOrganizationUserHis record);

    int insertSelective(TPositionOrganizationUserHis record);

    List<TPositionOrganizationUserHis> selectByExample(TPositionOrganizationUserHisExample example);

    TPositionOrganizationUserHis selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") TPositionOrganizationUserHis record, @Param("example") TPositionOrganizationUserHisExample example);

    int updateByExample(@Param("record") TPositionOrganizationUserHis record, @Param("example") TPositionOrganizationUserHisExample example);

    int updateByPrimaryKeySelective(TPositionOrganizationUserHis record);

    int updateByPrimaryKey(TPositionOrganizationUserHis record);
}