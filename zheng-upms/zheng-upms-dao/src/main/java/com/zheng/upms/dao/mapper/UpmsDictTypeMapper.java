package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.UpmsDictType;
import com.zheng.upms.dao.model.UpmsDictTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UpmsDictTypeMapper {
    long countByExample(UpmsDictTypeExample example);

    int deleteByExample(UpmsDictTypeExample example);

    int deleteByPrimaryKey(String id);

    int insert(UpmsDictType record);

    int insertSelective(UpmsDictType record);

    List<UpmsDictType> selectByExample(UpmsDictTypeExample example);

    UpmsDictType selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UpmsDictType record, @Param("example") UpmsDictTypeExample example);

    int updateByExample(@Param("record") UpmsDictType record, @Param("example") UpmsDictTypeExample example);

    int updateByPrimaryKeySelective(UpmsDictType record);

    int updateByPrimaryKey(UpmsDictType record);
}