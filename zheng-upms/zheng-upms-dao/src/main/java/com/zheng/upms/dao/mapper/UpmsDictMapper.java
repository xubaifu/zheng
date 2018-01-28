package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.UpmsDict;
import com.zheng.upms.dao.model.UpmsDictExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UpmsDictMapper {
    long countByExample(UpmsDictExample example);

    int deleteByExample(UpmsDictExample example);

    int deleteByPrimaryKey(String id);

    int insert(UpmsDict record);

    int insertSelective(UpmsDict record);

    List<UpmsDict> selectByExample(UpmsDictExample example);

    UpmsDict selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UpmsDict record, @Param("example") UpmsDictExample example);

    int updateByExample(@Param("record") UpmsDict record, @Param("example") UpmsDictExample example);

    int updateByPrimaryKeySelective(UpmsDict record);

    int updateByPrimaryKey(UpmsDict record);
}