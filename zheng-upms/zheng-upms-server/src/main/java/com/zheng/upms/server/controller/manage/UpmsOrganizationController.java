package com.zheng.upms.server.controller.manage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.unbiz.fluentvalidator.ComplexResult;
import com.baidu.unbiz.fluentvalidator.FluentValidator;
import com.baidu.unbiz.fluentvalidator.ResultCollectors;
import com.zheng.common.base.BaseController;
import com.zheng.common.validator.LengthValidator;
import com.zheng.upms.common.constant.ToolUtil;
import com.zheng.upms.common.constant.UpmsResult;
import com.zheng.upms.common.constant.UpmsResultConstant;
import com.zheng.upms.dao.model.SysColumnInfo;
import com.zheng.upms.dao.model.SysColumnInfoExample;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTableinfoExample;
import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.TDeptUuid;
import com.zheng.upms.dao.model.TDeptUuidExample;
import com.zheng.upms.dao.model.UpmsOrganization;
import com.zheng.upms.dao.model.UpmsOrganizationExample;
import com.zheng.upms.rpc.api.SysColumnInfoService;
import com.zheng.upms.rpc.api.SysTableinfoService;
import com.zheng.upms.rpc.api.SysTemplateTableService;
import com.zheng.upms.rpc.api.TDeptUuidService;
import com.zheng.upms.rpc.api.UpmsOrganizationService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 组织controller
 * Created by shuzheng on 2017/2/6.
 */
@Controller
@Api(value = "组织管理", description = "组织管理")
@RequestMapping("/manage/organization")
public class UpmsOrganizationController extends BaseController {

    private static Logger _log = LoggerFactory.getLogger(UpmsOrganizationController.class);

    @Autowired
    private UpmsOrganizationService upmsOrganizationService;
    @Autowired
    private TDeptUuidService tDeptUuidService;
    @Autowired
    private SysColumnInfoService sysColumnInfoService;
    @Autowired
    private SysTableinfoService sysTableinfoService;
    @Autowired
    private SysTemplateTableService sysTemplateTableService;

