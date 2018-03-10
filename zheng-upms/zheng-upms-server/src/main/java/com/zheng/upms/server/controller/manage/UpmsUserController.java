package com.zheng.upms.server.controller.manage;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baidu.unbiz.fluentvalidator.ComplexResult;
import com.baidu.unbiz.fluentvalidator.FluentValidator;
import com.baidu.unbiz.fluentvalidator.ResultCollectors;
import com.zheng.common.base.BaseController;
import com.zheng.common.util.MD5Util;
import com.zheng.common.validator.LengthValidator;
import com.zheng.common.validator.NotNullValidator;
import com.zheng.upms.common.constant.ToolUtil;
import com.zheng.upms.common.constant.UpmsResult;
import com.zheng.upms.common.constant.UpmsResultConstant;
import com.zheng.upms.dao.model.SysColumnInfo;
import com.zheng.upms.dao.model.SysColumnInfoExample;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTableinfoExample;
import com.zheng.upms.dao.model.SysTemplateTable;
import com.zheng.upms.dao.model.TPositionOrganizationUser;
import com.zheng.upms.dao.model.TPositionOrganizationUserExample;
import com.zheng.upms.dao.model.UpmsOrganization;
import com.zheng.upms.dao.model.UpmsOrganizationExample;
import com.zheng.upms.dao.model.UpmsRole;
import com.zheng.upms.dao.model.UpmsRoleExample;
import com.zheng.upms.dao.model.UpmsUser;
import com.zheng.upms.dao.model.UpmsUserExample;
import com.zheng.upms.dao.model.UpmsUserOrganization;
import com.zheng.upms.dao.model.UpmsUserOrganizationExample;
import com.zheng.upms.dao.model.UpmsUserRole;
import com.zheng.upms.dao.model.UpmsUserRoleExample;
import com.zheng.upms.rpc.api.SysColumnInfoService;
import com.zheng.upms.rpc.api.SysTableinfoService;
import com.zheng.upms.rpc.api.SysTemplateTableService;
import com.zheng.upms.rpc.api.TPositionOrganizationUserService;
import com.zheng.upms.rpc.api.UpmsOrganizationService;
import com.zheng.upms.rpc.api.UpmsRoleService;
import com.zheng.upms.rpc.api.UpmsUserOrganizationService;
import com.zheng.upms.rpc.api.UpmsUserPermissionService;
import com.zheng.upms.rpc.api.UpmsUserRoleService;
import com.zheng.upms.rpc.api.UpmsUserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 用户controller
 * Created by shuzheng on 2017/2/6.
 */
@Controller
@Api(value = "用户管理", description = "用户管理")
@RequestMapping("/manage/user")
public class UpmsUserController extends BaseController {

    private static Logger _log = LoggerFactory.getLogger(UpmsUserController.class);

    @Autowired
    private UpmsUserService upmsUserService;

    @Autowired
    private UpmsRoleService upmsRoleService;

    @Autowired
    private UpmsOrganizationService upmsOrganizationService;

    @Autowired
    private UpmsUserOrganizationService upmsUserOrganizationService;

    @Autowired
    private UpmsUserRoleService upmsUserRoleService;

    @Autowired
    private UpmsUserPermissionService upmsUserPermissionService;
    
    @Autowired
    private TPositionOrganizationUserService tPositionOrganizationUserService;
    
    @Autowired
    private SysTemplateTableService sysTemplateTableService;
    
    @Autowired
    private SysColumnInfoService sysColumnInfoService;
    
    @Autowired
    private SysTableinfoService sysTableinfoService;

