package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.TPositionUuid;
import com.zheng.upms.dao.model.TPositionUuidExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TPositionUuidMapper {
    long countByExample(TPositionUuidExample example);

    int deleteByExample(TPositionUuidExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TPositionUuid record);

    int insertSelective(TPositionUuid record);

    List<TPositionUuid> selectByExample(TPositionUuidExample example);

    TPositionUuid selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TPositionUuid record, @Param("example") TPositionUuidExample example);

    int updateByExample(@Param("record") TPositionUuid record, @Param("example") TPositionUuidExample example);

    int updateByPrimaryKeySelective(TPositionUuid record);

    int updateByPrimaryKey(TPositionUuid record);
}