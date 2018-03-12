package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.UpmsDictData;
import com.zheng.upms.dao.model.UpmsDictDataExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UpmsDictDataMapper {
    long countByExample(UpmsDictDataExample example);

    int deleteByExample(UpmsDictDataExample example);

    int deleteByPrimaryKey(String dictCode);

    int insert(UpmsDictData record);

    int insertSelective(UpmsDictData record);

    List<UpmsDictData> selectByExample(UpmsDictDataExample example);

    UpmsDictData selectByPrimaryKey(String dictCode);

    int updateByExampleSelective(@Param("record") UpmsDictData record, @Param("example") UpmsDictDataExample example);

    int updateByExample(@Param("record") UpmsDictData record, @Param("example") UpmsDictDataExample example);

    int updateByPrimaryKeySelective(UpmsDictData record);

    int updateByPrimaryKey(UpmsDictData record);
}