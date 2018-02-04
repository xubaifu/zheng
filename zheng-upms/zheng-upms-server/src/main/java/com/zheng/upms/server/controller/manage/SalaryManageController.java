package com.zheng.upms.server.controller.manage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zheng.common.base.BaseController;
import com.zheng.upms.common.constant.ToolUtil;
import com.zheng.upms.dao.entity.SubsetTreeEntity;
import com.zheng.upms.dao.model.SysColumnInfo;
import com.zheng.upms.dao.model.SysColumnInfoExample;
import com.zheng.upms.dao.model.SysTableinfo;
import com.zheng.upms.dao.model.SysTableinfoExample;
import com.zheng.upms.rpc.api.SysColumnInfoService;
import com.zheng.upms.rpc.api.SysTableinfoService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 薪酬管理
 * @author xubaifu
 *
 */
@Controller
@Api(value = "薪酬管理", description = "薪酬管理")
@RequestMapping("/manage/salary")
public class SalaryManageController  extends BaseController {
	
	private static Logger _log = LoggerFactory.getLogger(UpmsLogController.class);
	
	@Resource
	private SysColumnInfoService sysColumnInfoService;
	
	@Resource
	private SysTableinfoService sysTableinfoService;
	
	@ApiOperation(value = "薪酬标准管理首页")
	@RequiresPermissions("upms:salary:read")
	@RequestMapping(value = "/salaryStandard", method = RequestMethod.GET)
	public String index() {
	    return "/manage/salary/salaryStandard.jsp";
	}
	
	@ApiOperation(value = "select")
    @RequiresPermissions("upms:salary:read")
    @RequestMapping(value = "/select", method = RequestMethod.GET)
    public String select() {
        return "/manage/salary/select.jsp";
    }
	
	@ApiOperation(value = "所有子集信息（子集表和子集属性）")
    @RequiresPermissions("upms:salary:read")
    @RequestMapping(value = "/getSubsetTree", method = RequestMethod.GET)
    @ResponseBody
    public Object getSubsetTree() {
		SysTableinfoExample sysTableinfoExample = new SysTableinfoExample();
		sysTableinfoExample.or().andAvailableEqualTo(ToolUtil.AVAILABLE);
        List<SysTableinfo> rowsTable = sysTableinfoService.selectByExample(sysTableinfoExample);
        
        SysColumnInfoExample sysColumnInfoExample = new SysColumnInfoExample();
		sysTableinfoExample.or().andAvailableEqualTo(ToolUtil.AVAILABLE);
        List<SysColumnInfo> rowsColumnIn = sysColumnInfoService.selectByExample(sysColumnInfoExample);
        List<SubsetTreeEntity> rows = new ArrayList<SubsetTreeEntity>();
        SubsetTreeEntity subsetTreeEntity = new SubsetTreeEntity();
        subsetTreeEntity.setId("-1");
        subsetTreeEntity.setBak("");
        subsetTreeEntity.setName("子集信息");
        subsetTreeEntity.setPid("-1");
        rows.add(subsetTreeEntity);
        subsetTreeEntity = new SubsetTreeEntity();
        subsetTreeEntity.setId("1");
        subsetTreeEntity.setBak("");
        subsetTreeEntity.setName("组织");
        subsetTreeEntity.setPid("-1");
        rows.add(subsetTreeEntity);
        subsetTreeEntity = new SubsetTreeEntity();
        subsetTreeEntity.setId("2");
        subsetTreeEntity.setBak("");
        subsetTreeEntity.setName("岗位");
        subsetTreeEntity.setPid("-1");
        rows.add(subsetTreeEntity);
        subsetTreeEntity = new SubsetTreeEntity();
        subsetTreeEntity.setId("3");
        subsetTreeEntity.setBak("");
        subsetTreeEntity.setName("人员");
        subsetTreeEntity.setPid("-1");
        rows.add(subsetTreeEntity);
        for(int i = 0, len = rowsTable.size(); i < len; i++){
        	subsetTreeEntity = new SubsetTreeEntity();
        	subsetTreeEntity.setId(rowsTable.get(i).getEnTableName());
        	subsetTreeEntity.setName(rowsTable.get(i).getCnTableName());
        	if(ToolUtil.ORGANIZATION_SUBSET_TYPE.equals(rowsTable.get(i).getType())){
        		subsetTreeEntity.setPid("1");
        	}
        	if(ToolUtil.POSITION_SUBSET_TYPE.equals(rowsTable.get(i).getType())){
        		subsetTreeEntity.setPid("2");
        	}
        	if(ToolUtil.PERSONNEL_SUBSET_TYPE.equals(rowsTable.get(i).getType())){
        		subsetTreeEntity.setPid("3");
        	}
        	subsetTreeEntity.setBak(rowsTable.get(i).getBak());
        	rows.add(subsetTreeEntity);
        }
        for(int i = 0, len = rowsColumnIn.size(); i < len; i++){
        	subsetTreeEntity = new SubsetTreeEntity();
        	subsetTreeEntity.setId(rowsColumnIn.get(i).getId());
        	subsetTreeEntity.setName(rowsColumnIn.get(i).getCnColName());
        	subsetTreeEntity.setPid(rowsColumnIn.get(i).getTableName());
        	subsetTreeEntity.setBak(rowsColumnIn.get(i).getBak());
        	rows.add(subsetTreeEntity);
        	
        }
        //long total = upmsOrganizationService.countByExample(upmsOrganizationExample);
        Map<String, Object> result = new HashMap<>();
        result.put("rows", rows);
        //result.put("total", total);
        return result;
    }
}
