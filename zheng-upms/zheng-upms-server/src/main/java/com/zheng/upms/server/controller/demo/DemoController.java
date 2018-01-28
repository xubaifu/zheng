package com.zheng.upms.server.controller.demo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zheng.common.base.BaseController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
@Controller
@Api(value = "DEMO", description = "DEMO")
@RequestMapping("/demo")
public class DemoController extends BaseController{
	@ApiOperation(value = "demo")
    //@RequiresPermissions("upms:demo:index")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "/manage/demo/template.jsp";
    }
	
	@ApiOperation(value = "ueditor")
    //@RequiresPermissions("upms:demo:index")
    @RequestMapping(value = "/ueditor", method = RequestMethod.GET)
    public String ueditor() {
        return "/manage/demo/ueditor.jsp";
    }
	
	@ApiOperation(value = "select")
    //@RequiresPermissions("upms:demo:index")
    @RequestMapping(value = "/select", method = RequestMethod.GET)
    public String select() {
        return "/manage/demo/select.jsp";
    }
	
	
	@ApiOperation(value = "编制首页")
    //@RequiresPermissions("upms:demo:index")
    @RequestMapping(value = "/getData", method = RequestMethod.GET)
	@ResponseBody
    public Object getData() {
        List<DemoEntity> list = new ArrayList<DemoEntity>();
        for(int i = 0; i<5;i++){
        	DemoEntity demoEntity = new DemoEntity();
        	demoEntity.setLevel((i+1)+"级");
        	demoEntity.setMideaNum(Math.round(Math.random()+10)+"");
        	demoEntity.setMideaPercent(Math.round(Math.random()+10)+"");
        	demoEntity.setName("测试组");
        	demoEntity.setPanasonicNum(Math.round(Math.random()+10)+"");
        	demoEntity.setPanasonicPercent(Math.round(Math.random()+10)+"");
        	list.add(demoEntity);
        }
        /*for(int i = 0; i<2;i++){
        	DemoEntity demoEntity = new DemoEntity();
        	demoEntity.setLevel("2");
        	demoEntity.setMideaNum(Math.round(Math.random()*10)+"");
        	demoEntity.setMideaPercent(Math.round(Math.random()*10)+"");
        	demoEntity.setName("测试组");
        	demoEntity.setPanasonicNum(Math.round(Math.random()*10)+"");
        	demoEntity.setPanasonicPercent(Math.round(Math.random()*10)+"");
        	list.add(demoEntity);
        }*/
        Map<String, Object> result = new HashMap<>();
        result.put("rows", list);
        result.put("total", list.size());
        return result;
    }
	public static List<Object> getDictList(String type){
		System.out.println("hsjadg");
		System.out.println(type);
		return null;
	}
}
