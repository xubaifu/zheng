package com.zheng.upms.rpc.service;

import com.zheng.upms.dao.mapper.UpmsUserMapper;
import com.zheng.upms.dao.model.*;
import com.zheng.upms.rpc.api.UpmsPermissionService;
import com.zheng.upms.rpc.api.UpmsSystemService;
import com.zheng.upms.rpc.api.UpmsUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import java.util.List;
import java.util.UUID;

/**
 * 单元测试
 * Created by shuzheng on 2017/2/19.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "classpath:applicationContext.xml",
        "classpath:META-INF/spring/applicationContext-jdbc.xml",
        "classpath:META-INF/spring/applicationContext-listener.xml"
})
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
public class TableInfoTest {

    @Autowired
    private com.zheng.upms.rpc.api.SysTableinfoService SysTableinfoService;

//    @Test
//    public void creatTable() {
//    	SysTableinfoService.creatTable("");
//    }
    
  

}
