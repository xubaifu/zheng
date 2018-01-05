package com.zheng.upms.server.controller.manage;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zheng.common.base.BaseController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 编制管理
 * @author neusoft
 *
 */
@Controller
@Api(value = "编制管理", description = "编制管理")
@RequestMapping("/manage/compilation")
public class UpmsCompilationController  extends BaseController {
	private static Logger _log = LoggerFactory.getLogger(UpmsCompilationController.class);
	
	@ApiOperation(value = "编制首页")
    @RequiresPermissions("upms:compilation:read")
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "/manage/compilation/index.jsp";
    }

}