    @ApiOperation(value = "用户首页")
    @RequiresPermissions("upms:user:read")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "/manage/user/index.jsp";
    }

    @ApiOperation(value = "用户组织")
    @RequiresPermissions("upms:user:organization")
    @RequestMapping(value = "/organization/{id}", method = RequestMethod.GET)
    public String organization(@PathVariable("id") String id, ModelMap modelMap) {
        // 所有组织
        List<UpmsOrganization> upmsOrganizations = upmsOrganizationService.selectByExample(new UpmsOrganizationExample());
        // 用户拥有组织
        UpmsUserOrganizationExample upmsUserOrganizationExample = new UpmsUserOrganizationExample();
        upmsUserOrganizationExample.createCriteria()
                .andUserIdEqualTo(id);
        List<UpmsUserOrganization> upmsUserOrganizations = upmsUserOrganizationService.selectByExample(upmsUserOrganizationExample);
        modelMap.put("upmsOrganizations", upmsOrganizations);
        modelMap.put("upmsUserOrganizations", upmsUserOrganizations);
        return "/manage/user/organization.jsp";
    }

    @ApiOperation(value = "用户组织")
    @RequiresPermissions("upms:user:organization")
    @RequestMapping(value = "/organization/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object organization(@PathVariable("id") String id, HttpServletRequest request) {
        String[] organizationIds = request.getParameterValues("organizationId");
        upmsUserOrganizationService.organization(organizationIds, id);
        return new UpmsResult(UpmsResultConstant.SUCCESS, "");
    }

    @ApiOperation(value = "用户角色")
    @RequiresPermissions("upms:user:role")
    @RequestMapping(value = "/role/{id}", method = RequestMethod.GET)
    public String role(@PathVariable("id") String id, ModelMap modelMap) {
        // 所有角色
        List<UpmsRole> upmsRoles = upmsRoleService.selectByExample(new UpmsRoleExample());
        // 用户拥有角色
        UpmsUserRoleExample upmsUserRoleExample = new UpmsUserRoleExample();
        upmsUserRoleExample.createCriteria()
                .andUserIdEqualTo(id);
        List<UpmsUserRole> upmsUserRoles = upmsUserRoleService.selectByExample(upmsUserRoleExample);
        modelMap.put("upmsRoles", upmsRoles);
        modelMap.put("upmsUserRoles", upmsUserRoles);
        return "/manage/user/role.jsp";
    }

    @ApiOperation(value = "用户角色")
    @RequiresPermissions("upms:user:role")
    @RequestMapping(value = "/role/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object role(@PathVariable("id") String id, HttpServletRequest request) {
        String[] roleIds = request.getParameterValues("roleId");
        upmsUserRoleService.role(roleIds, id);
        return new UpmsResult(UpmsResultConstant.SUCCESS, "");
    }

    @ApiOperation(value = "用户权限")
    @RequiresPermissions("upms:user:permission")
    @RequestMapping(value = "/permission/{id}", method = RequestMethod.GET)
    public String permission(@PathVariable("id") String id, ModelMap modelMap) {
        UpmsUser user = upmsUserService.selectByPrimaryKeyString(id);
        modelMap.put("user", user);
        return "/manage/user/permission.jsp";
    }

    @ApiOperation(value = "用户权限")
    @RequiresPermissions("upms:user:permission")
    @RequestMapping(value = "/permission/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object permission(@PathVariable("id") String id, HttpServletRequest request) {
        JSONArray datas = JSONArray.parseArray(request.getParameter("datas"));
        upmsUserPermissionService.permission(datas, id);
        return new UpmsResult(UpmsResultConstant.SUCCESS, datas.size());
    }

    @ApiOperation(value = "用户列表")
    @RequiresPermissions("upms:user:read")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(
            @RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
            @RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
            @RequestParam(required = false, defaultValue = "", value = "search") String search,
            @RequestParam(required = false, value = "sort") String sort,
            @RequestParam(required = false, value = "order") String order) {
        UpmsUserExample upmsUserExample = new UpmsUserExample();
        if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
            upmsUserExample.setOrderByClause(sort + " " + order);
        }
        if (StringUtils.isNotBlank(search)) {
            upmsUserExample.or()
                    .andRealnameLike("%" + search + "%");
            upmsUserExample.or()
                    .andUsernameLike("%" + search + "%");
        }
        List<UpmsUser> rows = upmsUserService.selectByExampleForOffsetPage(upmsUserExample, offset, limit);
        long total = upmsUserService.countByExample(upmsUserExample);
        Map<String, Object> result = new HashMap<>();
        result.put("rows", rows);
        result.put("total", total);
        return result;
    }

