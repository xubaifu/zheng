package com.zheng.ehr.common.constant;

import com.zheng.common.base.BaseResult;

/**
 * ehr系统常量枚举类
 */
public class EhrResult extends BaseResult {

    public EhrResult(EhrResultConstant ehrResultConstant, Object data) {
        super(ehrResultConstant.getCode(), ehrResultConstant.getMessage(), data);
    }

}