    @ApiOperation(value = "组织首页")
    @RequiresPermissions("upms:organization:read")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "/manage/organization/index.jsp";
    }

    @ApiOperation(value = "组织列表")
    @RequiresPermissions("upms:organization:read")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(
            @RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
            @RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
            @RequestParam(required = false, defaultValue = "", value = "search") String search,
            @RequestParam(required = false, value = "sort") String sort,
            @RequestParam(required = false, value = "order") String order,
            @RequestParam(required = false, value = "id") String id) {
        UpmsOrganizationExample upmsOrganizationExample = new UpmsOrganizationExample();
        if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
            upmsOrganizationExample.setOrderByClause(sort + " " + order);
        }
        if (StringUtils.isNotBlank(search)) {
            upmsOrganizationExample.or()
                    .andNameLike("%" + search + "%");
        }
        if (StringUtils.isNotBlank(id)) {
        	//upmsOrganizationExample.or().andPidEqualTo(Integer.valueOf(id));
        	upmsOrganizationExample.or().andOrganizationIdEqualTo(id);
        }
        List<UpmsOrganization> rows = upmsOrganizationService.selectByExampleForOffsetPage(upmsOrganizationExample, offset, limit);
        long total = upmsOrganizationService.countByExample(upmsOrganizationExample);
        Map<String, Object> result = new HashMap<>();
        result.put("rows", rows);
        result.put("total", total);
        return result;
    }
    
    @ApiOperation(value = "所有组织列表")
    @RequiresPermissions("upms:organization:read")
    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    @ResponseBody
    public Object listAll() {
        UpmsOrganizationExample upmsOrganizationExample = new UpmsOrganizationExample();
 
        List<UpmsOrganization> rows = upmsOrganizationService.selectByExample(upmsOrganizationExample);
        //long total = upmsOrganizationService.countByExample(upmsOrganizationExample);
        Map<String, Object> result = new HashMap<>();
        result.put("rows", rows);
        //result.put("total", total);
        return result;
    }

    @ApiOperation(value = "新增组织")
    @RequiresPermissions("upms:organization:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create() {
        return "/manage/organization/create.jsp";
    }

    @ApiOperation(value = "新增组织")
    @RequiresPermissions("upms:organization:create")
    @ResponseBody
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Object create(UpmsOrganization upmsOrganization) {
        ComplexResult result = FluentValidator.checkAll()
                .on(upmsOrganization.getName(), new LengthValidator(1, 20, "名称"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new UpmsResult(UpmsResultConstant.INVALID_LENGTH, result.getErrors());
        }
        long time = System.currentTimeMillis();
        String organizationId = UUID.randomUUID().toString();
        String deptId = UUID.randomUUID().toString();
        upmsOrganization.setOrganizationId(organizationId);
        upmsOrganization.setCtime(time);
        upmsOrganization.setDeptId(deptId);
        //TDeptUuid tDeptUuid = new TDeptUuid();
        //向部门信息主键存储表中存入业务主键信息
        /*tDeptUuid.setId(UUID.randomUUID().toString());
        tDeptUuid.setDeptId(deptId);
        tDeptUuidService.insert(tDeptUuid);*/
        
        int count = upmsOrganizationService.insertSelective(upmsOrganization);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }

    @ApiOperation(value = "删除组织")
    @RequiresPermissions("upms:organization:delete")
    @RequestMapping(value = "/delete/{ids}",method = RequestMethod.GET)
    @ResponseBody
    public Object delete(@PathVariable("ids") String ids) {
        int count = upmsOrganizationService.deleteByPrimaryKeys(ids);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }

    @ApiOperation(value = "修改组织")
    @RequiresPermissions("upms:organization:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") String id, ModelMap modelMap) {
        UpmsOrganization organization = upmsOrganizationService.selectByPrimaryKeyString(id);
        modelMap.put("organization", organization);
        return "/manage/organization/update.jsp";
    }

    @ApiOperation(value = "修改组织")
    @RequiresPermissions("upms:organization:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@PathVariable("id") String id, UpmsOrganization upmsOrganization) {
        ComplexResult result = FluentValidator.checkAll()
                .on(upmsOrganization.getName(), new LengthValidator(1, 20, "名称"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new UpmsResult(UpmsResultConstant.INVALID_LENGTH, result.getErrors());
        }
        upmsOrganization.setOrganizationId(id);
        int count = upmsOrganizationService.updateByPrimaryKeySelective(upmsOrganization);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    
    @ApiOperation(value = "获取相关子集信息")
    @RequiresPermissions("upms:organization:read")
    @RequestMapping(value = "/getSysTableinfo", method = RequestMethod.GET)
    @ResponseBody
    public Object getSysTableinfo(
    		@RequestParam(required = false, value = "type") String type
    		) {
        /*UpmsOrganizationExample upmsOrganizationExample = new UpmsOrganizationExample();
        
        List<UpmsOrganization> rows = upmsOrganizationService.selectByExample(upmsOrganizationExample);
        //long total = upmsOrganizationService.countByExample(upmsOrganizationExample);
        Map<String, Object> result = new HashMap<>();
        result.put("rows", rows);*/
        //result.put("total", total);
    	SysTableinfoExample sysTableinfoExample = new SysTableinfoExample();
    	SysTableinfoExample.Criteria criteria=sysTableinfoExample.createCriteria();  
    	Map<String, Object> result = new HashMap<>();
    	//获取相关表
//    	sysTableinfoExample.or().andTypeEqualTo(type);
//    	sysTableinfoExample.or().andAvailableEqualTo("0");
    	criteria.andTypeEqualTo(type);
    	criteria.andAvailableEqualTo(ToolUtil.AVAILABLE);
    	List<SysTableinfo> rows = sysTableinfoService.selectByExample(sysTableinfoExample);
    	result.put("rows", rows);
        return result;
    }
    
    @ApiOperation(value = "获取子集相关列信息")
    @RequiresPermissions("upms:organization:read")
    @RequestMapping(value = "/getSysColumnInfo", method = RequestMethod.GET)
    @ResponseBody
    public Object getSysColumnInfo(
    		@RequestParam(required = false, value = "type") String type,
    		@RequestParam(required = false, value = "tableName") String tableName
    		){
    	Map<String, Object> result = new HashMap<>();
    	//获取相关表对应列
    	SysColumnInfoExample sysColumnInfoExample = new SysColumnInfoExample();
    	SysColumnInfoExample.Criteria criteria=sysColumnInfoExample.createCriteria();  
    	criteria.andTypeEqualTo(type);
    	criteria.andTableNameEqualTo(tableName);
    	criteria.andAvailableEqualTo(ToolUtil.AVAILABLE);
    	
    	List<SysColumnInfo> rows = sysColumnInfoService.selectByExample(sysColumnInfoExample);
    	result.put("rows", rows);
    	return result;
    }
    
    
    @ApiOperation(value = "获取子集相关数据信息")
    @RequiresPermissions("upms:organization:read")
    @RequestMapping(value = "/getDataInfo", method = RequestMethod.GET)
    @ResponseBody
    public Object getDataInfo(
    		@RequestParam(required = false, value = "type") String type,
    		@RequestParam(required = false, value = "tableName") String tableName,
    		@RequestParam(required = false, value = "organizationId") String organizationId
    		){
    	Map<String, Object> result = new HashMap<>();
    	//获取部门信息主键存储表中的同类数据，以便在子集表中获取具体数据
    	TDeptUuidExample tDeptUuidExample = new TDeptUuidExample();
    	//此次需要添加条件
    	TDeptUuidExample.Criteria criteria=tDeptUuidExample.createCriteria();  
    	criteria.andDeptIdEqualTo(organizationId);
    	List<TDeptUuid> rows = tDeptUuidService.selectByExample(tDeptUuidExample);
    	
    	int len = rows.size();
    	
    	if(len == 0){
    		return null;
    	}
    	List<String> list = new ArrayList<String>();
    	for(int i = 0; i < len; i++){
    		//list.add(i, rows.get(i).getbId());
    		list.add(i, rows.get(i).getSubId());
    	}
    	//获取具体的数据信息
    	List<SysTemplateTable> resultList = sysTemplateTableService.getDataInfo(tableName, list);
    	len = resultList.size();
    	Object[] resultArr = null;
    	//将获取的数据处理成map形式
    	if(len != 0){
        	//String[] properties = resultList.get(0).getProperty().split(",");
        	resultArr = new Object[len];
        	for(int i = 0; i < len; i++){
        		String[] properties = resultList.get(i).getProperty().split(",");
        		Map<String, Object> mapResult = new HashMap<String, Object>();
        		String[] values = resultList.get(i).getValue().split(",");
        		for(int j = 0; j < properties.length; j++){
        			mapResult.put(properties[j], values[j]);
        		}
        		resultArr[i] = mapResult;
        	}
        	
    	}
    	result.put("rows", resultArr);
    	result.put("total", len);
    	return result;
    }
    
    @ApiOperation(value = "添加子集(表单数据)")
    @RequiresPermissions("upms:organization:createSubset")
    @RequestMapping(value = "/createSubsetForm", method = RequestMethod.GET)
    public String createSubsetForm() {
        return "/manage/organization/subsetForm.jsp";
    }
    
    @ApiOperation(value = "添加子集数据")
    @RequiresPermissions("upms:organization:createSubset")
    @ResponseBody
    @RequestMapping(value = "/insertSubsetData/{tableName}/{organizationId}", method = RequestMethod.POST)
    public Object insertSubsetData(@PathVariable("tableName") String tableName, @PathVariable("organizationId") String organizationId, @RequestParam("data") String data) {
    	int count = sysTemplateTableService.insertSubsetData(tableName, organizationId, data);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "添加子集(创建子集表)")
    @RequiresPermissions("upms:organization:createSubset")
    @RequestMapping(value = "/createSubsetTable", method = RequestMethod.GET)
    public String createSubsetTable() {
        return "/manage/organization/subset.jsp";
    }
    

    @ApiOperation(value = "创建子集")
    @RequiresPermissions("upms:organization:createSubset")
    @ResponseBody
    @RequestMapping(value = "/insertSubsetTableData", method = RequestMethod.POST)
    public Object insertSubsetTableData(SysTableinfo sysTableinfo) {
    	int count = sysTemplateTableService.createSubsetTable(sysTableinfo);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "新增子集属性")
    @RequiresPermissions("upms:organization:createSubset")
    @RequestMapping(value = "/createSubsetColumn", method = RequestMethod.GET)
    public String createSubsetColumn() {
        return "/manage/organization/subsetColumn.jsp";
    }
    
    @ApiOperation(value = "新增子集属性")
    @RequiresPermissions("upms:organization:createSubset")
    @ResponseBody
    @RequestMapping(value = "/insertSubsetColumnData", method = RequestMethod.POST)
    public Object insertSubsetColumnData(SysColumnInfo sysColumnInfo) {
    	sysColumnInfo.setId(UUID.randomUUID().toString());
    	sysColumnInfo.setAvailable(ToolUtil.AVAILABLE);
    	sysColumnInfo.setType(ToolUtil.ORGANIZATION_SUBSET_TYPE);
    	sysColumnInfo.setCreatetime(ToolUtil.getCurrentTime());
    	int count = sysColumnInfoService.insert(sysColumnInfo);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
}
