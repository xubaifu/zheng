package com.zheng.upms.server.dict;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.zheng.common.util.RedisUtil;
import com.zheng.upms.common.constant.ToolUtil;
import com.zheng.upms.dao.model.UpmsDict;
import com.zheng.upms.dao.model.UpmsDictExample;
import com.zheng.upms.rpc.api.UpmsDictService;

import redis.clients.jedis.Jedis;

@Component("BeanDefineConfigue")
public class BeanDefineConfigue implements ApplicationListener<ContextRefreshedEvent> {
	
	@Autowired
    private UpmsDictService upmsDictService;
	/**
	 * 加载字典数据，将其写入redis缓存
	 */
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		UpmsDictExample example = new UpmsDictExample();
		System.out.println("spring初始化开始======================>");
	        if (event.getApplicationContext().getParent() == null) {//root application context 没有parent，他就是老大.
	            System.out.println("启动upmsDictService的方法进行字典数据加载======================>");
	            try{
	            	System.out.println("第一次执行");
	            	example.or().andDelFlagEqualTo(ToolUtil.AVAILABLE);
	            	List<UpmsDict> rows = upmsDictService.selectByExample(example);
	            	System.out.println(rows.size());
	            	int len = 0;
	            	if(rows != null){
	            		JSONObject object = new JSONObject();
	            		len = rows.size();
	            		for(int i = 0; i < len; i++){
	            			Jedis jedis = RedisUtil.getJedis();
	            			if(null == jedis.get(ToolUtil.ZHENG_UPMS_DICT + "_" + rows.get(i).getType())){
	            				object.clear();
	            				object.put(rows.get(i).getValue(), rows.get(i).getLabel());
	            				jedis.set(ToolUtil.ZHENG_UPMS_DICT + "_" + rows.get(i).getType(),object.toString());
	            			}else{
	            				object.clear();
	            				object = JSONObject.parseObject(jedis.get(ToolUtil.ZHENG_UPMS_DICT + "_" + rows.get(i).getType()));
	            				object.put(rows.get(i).getValue(), rows.get(i).getLabel());
	            				jedis.set(ToolUtil.ZHENG_UPMS_DICT + "_" + rows.get(i).getType(), object.toString());
	            			}
	            		}
	            	}
	            }catch(Exception e){
	            	System.out.println("第一次执行出错");
	            	e.printStackTrace();
	            }
	        } else {
	            //为什么会执行两次：请参考博文：http://www.cnblogs.com/yucongblog/p/5437744.html
	            System.out.println("spring初始化时,执行onApplicationEvent:event.getApplicationContext().getParent() != null======================>");
	            try{
	            	System.out.println("第二次执行");
	            	List<UpmsDict> rows = upmsDictService.selectByExample(example);
	            	System.out.println(rows.size());
	            }catch(Exception e){
	            	System.out.println("第二次执行出错");
	            	e.printStackTrace();
	            }
	        }
	        System.out.println("YYCC:END:spring初始化完毕======================>");
	}
}

