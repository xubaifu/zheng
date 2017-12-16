package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.UpmsPositionHis;
import com.zheng.upms.dao.model.UpmsPositionHisExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UpmsPositionHisMapper {
    long countByExample(UpmsPositionHisExample example);

    int deleteByExample(UpmsPositionHisExample example);

    int deleteByPrimaryKey(String id);

    int insert(UpmsPositionHis record);

    int insertSelective(UpmsPositionHis record);

    List<UpmsPositionHis> selectByExample(UpmsPositionHisExample example);

    UpmsPositionHis selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UpmsPositionHis record, @Param("example") UpmsPositionHisExample example);

    int updateByExample(@Param("record") UpmsPositionHis record, @Param("example") UpmsPositionHisExample example);

    int updateByPrimaryKeySelective(UpmsPositionHis record);

    int updateByPrimaryKey(UpmsPositionHis record);
}