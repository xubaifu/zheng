package com.zheng.upms.common.constant;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ToolUtil {
	
	public static final String ORGANIZATION_SUBSET_TYPE = "1";//组织子集类型
	public static final String POSITION_SUBSET_TYPE = "2";//岗位子集类型
	public static final String PERSONNEL_SUBSET_TYPE = "3";//人员子集类型
	public static final String AVAILABLE = "0";//有效的
	public static final String UNAVAILABLE = "1";//无效的
	/**
	 * 获取当前时间
	 * @return
	 */
	public static String getCurrentTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		return df.format(new Date());
	}
}
