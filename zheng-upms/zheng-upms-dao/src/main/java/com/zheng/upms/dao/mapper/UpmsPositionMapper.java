package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.UpmsPosition;
import com.zheng.upms.dao.model.UpmsPositionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UpmsPositionMapper {
    long countByExample(UpmsPositionExample example);

    int deleteByExample(UpmsPositionExample example);

    int deleteByPrimaryKey(String positionId);

    int insert(UpmsPosition record);

    int insertSelective(UpmsPosition record);

    List<UpmsPosition> selectByExample(UpmsPositionExample example);

    UpmsPosition selectByPrimaryKey(String positionId);

    int updateByExampleSelective(@Param("record") UpmsPosition record, @Param("example") UpmsPositionExample example);

    int updateByExample(@Param("record") UpmsPosition record, @Param("example") UpmsPositionExample example);

    int updateByPrimaryKeySelective(UpmsPosition record);

    int updateByPrimaryKey(UpmsPosition record);
}