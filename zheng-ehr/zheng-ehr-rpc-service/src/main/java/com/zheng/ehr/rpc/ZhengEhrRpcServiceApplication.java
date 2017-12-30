package com.zheng.ehr.rpc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 服务启动类
 */
public class ZhengEhrRpcServiceApplication {

	private static Logger _log = LoggerFactory.getLogger(ZhengEhrRpcServiceApplication.class);

	public static void main(String[] args) {
		_log.info(">>>>> zheng-ehr-rpc-service 正在启动 <<<<<");
		new ClassPathXmlApplicationContext("classpath:META-INF/spring/*.xml");
		_log.info(">>>>> zheng-ehr-rpc-service 启动完成 <<<<<");
	}

}
