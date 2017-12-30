package com.zheng.upms.server.controller.manage;

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
import com.zheng.upms.dao.model.UpmsPosition;
import com.zheng.upms.dao.model.UpmsPositionExample;
import com.zheng.upms.dao.model.UpmsPositionHis;
import com.zheng.upms.rpc.api.SysColumnInfoService;
import com.zheng.upms.rpc.api.SysTableinfoService;
import com.zheng.upms.rpc.api.SysTemplateTableService;
import com.zheng.upms.rpc.api.UpmsPositionHisService;
import com.zheng.upms.rpc.api.UpmsPositionService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 岗位controller
 * Created by shuzheng on 2017/2/6.
 */
@Controller
@Api(value = "岗位管理", description = "岗位管理")
@RequestMapping("/manage/position")
public class UpmsPositionController extends BaseController {

    private static Logger _log = LoggerFactory.getLogger(UpmsPositionController.class);

    @Autowired
    private UpmsPositionService upmsPositionService;
    /*@Autowired
    private TPositionUuidService tPositionUuidService;*/
    @Autowired
    private SysColumnInfoService sysColumnInfoService;
    @Autowired
    private SysTableinfoService sysTableinfoService;
    @Autowired
    private SysTemplateTableService sysTemplateTableService;
    @Autowired
    private UpmsPositionHisService upmsPositionHisService;

