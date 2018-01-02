package com.zheng.upms.server.controller.manage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zheng.common.base.BaseController;
import com.zheng.upms.common.constant.UpmsResult;
import com.zheng.upms.common.constant.UpmsResultConstant;
import com.zheng.upms.dao.model.TPositionOrganization;
import com.zheng.upms.dao.model.TPositionOrganizationExample;
import com.zheng.upms.dao.model.UpmsOrganization;
import com.zheng.upms.dao.model.UpmsPosition;
import com.zheng.upms.rpc.api.TPositionOrganizationService;
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
	    
	    @Autowired
	    private TPositionOrganizationService tPositionOrganizationService;
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
	    
	    @ApiOperation(value = "根据部门获取岗位列表")
	    @RequiresPermissions("upms:position:read")
	    @RequestMapping(value = "/getPositionByOrg", method = RequestMethod.GET)
	    @ResponseBody
	    public Object getPositionByOrg(@RequestParam("organizationId")String organizationId,
	    		@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
	            @RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
	            @RequestParam(required = false, defaultValue = "", value = "search") String search) {
	    	Map<Object, Object> params = new HashMap<Object, Object>();
	    	//添加查询条件
	    	params.put("search", search);
	    	params.put("limit", limit);
	    	params.put("offset", offset);
	    	params.put("organizationId", organizationId);
	    	int count = upmsPositionService.getPositionByOrgCount(params);
	    	List<UpmsPosition> list = upmsPositionService.getPositionByOrg(params);
	    	Map<String, Object> result = new HashMap<>();
	    	result.put("rows", list);
	    	result.put("total", count);
	    	return result;
	    }
	    
	    @ApiOperation(value = "根据部门获取所有岗位列表")
	    @RequiresPermissions("upms:position:read")
	    @RequestMapping(value = "/getPositionByOrgAll", method = RequestMethod.GET)
	    @ResponseBody
	    public Object getPositionByOrgAll(String organizationId){
	    	TPositionOrganizationExample tPositionOrganizationExample = new TPositionOrganizationExample();
	    	
	    	TPositionOrganizationExample.Criteria criteria=tPositionOrganizationExample.createCriteria();
	    	criteria.andOrganizationIdEqualTo(organizationId);
	    	
	    	List<TPositionOrganization> list = tPositionOrganizationService.selectByExample(tPositionOrganizationExample);
	    	//List<UpmsPosition> list = upmsPositionService.getPositionByOrgAll(organizationId);
	    	return list;
	    }
	    
	    @ApiOperation(value = "根据岗位获取部门列表")
	    @RequiresPermissions("upms:position:read")
	    @RequestMapping(value = "/getOrgByPosition", method = RequestMethod.GET)
	    @ResponseBody
	    public Object getOrgByPosition(@RequestParam("positionId")String positionId,
	    		@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
	            @RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
	            @RequestParam(required = false, defaultValue = "", value = "search") String search) {
	    	Map<Object, Object> params = new HashMap<Object, Object>();
	    	//添加查询条件
	    	params.put("search", search);
	    	params.put("limit", limit);
	    	params.put("offset", offset);
	    	params.put("positionId", positionId);
	    	int count = upmsPositionService.getOrgByPositionCount(params);
	    	List<UpmsOrganization> list = upmsPositionService.getOrgByPosition(params);
	    	Map<String, Object> result = new HashMap<>();
	    	result.put("rows", list);
	    	result.put("total", count);
	    	return result;
	    }
	    
	    @ApiOperation(value = "根据岗位获取所有部门列表")
	    @RequiresPermissions("upms:position:read")
	    @RequestMapping(value = "/getOrgByPositionAll", method = RequestMethod.GET)
	    @ResponseBody
	    public Object getOrgByPositionAll(String positionId){
	    	TPositionOrganizationExample tPositionOrganizationExample = new TPositionOrganizationExample();
	    	
	    	TPositionOrganizationExample.Criteria criteria=tPositionOrganizationExample.createCriteria();
	    	criteria.andPositionIdEqualTo(positionId);
	    	
	    	List<TPositionOrganization> list = tPositionOrganizationService.selectByExample(tPositionOrganizationExample);
	    	return list;
	    }
	    
	    @ApiOperation(value = "删除岗位下的组织")
	    @RequiresPermissions("upms:position:delOrg")
	    @RequestMapping(value = "/deleteOrg/{positionId}/{orgIds}",method = RequestMethod.GET)
	    @ResponseBody
	    public Object deleteObj(@PathVariable("positionId") String positionId, @PathVariable("orgIds") String orgIds) {
	        int count = tPositionOrganizationService.deleteOrg(positionId, orgIds);
	        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
	    } 
	    
	    @ApiOperation(value = "删除组织下的岗位")
	    @RequiresPermissions("upms:position:delPosition")
	    @RequestMapping(value = "/deletePosition/{organizationId}/{positionIds}",method = RequestMethod.GET)
	    @ResponseBody
	    public Object deletePosition(@PathVariable("organizationId") String organizationId, @PathVariable("positionIds") String positionIds) {
	        int count = tPositionOrganizationService.deletePosition(organizationId, positionIds);
	        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
	    }  
}
