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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zheng.common.base.BaseController;
import com.zheng.common.util.RedisUtil;
import com.zheng.upms.common.constant.ToolUtil;
import com.zheng.upms.common.constant.UpmsResult;
import com.zheng.upms.common.constant.UpmsResultConstant;
import com.zheng.upms.dao.entity.SubsetTreeEntity;
import com.zheng.upms.dao.model.UpmsDict;
import com.zheng.upms.dao.model.UpmsDictData;
import com.zheng.upms.dao.model.UpmsDictDataExample;
import com.zheng.upms.dao.model.UpmsDictExample;
import com.zheng.upms.dao.model.UpmsDictType;
import com.zheng.upms.dao.model.UpmsDictTypeExample;
import com.zheng.upms.rpc.api.UpmsDictDataService;
import com.zheng.upms.rpc.api.UpmsDictService;
import com.zheng.upms.rpc.api.UpmsDictTypeService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import redis.clients.jedis.Jedis;

/**
 * 字典表管理
 * @author xubaifu
 *
 */
@Controller
@Api(value = "字典表管理", description = "字典表管理")
@RequestMapping("/manage/dict")
public class UpmsDictController extends BaseController {
	private static Logger _log = LoggerFactory.getLogger(UpmsLogController.class);
	
	@Autowired
    private UpmsDictService upmsDictService;
	
	@Autowired
    private UpmsDictTypeService upmsDictTypeService;
	
	@Autowired
    private UpmsDictDataService upmsDictDataService;