    @ApiOperation(value = "岗位首页")
    @RequiresPermissions("upms:position:read")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "/manage/position/index.jsp";
    }

    @ApiOperation(value = "岗位列表")
    @RequiresPermissions("upms:position:read")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(
            @RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
            @RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
            @RequestParam(required = false, defaultValue = "", value = "search") String search,
            @RequestParam(required = false, value = "sort") String sort,
            @RequestParam(required = false, value = "order") String order,
            @RequestParam(required = false, value = "id") String id) {
        UpmsPositionExample upmsPositionExample = new UpmsPositionExample();
        if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
        	upmsPositionExample.setOrderByClause(sort + " " + order);
        }
        if (StringUtils.isNotBlank(search)) {
        	upmsPositionExample.or()
                    .andNameLike("%" + search + "%");
        }
        if (StringUtils.isNotBlank(id)) {
        	upmsPositionExample.or().andPidEqualTo(id);
        	upmsPositionExample.or().andPositionIdEqualTo(id);
        }
        List<UpmsPosition> rows = upmsPositionService.selectByExampleForOffsetPage(upmsPositionExample, offset, limit);
        long total = upmsPositionService.countByExample(upmsPositionExample);
        Map<String, Object> result = new HashMap<>();
        result.put("rows", rows);
        result.put("total", total);
        return result;
    }
    
    @ApiOperation(value = "根据ID获取岗位信息")
    @RequiresPermissions("upms:position:read")
    @RequestMapping(value = "/getPositionById", method = RequestMethod.GET)
    @ResponseBody
    public Object getPositionById(@RequestParam(required = false, value = "id") String id) {
    	UpmsPositionExample upmsPositionExample = new UpmsPositionExample();
    	UpmsPositionExample.Criteria criteria=upmsPositionExample.createCriteria();
    	criteria.andPositionIdEqualTo(id);
        List<UpmsPosition> rows = upmsPositionService.selectByExample(upmsPositionExample);
        UpmsPosition positionPar = new UpmsPosition();
        if(rows != null && rows.size() != 0){
        	String pid = rows.get(0).getPid();
        	if(pid != null && pid.length() != 0){
        		positionPar = upmsPositionService.selectByPrimaryKeyString(rows.get(0).getPid());
        	}else{
        		positionPar.setName("");
        		positionPar.setPositionId("");
        	}
        }
        Map<String, Object> result = new HashMap<>();
        result.put("rows", rows);
        result.put("positionPar", positionPar);
        return result;
    }
    
    @ApiOperation(value = "所有岗位列表")
    @RequiresPermissions("upms:position:read")
    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    @ResponseBody
    public Object listAll() {
    	UpmsPositionExample upmsPositionExample = new UpmsPositionExample();
        List<UpmsPosition> rows = upmsPositionService.selectByExample(upmsPositionExample);
        Map<String, Object> result = new HashMap<>();
        result.put("rows", rows);
        return result;
    }

    @ApiOperation(value = "新增岗位")
    @RequiresPermissions("upms:position:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create() {
        return "/manage/position/create.jsp";
    }

    @ApiOperation(value = "新增岗位")
    @RequiresPermissions("upms:position:create")
    @ResponseBody
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Object create(UpmsPosition upmsPosition) {
        ComplexResult result = FluentValidator.checkAll()
                .on(upmsPosition.getName(), new LengthValidator(1, 20, "名称"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new UpmsResult(UpmsResultConstant.INVALID_LENGTH, result.getErrors());
        }
        long time = System.currentTimeMillis();
        String organizationId = UUID.randomUUID().toString();
        //String deptId = UUID.randomUUID().toString();
        upmsPosition.setPositionId(organizationId);
        upmsPosition.setCtime(time);
        //upmsPosition.setPositionId(deptId);
        int count = upmsPositionService.insertSelective(upmsPosition);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }

    @ApiOperation(value = "删除岗位")
    @RequiresPermissions("upms:position:delete")
    @RequestMapping(value = "/delete/{ids}",method = RequestMethod.GET)
    @ResponseBody
    public Object delete(@PathVariable("ids") String ids) {
        int count = upmsPositionService.deleteByPrimaryKeys(ids);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }    
    
    @ApiOperation(value = "修改岗位")
    @RequiresPermissions("upms:position:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") String id, ModelMap modelMap) {
    	UpmsPosition upmsPosition = upmsPositionService.selectByPrimaryKeyString(id);
    	UpmsPosition upmsPositionPar = new UpmsPosition();
        if(upmsPosition.getPid() != null && upmsPosition.getPid().length() != 0){
        	upmsPositionPar = upmsPositionService.selectByPrimaryKeyString(upmsPosition.getPid());
        }
        modelMap.put("position", upmsPosition);
        modelMap.put("positionPar", upmsPositionPar);
        return "/manage/position/update.jsp";
    }

    @ApiOperation(value = "修改岗位")
    @RequiresPermissions("upms:position:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@PathVariable("id") String id, UpmsPosition upmsPosition) {
        ComplexResult result = FluentValidator.checkAll()
                .on(upmsPosition.getName(), new LengthValidator(1, 20, "名称"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new UpmsResult(UpmsResultConstant.INVALID_LENGTH, result.getErrors());
        }
        long time = System.currentTimeMillis();
        //保存历史数据
        UpmsPosition position = upmsPositionService.selectByPrimaryKeyString(id);
        UpmsPositionHis upmsPositionHis = new UpmsPositionHis();
        upmsPositionHis.setId(UUID.randomUUID().toString());
        upmsPositionHis.setCtime(time);
        //upmsPositionHis.setPositionId(position.getPositionId());
        upmsPositionHis.setDescription(position.getDescription());
        upmsPositionHis.setName(position.getName());
        upmsPositionHis.setPositionCode(position.getPositionCode());
        upmsPositionHis.setPositionId(position.getPositionId());
        upmsPositionHis.setPid(position.getPid());
        upmsPositionHisService.insert(upmsPositionHis);
        //修改
        upmsPosition.setCtime(time);
        upmsPosition.setPositionId(id);
        int count = upmsPositionService.updateByPrimaryKeySelective(upmsPosition);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    } 
    
    @ApiOperation(value = "添加子集(创建子集表)")
    @RequiresPermissions("upms:position:createSubset")
    @RequestMapping(value = "/createSubsetTable", method = RequestMethod.GET)
    public String createSubsetTable() {
        return "/manage/position/subset.jsp";
    }
    
    @ApiOperation(value = "创建子集")
    @RequiresPermissions("upms:position:createSubset")
    @ResponseBody
    @RequestMapping(value = "/insertSubsetTableData", method = RequestMethod.POST)
    public Object insertSubsetTableData(SysTableinfo sysTableinfo) {
    	sysTableinfo.setType(ToolUtil.POSITION_SUBSET_TYPE);
    	int count = sysTemplateTableService.createSubsetTable(sysTableinfo);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "获取相关子集信息")
    @RequiresPermissions("upms:position:read")
    @RequestMapping(value = "/getSysTableinfo", method = RequestMethod.GET)
    @ResponseBody
    public Object getSysTableinfo(
    		@RequestParam(required = false, value = "type") String type
    		) {
    	SysTableinfoExample sysTableinfoExample = new SysTableinfoExample();
    	SysTableinfoExample.Criteria criteria=sysTableinfoExample.createCriteria();  
    	Map<String, Object> result = new HashMap<>();
    	//获取相关表
    	criteria.andTypeEqualTo(ToolUtil.POSITION_SUBSET_TYPE);
    	criteria.andAvailableEqualTo(ToolUtil.AVAILABLE);
    	List<SysTableinfo> rows = sysTableinfoService.selectByExample(sysTableinfoExample);
    	result.put("rows", rows);
        return result;
    }
    
    @ApiOperation(value = "获取子集相关列信息")
    @RequiresPermissions("upms:position:read")
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
    	criteria.andTypeEqualTo(ToolUtil.POSITION_SUBSET_TYPE);
    	criteria.andTableNameEqualTo(tableName);
    	criteria.andAvailableEqualTo(ToolUtil.AVAILABLE);
    	
    	List<SysColumnInfo> rows = sysColumnInfoService.selectByExample(sysColumnInfoExample);
    	result.put("rows", rows);
    	return result;
    }
    
    @ApiOperation(value = "新增子集属性")
    @RequiresPermissions("upms:position:createSubset")
    @RequestMapping(value = "/createSubsetColumn", method = RequestMethod.GET)
    public String createSubsetColumn() {
        return "/manage/position/subsetColumn.jsp";
    }
    
    @ApiOperation(value = "新增子集属性")
    @RequiresPermissions("upms:position:createSubset")
    @ResponseBody
    @RequestMapping(value = "/insertSubsetColumnData", method = RequestMethod.POST)
    public Object insertSubsetColumnData(SysColumnInfo sysColumnInfo) {
    	sysColumnInfo.setId(UUID.randomUUID().toString());
    	sysColumnInfo.setAvailable(ToolUtil.AVAILABLE);
    	sysColumnInfo.setType(ToolUtil.POSITION_SUBSET_TYPE);
    	sysColumnInfo.setCreatetime(ToolUtil.getCurrentTime());
    	int count = sysColumnInfoService.insert(sysColumnInfo);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "添加子集(表单数据)")
    @RequiresPermissions("upms:position:createSubset")
    @RequestMapping(value = "/createSubsetForm", method = RequestMethod.GET)
    public String createSubsetForm() {
        return "/manage/position/subsetForm.jsp";
    }
    
    @ApiOperation(value = "添加子集数据")
    @RequiresPermissions("upms:position:createSubset")
    @ResponseBody
    @RequestMapping(value = "/insertSubsetData/{tableName}/{positionId}", method = RequestMethod.POST)
    public Object insertSubsetData(@PathVariable("tableName") String tableName, @PathVariable("positionId") String positionId, @RequestParam("data") String data) {
    	int count = sysTemplateTableService.insertSubsetData(tableName, positionId, data, ToolUtil.POSITION_SUBSET_TYPE);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }

    /**
     * 获取子集相关数据信息(数据库数据库分页实现)
     * @param offset
     * @param limit
     * @param search
     * @param tableName
     * @param positionId
     * @param subId
     * @return
     */
    @ApiOperation(value = "获取子集相关数据信息(数据库数据库分页实现)")
    @RequiresPermissions("upms:position:read")
    @RequestMapping(value = "/getDataInfoPage", method = RequestMethod.GET)
    @ResponseBody
    public Object getDataInfoPage(
    		@RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
            @RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
            @RequestParam(required = false, defaultValue = "", value = "search") String search,
    		@RequestParam(required = false, value = "tableName") String tableName,
    		@RequestParam(required = false, value = "positionId") String positionId,
    		@RequestParam(required = false, value = "subId") String subId
    		){
    	Map<String, Object> result = new HashMap<>();
    	Map<String, Object> params = new HashMap<>();
    	//添加查询条件
    	params.put("subId", subId);
    	params.put("positionId", positionId);
    	params.put("tableName", tableName);
    	params.put("search", search);
    	params.put("limit", limit);
    	params.put("offset", offset);
    	params.put("available", ToolUtil.AVAILABLE);
    	params.put("type", ToolUtil.POSITION_SUBSET_TYPE);
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
    @RequiresPermissions("upms:position:createSubset")
    @ResponseBody
    @RequestMapping(value = "/updateSubsetData/{tableName}/{subId}", method = RequestMethod.POST)
    public Object updateSubsetData(@PathVariable("tableName") String tableName, @PathVariable("subId") String subId, @RequestParam("data") String data) {
    	int count = sysTemplateTableService.updateSubsetData(tableName, subId, data, ToolUtil.POSITION_SUBSET_TYPE);
        
    	return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    @ApiOperation(value = "删除子集数据")
    @RequiresPermissions("upms:position:createSubset")
    @ResponseBody
    @RequestMapping(value = "/deletebsetData/{tableName}/{subId}", method = RequestMethod.GET)
    public Object deletebsetData(@PathVariable("tableName") String tableName, @PathVariable("subId") String ids) {
    	int count = sysTemplateTableService.deleteSubsetData(tableName, ids, ToolUtil.POSITION_SUBSET_TYPE);
    	
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
}
