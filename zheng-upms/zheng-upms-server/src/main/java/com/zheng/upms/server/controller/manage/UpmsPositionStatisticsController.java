package com.zheng.upms.server.controller.manage;

import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.tribes.util.Arrays;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zheng.common.base.BaseController;
import com.zheng.upms.common.constant.UpmsResult;
import com.zheng.upms.common.constant.UpmsResultConstant;
import com.zheng.upms.dao.model.TPositionOrganization;
import com.zheng.upms.rpc.api.UpmsPositionService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 岗位controller
 * Created by shuzheng on 2017/2/6.
 */
@Controller
@Api(value = "岗位统计", description = "岗位统计")
@RequestMapping("/manage/positionStatistics")
public class UpmsPositionStatisticsController extends BaseController {
	 private static Logger _log = LoggerFactory.getLogger(UpmsPositionController.class);

	    @Autowired
	    private UpmsPositionService upmsPositionService;
	    /*@Autowired
	    private TPositionUuidService tPositionUuidService;*/
/*	    @Autowired
	    private SysColumnInfoService sysColumnInfoService;
	    @Autowired
	    private SysTableinfoService sysTableinfoService;
	    @Autowired
	    private SysTemplateTableService sysTemplateTableService;
	    @Autowired
	    private UpmsPositionHisService upmsPositionHisService;*/
	    
	    @ApiOperation(value = "岗位统计首页")
	    @RequiresPermissions("upms:position:read")
	    @RequestMapping(value = "/statisticsView", method = RequestMethod.GET)
	    public String index() {
	        return "/manage/position/statisticsView.jsp";
	    }
	    
	    @ApiOperation(value = "添加岗位")
	    @RequiresPermissions("upms:position:addPosition")
	    @RequestMapping(value = "/addPosition", method = RequestMethod.GET)
	    public String addPosition() {
	        return "/manage/position/addPosition.jsp";
	    }
	    
	    @ApiOperation(value = "添加岗位")
	    @RequiresPermissions("upms:position:addPosition")
	    @RequestMapping(value = "/addPosition", method = RequestMethod.POST)
	    @ResponseBody
	    public Object addPositionSubmit(@RequestParam("orgNodes") String orgNodes, @RequestParam("positionNodes") String positionNodes) {
	    	/*String[] orgNodesArr = orgNodes.split(",");
	    	String[] positionNodesArr = positionNodes.split(",");
	    	List<Object> list = new ArrayList<Object>();
	    	TPositionOrganization tPositionOrganization;
	    	for(int i = 0; i < orgNodesArr.length; i++){
	    		for(int j = 0; j < positionNodesArr.length; j++){
	    			tPositionOrganization = new TPositionOrganization();
	    			tPositionOrganization.setOrganizationId(orgNodesArr[i]);
	    			tPositionOrganization.setPositionId(positionNodesArr[j]);
	    			list.add(tPositionOrganization);
	    		}
	    	}*/
	    	int count = upmsPositionService.insertTPositionOrganization(orgNodes, positionNodes);
	    	return new UpmsResult(UpmsResultConstant.SUCCESS, count);
	    }
	    
	    @ApiOperation(value = "添加组织")
	    @RequiresPermissions("upms:position:addOrg")
	    @RequestMapping(value = "/addOrg", method = RequestMethod.GET)
	    public String addOrg() {
	        return "/manage/position/addOrg.jsp";
	    }
	    
	    @ApiOperation(value = "添加人员")
	    @RequiresPermissions("upms:position:addUser")
	    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
	    public String addUser() {
	        return "/manage/position/addUser.jsp";
	    }
}
