package com.zheng.upms.dao.mapper;

import com.zheng.upms.dao.model.TUserUuid;
import com.zheng.upms.dao.model.TUserUuidExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TUserUuidMapper {
    long countByExample(TUserUuidExample example);

    int deleteByExample(TUserUuidExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TUserUuid record);

    int insertSelective(TUserUuid record);

    List<TUserUuid> selectByExample(TUserUuidExample example);

    TUserUuid selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TUserUuid record, @Param("example") TUserUuidExample example);

    int updateByExample(@Param("record") TUserUuid record, @Param("example") TUserUuidExample example);

    int updateByPrimaryKeySelective(TUserUuid record);

    int updateByPrimaryKey(TUserUuid record);
}