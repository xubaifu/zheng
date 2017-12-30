package com.zheng.ehr.rpc.api;

import com.zheng.common.base.BaseServiceMock;
import com.zheng.ehr.dao.mapper.TDeptMapper;
import com.zheng.ehr.dao.model.TDept;
import com.zheng.ehr.dao.model.TDeptExample;

/**
* 降级实现TDeptService接口
* Created by shuzheng on 2017/12/27.
*/
public class TDeptServiceMock extends BaseServiceMock<TDeptMapper, TDept, TDeptExample> implements TDeptService {

}
