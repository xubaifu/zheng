package com.zheng.upms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.SysTemplateTableExample;

public interface SysTemplateTableMapper {
    long countByExample(SysTemplateTableExample example);

    int deleteByExample(SysTemplateTableExample example);

    int insert(SysTemplateTable record);

    int insertSelective(SysTemplateTable record);

    List<SysTemplateTable> selectByExample(SysTemplateTableExample example);

    int updateByExampleSelective(@Param("record") SysTemplateTable record, @Param("example") SysTemplateTableExample example);

    int updateByExample(@Param("record") SysTemplateTable record, @Param("example") SysTemplateTableExample example);
    
}