package com.zheng.upms.rpc.api;

import com.zheng.common.base.BaseServiceMock;
import com.zheng.upms.dao.mapper.TUserUuidMapper;
import com.zheng.upms.dao.model.TUserUuid;
import com.zheng.upms.dao.model.TUserUuidExample;

/**
* 降级实现TUserUuidService接口
* Created by shuzheng on 2018/3/3.
*/
public class TUserUuidServiceMock extends BaseServiceMock<TUserUuidMapper, TUserUuid, TUserUuidExample> implements TUserUuidService {

}
