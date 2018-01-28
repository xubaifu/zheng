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
import com.zheng.common.util.RedisUtil;
import com.zheng.common.validator.LengthValidator;
import com.zheng.upms.common.constant.ToolUtil;
import com.zheng.upms.common.constant.UpmsResult;
import com.zheng.upms.common.constant.UpmsResultConstant;
import com.zheng.upms.dao.model.UpmsDict;
import com.zheng.upms.dao.model.UpmsDictExample;
import com.zheng.upms.rpc.api.UpmsDictService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

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

    @ApiOperation(value = "日志首页")
    @RequiresPermissions("upms:dict:read")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "/manage/dict/index.jsp";
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
            @RequestParam(required = false, value = "order") String order) {
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
        return new UpmsResult(UpmsResultConstant.SUCCESS, count);
    }
    
    @ApiOperation(value = "修改字典")
    @RequiresPermissions("upms:dict:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(@PathVariable("id") String id, ModelMap modelMap) {
    	UpmsDict upmsDict = upmsDictService.selectByPrimaryKeyString(id);
        modelMap.put("dict", upmsDict);
        return "/manage/dict/update.jsp";
    }

    @ApiOperation(value = "修改字典")
    @RequiresPermissions("upms:dict:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@PathVariable("id") String id, UpmsDict upmsDict) {
       
        int count = upmsDictService.updateByPrimaryKeySelective(upmsDict);
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
    
}