    @ApiOperation(value = "日志首页")
    @RequiresPermissions("upms:dict:read")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "/manage/dict/index.jsp";
    }
    
    @ApiOperation(value = "所有字典列表")
    @RequiresPermissions("upms:dict:read")
    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    @ResponseBody
    public Object listAll() {
    	UpmsDictExample upmsDictExample = new UpmsDictExample();
        List<UpmsDict> rows = upmsDictService.selectByExample(upmsDictExample);
        //long total = upmsOrganizationService.countByExample(upmsOrganizationExample);
        Map<String, Object> result = new HashMap<>();
        result.put("rows", rows);
        //result.put("total", total);
        return result;
    }
    
    @ApiOperation(value = "字典列表")
    @RequiresPermissions("upms:dict:read")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(
            @RequestParam(required = false, defaultValue = "0", value = "offset") int offset,
            @RequestParam(required = false, defaultValue = "10", value = "limit") int limit,
            @RequestParam(required = false, defaultValue = "", value = "search") String search,
            @RequestParam(required = false, defaultValue = "0", value = "type") int type,
            @RequestParam(required = false, defaultValue = "0", value = "id") int id,
            @RequestParam(required = false, value = "sort") String sort,
            @RequestParam(required = false, value = "order") String order,
            @RequestParam(required = false, value = "dictId") String dictId) {
        UpmsDictExample upmsdictExample = new UpmsDictExample();
        //UpmsDictExample.Criteria criteria = upmsdictExample.createCriteria();
        if (StringUtils.isNotBlank(search)) {
            upmsdictExample.or()
                    .andValueLike("%" + search + "%");
            upmsdictExample.or()
            		.andLabelLike("%" + search + "%");
            upmsdictExample.or()
            		.andTypeLike("%" + search + "%");
        }
        if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
            upmsdictExample.setOrderByClause(sort + " " + order);
        }
        if (!StringUtils.isBlank(dictId) && !StringUtils.isBlank(dictId)) {
            upmsdictExample.or().andIdEqualTo(dictId);
            upmsdictExample.or().andParentIdEqualTo(dictId);
            
        }
        List<UpmsDict> rows = upmsDictService.selectByExampleForOffsetPage(upmsdictExample, offset, limit);
        long total = upmsDictService.countByExample(upmsdictExample);
        Map<String, Object> result = new HashMap<>();

       /* RedisUtil.setList("aaaa", rows);
        List<UpmsDict> rows1 = RedisUtil.getList("aaaa");
        for(int i = 0; i < rows1.size(); i++){
        	System.out.println(rows1.get(i).getLabel());
        	
        }*/
        result.put("rows", rows);
        result.put("total", total);
        return result;
    }
    
    @ApiOperation(value = "新增字典数据")
    @RequiresPermissions("upms:dict:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(ModelMap modelMap) {
    	/*UpmsDictExample upmsdictExample = new UpmsDictExample();
    	upmsdictExample.createCriteria()
                .andStatusEqualTo((byte) 1);
        List<UpmsSystem> upmsSystems = upmsDictService.selectByExample(upmsdictExample);
        modelMap.put("upmsSystems", upmsSystems);*/
        return "/manage/dict/create.jsp";
    }
    
    @ApiOperation(value = "新增字典数据")
    @RequiresPermissions("upms:dict:create")
    @ResponseBody
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Object create(UpmsDict upmsDict) {
        /*ComplexResult result = FluentValidator.checkAll()
                .on(upmsPermission.getName(), new LengthValidator(1, 20, "名称"))
                .doValidate()
                .result(ResultCollectors.toComplex());
        if (!result.isSuccess()) {
            return new UpmsResult(UpmsResultConstant.INVALID_LENGTH, result.getErrors());
        }*/
       // long time = System.currentTimeMillis();
    	upmsDict.setId(UUID.randomUUID().toString());
    	upmsDict.setDelFlag(ToolUtil.AVAILABLE);
    	//upmsDict.setCreateBy();
        int count = upmsDictService.insert(upmsDict);
        //将字典数据写入redis缓存
        if(null != upmsDict){
        	JSONObject object = new JSONObject();
        	Jedis jedis = RedisUtil.getJedis();
        	if(null == jedis.get(ToolUtil.ZHENG_UPMS_DICT + "_" + upmsDict.getType())){
        		object.put(upmsDict.getValue(), upmsDict.getLabel());
        		jedis.set(ToolUtil.ZHENG_UPMS_DICT + "_" + upmsDict.getType(), object.toString());
        	}else{
        		object = JSONObject.parseObject(jedis.get(ToolUtil.ZHENG_UPMS_DICT + "_" + upmsDict.getType()));
        		object.put(upmsDict.getValue(), upmsDict.getLabel());
        		jedis.set(ToolUtil.ZHENG_UPMS_DICT + "_" + upmsDict.getType(), object.toString());
        	}
        }
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "修改字典")
    @RequiresPermissions("upms:dict:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") String id, ModelMap modelMap) {
    	UpmsDict upmsDict = upmsDictService.selectByPrimaryKeyString(id);
    	UpmsDict upmsDictPar = new UpmsDict();
    	if(upmsDict.getParentId() != null && upmsDict.getParentId().length() != 0){
    		upmsDictPar = upmsDictService.selectByPrimaryKeyString(upmsDict.getParentId());
        }
        modelMap.put("dict", upmsDict);
        modelMap.put("upmsDictPar", upmsDictPar);
        return "/manage/dict/update.jsp";
    }

    @ApiOperation(value = "修改字典")
    @RequiresPermissions("upms:dict:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@PathVariable("id") String id, UpmsDict upmsDict) {
        int count = upmsDictService.updateByPrimaryKeySelective(upmsDict);
        //BeanDefineConfigue
        //将字典数据写入redis缓存
        if(null != upmsDict){
        	JSONObject object = new JSONObject();
        	Jedis jedis = RedisUtil.getJedis();
        	if(null == jedis.get(ToolUtil.ZHENG_UPMS_DICT + "_" + upmsDict.getType())){
        		object.put(upmsDict.getValue(), upmsDict.getLabel());
        		jedis.set(ToolUtil.ZHENG_UPMS_DICT + "_" + upmsDict.getType(), object.toString());
        	}else{
        		object = JSONObject.parseObject(jedis.get(ToolUtil.ZHENG_UPMS_DICT + "_" + upmsDict.getType()));
        		object.put(upmsDict.getValue(), upmsDict.getLabel());
        		jedis.set(ToolUtil.ZHENG_UPMS_DICT + "_" + upmsDict.getType(), object.toString());
        	}
        }
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    } 
    
    @ApiOperation(value = "删除字典")
    @RequiresPermissions("upms:dict:delete")
    @RequestMapping(value = "/delete/{ids}",method = RequestMethod.GET)
    @ResponseBody
    public Object delete(@PathVariable("ids") String ids) {
        int count = upmsDictService.deleteByPrimaryKeys(ids);
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "根据类型查询字典")
    @RequiresPermissions("upms:dict:read")
    @RequestMapping(value = "/getDictByType/{type}",method = RequestMethod.GET)
    @ResponseBody
    public Object getDict(@PathVariable("type") String type) {
    	//JSONObject object = new JSONObject();
    	Jedis jedis = RedisUtil.getJedis();
    	//object = JSONObject.parseObject(jedis.get(type));
    	Map<String,Object> mapTypes = JSON.parseObject(jedis.get(ToolUtil.ZHENG_UPMS_DICT + "_" + type));  
    	return mapTypes;
    }
    
    
    @ApiOperation(value = "所有字典类型列表")
    @RequiresPermissions("upms:dict:read")
    @RequestMapping(value = "/listDictTypeAll", method = RequestMethod.GET)
    @ResponseBody
    public Object listDictTypeAll() {
    	UpmsDictTypeExample upmsDictTypeExample = new UpmsDictTypeExample();
        List<UpmsDictType> rowsTtpe = upmsDictTypeService.selectByExample(upmsDictTypeExample);
        
        UpmsDictDataExample upmsDictDataExample = new UpmsDictDataExample();
        List<UpmsDictData> rowsData = upmsDictDataService.selectByExample(upmsDictDataExample);
        
        int lenType = rowsTtpe.size(), lenData = rowsData.size();
        SubsetTreeEntity[] arr = new SubsetTreeEntity[lenData + 1];
        for(int i = 0; i < lenData; i++){
        	SubsetTreeEntity subsetTreeEntity = new SubsetTreeEntity();
        	subsetTreeEntity.setId(rowsData.get(i).getDictCode());
        	subsetTreeEntity.setPid(rowsData.get(i).getParentCode());
        	subsetTreeEntity.setName(rowsData.get(i).getDictLabel());
        	subsetTreeEntity.setBak(rowsData.get(i).getDictLabel());
        	arr[i] = subsetTreeEntity; 
        }
        SubsetTreeEntity subsetTreeEntity = new SubsetTreeEntity();
    	subsetTreeEntity.setId("0");
    	subsetTreeEntity.setPid("-1");
    	subsetTreeEntity.setName("字典管理");
    	subsetTreeEntity.setBak("字典管理");
    	arr[lenData] = subsetTreeEntity;
        /*SubsetTreeEntity[] arr = new SubsetTreeEntity[lenType + lenData + 1];
        for(int i = 0; i < lenType; i++){
        	SubsetTreeEntity subsetTreeEntity = new SubsetTreeEntity();
        	subsetTreeEntity.setId(rowsTtpe.get(i).getDictType());
        	subsetTreeEntity.setPid("0");
        	subsetTreeEntity.setName(rowsTtpe.get(i).getDictName());
        	subsetTreeEntity.setBak(rowsTtpe.get(i).getDictName());
        	arr[i] = subsetTreeEntity; 
        }
        for(int i = lenType; i < lenType + lenData; i++){
        	SubsetTreeEntity subsetTreeEntity = new SubsetTreeEntity();
        	subsetTreeEntity.setId(rowsData.get(i-lenType).getDictCode());
        	subsetTreeEntity.setPid(rowsData.get(i-lenType).getDictType());
        	subsetTreeEntity.setName(rowsData.get(i-lenType).getDictLabel());
        	subsetTreeEntity.setBak(rowsData.get(i-lenType).getDictLabel());
        	arr[i] = subsetTreeEntity; 
        }
        SubsetTreeEntity subsetTreeEntity = new SubsetTreeEntity();
    	subsetTreeEntity.setId("0");
    	subsetTreeEntity.setPid("-1");
    	subsetTreeEntity.setName("字典管理");
    	subsetTreeEntity.setBak("字典管理");
    	arr[lenType + lenData] = subsetTreeEntity; */
        Map<String, Object> result = new HashMap<>();
        result.put("rows", arr);
        return result;
    }
    
}