//    @ApiOperation(value = "新增用户")
//    @RequiresPermissions("upms:user:create")
//    @RequestMapping(value = "/create", method = RequestMethod.GET)
//    public String create(ModelMap modelMap) {
//        List<UpmsOrganization> upmsOrganizations = upmsOrganizationService.selectByExample(new UpmsOrganizationExample());
//        modelMap.put("upmsOrganizations", upmsOrganizations);
//        return "/manage/user/create.jsp";
//    }

    @ApiOperation(value = "新增用户")
    @RequiresPermissions("upms:user:create")
    @ResponseBody
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Object create(UpmsUser upmsUser,@RequestParam String orgs) {
    	
        ComplexResult result = FluentValidator.checkAll()
                .on(upmsUser.getUsername(), new LengthValidator(1, 20, "帐号"))
                .on(upmsUser.getPassword(), new LengthValidator(5, 32, "密码"))
                .on(upmsUser.getRealname(), new NotNullValidator("姓名"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new UpmsResult(UpmsResultConstant.INVALID_LENGTH, result.getErrors());
        }
        long time = System.currentTimeMillis();
        upmsUser.setUserId(UUID.randomUUID().toString());
        String salt = UUID.randomUUID().toString().replaceAll("-", "");
        upmsUser.setSalt(salt);
        upmsUser.setPassword(MD5Util.MD5(upmsUser.getPassword() + upmsUser.getSalt()));
        upmsUser.setCtime(time);
        upmsUser = upmsUserService.createUser(upmsUser);
        if (null == upmsUser) {
            return new UpmsResult(UpmsResultConstant.FAILED, "帐号名已存在！");
        }else{
        	String userId = upmsUser.getUserId();
        	try {
				JSONArray array = JSONArray.parseArray(orgs);
				for(Object obj : array){
					TPositionOrganizationUser tpou = new TPositionOrganizationUser();
					JSONObject jo = (JSONObject)obj;
					tpou.setOrganizationId(jo.getString("organizationId"));
					tpou.setIsPrimary(jo.getBoolean("isPrimary"));
					tpou.setUserId(userId);
					tpou.setUpdateTime(new Date());
					tPositionOrganizationUserService.insert(tpou);
				}
			} catch (Exception e) {
				_log.error("新增用户组织失败!");
				e.printStackTrace();
			}
        }
        _log.info("新增用户，主键：userId={}", upmsUser.getUserId());
        return new UpmsResult(UpmsResultConstant.SUCCESS, 1);
    }

    @ApiOperation(value = "删除用户")
    @RequiresPermissions("upms:user:delete")
    @RequestMapping(value = "/delete/{ids}",method = RequestMethod.GET)
    @ResponseBody
    public Object delete(@PathVariable("ids") String ids) {
        int count = upmsUserService.deleteByPrimaryKeys(ids);
        if(count>0){
        	String[] idArray = ids.split(",");
        	for(String id : idArray){
        		TPositionOrganizationUserExample eg = new TPositionOrganizationUserExample();
                eg.createCriteria().andUserIdEqualTo(id);
                tPositionOrganizationUserService.deleteByExample(eg);
        	}
        }
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
//    @ApiOperation(value = "修改用户")
//    @RequiresPermissions("upms:user:update")
//    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
//    public String update(@PathVariable("id") String id, ModelMap modelMap) {
//        UpmsUser user = upmsUserService.selectByPrimaryKeyString(id);
//        modelMap.put("user", user);
//        
//        List<UpmsOrganization> upmsOrganizations = upmsOrganizationService.selectByExample(new UpmsOrganizationExample());
//        modelMap.put("upmsOrganizations", upmsOrganizations);
//        
//        TPositionOrganizationUserExample eg = new TPositionOrganizationUserExample();
//        eg.createCriteria().andUserIdEqualTo(id);
//        JSONArray ja = new JSONArray();
//        List<TPositionOrganizationUser> list = tPositionOrganizationUserService.selectByExample(eg);
//        if(list.size()>0){
//        	for(TPositionOrganizationUser o : list){
//        		JSONObject jo = new JSONObject();
//        		jo.put("id", o.getId());
//        		jo.put("organizationId", o.getOrganizationId());
//        		jo.put("isPrimary",o.getIsPrimary());
//        		ja.add(jo);
//        	}
//        	modelMap.put("orglist", ja.toJSONString());
//        }else{
//        	modelMap.put("orglist", "[]");
//        }
//        return "/manage/user/update.jsp";
//    }
    
    @ApiOperation(value = "修改用户")
    @RequiresPermissions("upms:user:update")
    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Object details(@PathVariable("id") String id, ModelMap modelMap) {
        UpmsUser user = upmsUserService.selectByPrimaryKeyString(id);
        modelMap.put("user", user);
        
        List<UpmsOrganization> upmsOrganizations = upmsOrganizationService.selectByExample(new UpmsOrganizationExample());
        modelMap.put("upmsOrganizations", upmsOrganizations);
        
        TPositionOrganizationUserExample eg = new TPositionOrganizationUserExample();
        eg.createCriteria().andUserIdEqualTo(id);
        JSONArray ja = new JSONArray();
        List<TPositionOrganizationUser> list = tPositionOrganizationUserService.selectByExample(eg);
        if(list.size()>0){
        	for(TPositionOrganizationUser o : list){
        		JSONObject jo = new JSONObject();
        		jo.put("id", o.getId());
        		jo.put("organizationId", o.getOrganizationId());
        		jo.put("isPrimary",o.getIsPrimary());
        		ja.add(jo);
        	}
        	modelMap.put("orglist", ja.toJSONString());
        }else{
        	modelMap.put("orglist", "[]");
        }
        return new UpmsResult(UpmsResultConstant.SUCCESS, modelMap);
    }

    @ApiOperation(value = "修改用户")
    @RequiresPermissions("upms:user:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@PathVariable("id") String id, UpmsUser upmsUser,@RequestParam String orgs) {
        ComplexResult result = FluentValidator.checkAll()
                .on(upmsUser.getUsername(), new LengthValidator(1, 20, "帐号"))
                .on(upmsUser.getRealname(), new NotNullValidator("姓名"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new UpmsResult(UpmsResultConstant.INVALID_LENGTH, result.getErrors());
        }
        // 不允许直接改密码
        upmsUser.setPassword(null);
        upmsUser.setUserId(id);
        int count = upmsUserService.updateByPrimaryKeySelective(upmsUser);
        if(count>0){
        	//Update TPositionOrganizationUser after user is updated
        	try {
        		//1.remove by userId
        		TPositionOrganizationUserExample eg = new TPositionOrganizationUserExample();
                eg.createCriteria().andUserIdEqualTo(id);
                tPositionOrganizationUserService.deleteByExample(eg);
                //2.Insert new records
				JSONArray array = JSONArray.parseArray(orgs);
				for(Object obj : array){
					TPositionOrganizationUser tpou = new TPositionOrganizationUser();
					JSONObject jo = (JSONObject)obj;
					tpou.setId(jo.getInteger("id"));
					tpou.setOrganizationId(jo.getString("organizationId"));
					tpou.setIsPrimary(jo.getBoolean("isPrimary"));
					tpou.setUserId(id);
					tpou.setUpdateTime(new Date());
					tPositionOrganizationUserService.insert(tpou);
				}
			} catch (Exception e) {
				_log.error("新增用户组织失败!");
				e.printStackTrace();
			}
        }
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }

    @ApiOperation(value = "添加子集(创建子集表)")
    @RequiresPermissions("upms:user:createSubset")
    @RequestMapping(value = "/createSubsetTable", method = RequestMethod.GET)
    public String createSubsetTable() {
        return "/manage/user/subset.jsp";
    }
    
    @ApiOperation(value = "创建子集")
    @RequiresPermissions("upms:user:createSubset")
    @ResponseBody
    @RequestMapping(value = "/insertSubsetTableData", method = RequestMethod.POST)
    public Object insertSubsetTableData(SysTableinfo sysTableinfo) {
    	sysTableinfo.setType(ToolUtil.PERSONNEL_SUBSET_TYPE);
    	int count = sysTemplateTableService.createSubsetTable(sysTableinfo);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "获取相关子集信息")
    @RequiresPermissions("upms:user:read")
    @RequestMapping(value = "/getSysTableinfo", method = RequestMethod.GET)
    @ResponseBody
    public Object getSysTableinfo(
    		@RequestParam(required = false, value = "type") String type
    		) {
    	SysTableinfoExample sysTableinfoExample = new SysTableinfoExample();
    	SysTableinfoExample.Criteria criteria=sysTableinfoExample.createCriteria();  
    	Map<String, Object> result = new HashMap<>();
    	//获取相关表
    	criteria.andTypeEqualTo(ToolUtil.PERSONNEL_SUBSET_TYPE);
    	criteria.andAvailableEqualTo(ToolUtil.AVAILABLE);
    	List<SysTableinfo> rows = sysTableinfoService.selectByExample(sysTableinfoExample);
    	result.put("rows", rows);
        return result;
    }
    
    @ApiOperation(value = "获取子集相关列信息")
    @RequiresPermissions("upms:user:read")
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
    	//criteria.andTypeEqualTo(type);
    	criteria.andTypeEqualTo(ToolUtil.PERSONNEL_SUBSET_TYPE);
    	criteria.andTableNameEqualTo(tableName);
    	criteria.andAvailableEqualTo(ToolUtil.AVAILABLE);
    	
    	List<SysColumnInfo> rows = sysColumnInfoService.selectByExample(sysColumnInfoExample);
    	result.put("rows", rows);
    	return result;
    }
    
    @ApiOperation(value = "新增子集属性")
    @RequiresPermissions("upms:user:createSubset")
    @RequestMapping(value = "/createSubsetColumn", method = RequestMethod.GET)
    public String createSubsetColumn() {
        return "/manage/user/subsetColumn.jsp";
    }
    
    @ApiOperation(value = "新增子集属性")
    @RequiresPermissions("upms:user:createSubset")
    @ResponseBody
    @RequestMapping(value = "/insertSubsetColumnData", method = RequestMethod.POST)
    public Object insertSubsetColumnData(SysColumnInfo sysColumnInfo) {
    	sysColumnInfo.setId(UUID.randomUUID().toString());
    	sysColumnInfo.setAvailable(ToolUtil.AVAILABLE);
    	sysColumnInfo.setType(ToolUtil.PERSONNEL_SUBSET_TYPE);
    	sysColumnInfo.setCreatetime(ToolUtil.getCurrentTime());
    	int count = sysColumnInfoService.insert(sysColumnInfo);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "添加子集(表单数据)")
    @RequiresPermissions("upms:user:createSubset")
    @RequestMapping(value = "/createSubsetForm", method = RequestMethod.GET)
    public String createSubsetForm() {
        return "/manage/user/subsetForm.jsp";
    }
    
    @ApiOperation(value = "添加子集数据")
    @RequiresPermissions("upms:user:createSubset")
    @ResponseBody
    @RequestMapping(value = "/insertSubsetData/{tableName}/{userId}", method = RequestMethod.POST)
    public Object insertSubsetData(@PathVariable("tableName") String tableName, @PathVariable("userId") String userId, @RequestParam("data") String data) {
    	int count = sysTemplateTableService.insertSubsetData(tableName, userId, data, ToolUtil.PERSONNEL_SUBSET_TYPE);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    /**
     * 获取子集相关数据信息(数据库数据库分页实现)
     * @param offset
     * @param limit
     * @param search
     * @param tableName
     * @param subId
     * @return
     */
    @ApiOperation(value = "获取子集相关数据信息(数据库数据库分页实现)")
    @RequiresPermissions("upms:user:read")
    @RequestMapping(value = "/getDataInfoPage", method = RequestMethod.GET)
    @ResponseBody
    public Object getDataInfoPage(
    		@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
            @RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
            @RequestParam(required = false, defaultValue = "", value = "search") String search,
    		@RequestParam(required = false, value = "tableName") String tableName,
    		@RequestParam(required = false, value = "subId") String subId,
    		@RequestParam(required = false, value = "userId") String userId
    		){
    	Map<String, Object> result = new HashMap<>();
    	Map<String, Object> params = new HashMap<>();
    	//添加查询条件
    	params.put("subId", subId);
    	params.put("tableName", tableName);
    	params.put("search", search);
    	params.put("limit", limit);
    	params.put("offset", offset);
    	params.put("available", ToolUtil.AVAILABLE);
    	params.put("type", ToolUtil.PERSONNEL_SUBSET_TYPE);
    	params.put("userId", userId);
    	//获取行数
    	int count = sysTemplateTableService.getDataInfoPageCount(params);
    	//获取具体的数据信息
    	List<SysTemplateTable> resultList = sysTemplateTableService.getDataInfoPage(params);
    	int len = resultList.size();
    	Object[] resultArr = null;
    	//将获取的数据处理成map形式
    	if(len != 0){
        	resultArr = new Object[len];
        	for(int i = 0; i < len; i++){
        		String[] properties = resultList.get(i).getProperty().split(",");
        		Map<String, Object> mapResult = new HashMap<String, Object>();
        		String[] values = resultList.get(i).getValue().split(",");
        		for(int j = 0; j < values.length; j++){
        			mapResult.put(properties[j], values[j]);
        			mapResult.put("subId", resultList.get(i).getSubId());
        		}
        		resultArr[i] = mapResult;
        	}
        	
    	}
    	result.put("rows", resultArr==null?(new Object[0]):resultArr);
    	result.put("total", count);//条件查询后，带有条件的总行数=总行数-条件过滤掉的行数
    	return result;
    }
    
    
    
    @ApiOperation(value = "修改子集数据")
    @RequiresPermissions("upms:user:createSubset")
    @ResponseBody
    @RequestMapping(value = "/updateSubsetData/{tableName}/{subId}", method = RequestMethod.POST)
    public Object updateSubsetData(@PathVariable("tableName") String tableName, @PathVariable("subId") String subId, @RequestParam("data") String data) {
    	int count = sysTemplateTableService.updateSubsetData(tableName, subId, data, ToolUtil.PERSONNEL_SUBSET_TYPE);
        
    	return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "删除子集数据")
    @RequiresPermissions("upms:user:createSubset")
    @ResponseBody
    @RequestMapping(value = "/deletebsetData/{tableName}/{subId}", method = RequestMethod.GET)
    public Object deletebsetData(@PathVariable("tableName") String tableName, @PathVariable("subId") String ids) {
    	int count = sysTemplateTableService.deleteSubsetData(tableName, ids, ToolUtil.PERSONNEL_SUBSET_TYPE);
    	
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
}
