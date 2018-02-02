<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div id="createDialog" class="crudDialog">
	<form id="createForm" method="post">
		<div class="form-group">
			<label for="username">帐号</label>
			<input id="username" type="text" class="form-control" name="username" maxlength="20">
		</div>
		<div class="form-group">
			<label for="password">密码</label>
			<input id="password" type="text" class="form-control" name="password" maxlength="32">
		</div>
		<div class="form-group">
			<label for="realname">姓名</label>
			<input id="realname" type="text" class="form-control" name="realname" maxlength="20">
		</div>
		<div class="row">
			<div class="col-lg-8 form-group">
				<label for="avatar">头像</label>
				<input id="avatar" type="text" class="form-control" name="avatar" maxlength="150">
			</div>
			<div class="col-lg-4">
				<div id="picker">上传头像</div>
			</div>
		</div>
		<div class="form-group">
			<label for="phone">电话</label>
			<input id="phone" type="text" class="form-control" name="phone" maxlength="20">
		</div>
		<div class="form-group">
			<label for="email">邮箱</label>
			<input id="email" type="text" class="form-control" name="email" maxlength="50">
		</div>
		<div class="form-group">
			<label id="pidLable" for="pid">岗位</label>
			<input id="pName" type="text" class="form-control" name="pName" maxlength="64" onclick="loadPosition()" onkeydown="javascript:return false">
			<input id="positionId" type="text" class="form-control" name="positionId" maxlength="64" style="display: none;">
		</div>
		<div class="form-group">
			<div id="treePosition" style="border: 1px solid #d2d1d1;display:none">
				<ul id="tree" class="ztree"></ul>
			</div>
		</div>
		<div class="form-group">
			<div id="toolbarORG">
				<a class="waves-effect waves-button" href="javascript:;" onclick="addRow()"><i class="zmdi zmdi-plus"></i> 添加组织</a>
			</div>
			<table id="tablePosition"></table>
			<input id="orgs" type="text" class="form-control" name="orgs" style="display: none;">
		</div>
		<div class="radio">
			<div class="radio radio-inline radio-info">
				<input id="sex_1" type="radio" name="sex" value="1" checked>
				<label for="sex_1">男 </label>
			</div>
			<div class="radio radio-inline radio-danger">
				<input id="sex_0" type="radio" name="sex" value="0">
				<label for="sex_0">女 </label>
			</div>
			<div class="radio radio-inline radio-success">
				<input id="locked_0" type="radio" name="locked" value="0" checked>
				<label for="locked_0">正常 </label>
			</div>
			<div class="radio radio-inline">
				<input id="locked_1" type="radio" name="locked" value="1">
				<label for="locked_1">锁定 </label>
			</div>
		</div>
		
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="createSubmit();">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="createDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
function initUploader() {
	//百度上传按钮
	var uploader = WebUploader.create({
		// swf文件路径
		swf: '${basePath}/resources/zheng-admin/plugins/webuploader-0.1.5/Uploader.swf',
		// 文件接收服务端
		method: 'POST',
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: {
			"id": '#picker',
			"multiple": false
		},
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 选完文件后，是否自动上传。
		auto: false,
		// 只允许选择图片文件
		accept: {
			title: '图片文件',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function(file) {
		$.ajax({
			url: '${ZHENG_OSS_ALIYUN_OSS_POLICY}',
			type: 'GET',
			dataType: 'jsonp',
			jsonp: 'callback',
			success: function(result) {
				var suffix = get_suffix(file.name);
				var random_name = random_string();
				uploader.options.formData.key = result.dir + '/' + random_name + suffix;
				uploader.options.formData.policy = result.policy;
				uploader.options.formData.OSSAccessKeyId = result.OSSAccessKeyId;
				uploader.options.formData.success_action_status = 200;
				uploader.options.formData.callback = result.callback;
				uploader.options.formData.signature = result.signature;
				uploader.options.server = result.action;
				uploader.upload();
			},
			error: function(msg) {
				console.log(msg);
			}
		});
	});
	uploader.on( 'uploadSuccess', function(file, response) {
		$('#avatar').val(response.data.filename).focus();
	});
	uploader.on( 'uploadError', function(file) {
		console.log('uploadError', file);
	});
}
// 根据路径获取后缀
function get_suffix(filename) {
	var pos = filename.lastIndexOf('.');
	var suffix = '';
	if (pos != -1) {
		suffix = filename.substring(pos);
	}
	return suffix;
}
// 随机字符串
function random_string(len) {
	len = len || 32;
	var chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	var maxPos = chars.length;
	var pwd = '';
	for (i = 0; i < len; i++) {
		pwd += chars.charAt(Math.floor(Math.random() * maxPos));
	}
	return pwd;
}
function createSubmit() {
	$("#orgs").val(JSON.stringify(orgs));
    $.ajax({
        type: 'post',
        url: '${basePath}/manage/user/create',
        data: $('#createForm').serialize(),
        beforeSend: function() {
        	if (orgs.length>0) {
        		for(i in orgs){
        			if(orgs[i].organizationId==""){
        				prompt("请选择一个组织或删除该行");
        				return false;
        			}
        			if(orgs[i].organizationId!=undefined && orgs[i].isPrimary==undefined){
        				prompt("请选择一个主要组织");
        				return false;
        			}
        		}
            }
        	/*
        	return;
            if ($('#username').val() == '') {
                $('#username').focus();
                return false;
            }
            if ($('#password').val() == '' || $('#password').val().length < 5) {
                $('#password').focus();
                return false;
            }
            */
        },
        success: function(result) {
			if (result.code != 1) {
				if (result.data instanceof Array) {
					$.each(result.data, function(index, value) {
						prompt(value.errorMsg);
					});
				} else {
					prompt(result.data.errorMsg || result.data);
				}
			} else {
				createDialog.close();
				$table.bootstrapTable('refresh');
			}
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	prompt(textStatus);
        }
    });
}


//获取岗位列表
function getPositionList(treeNode,id){
	//获取所有岗位列表
	 $.ajax({
	        type: 'get',
	        url: '${basePath}/manage/position/listAll',
	        data: {},
	        success: function(data) {
	        	//console.log(data)
	        	zNodes = data.rows;
				for(var i = 0; i < data.rows.length; i++){
					zNodes[i].id = data.rows[i].positionId;
					zNodes[i].pId = data.rows[i].pid;
					zNodes[i].name = data.rows[i].name;
					zNodes[i].title = data.rows[i].name;
				}
				zTree = $.fn.zTree.init($("#tree"), treeSetting, zNodes);
	        },
	        error: function(err){
	        	console.error(err);
	        }
	    });
}

function loadPosition(){
	$("#treePosition").show();
}

$(function() {
	//getPositionList();
});
var treeSetting = {
	data : {
		key : {
			title : "title"
		},
		simpleData : {
			enable : true
		}
	},
	view: {  
        dblClickExpand: false  
    },
	callback : {
		onClick : function (event, treeId, treeNode, clickFlag) {
			if(treeNode.isParent){
				//$.fn.zTree.getZTreeObj("#tree").expandNode(treeNode);
				zTree.expandNode(treeNode);
				return;
			}
			$("#pName").val(treeNode.name);
			$("#positionId").val(treeNode.id);
			$("#pidLable").addClass("active");
		}
	}
};
var zNodes =[];
//Postion Table
var $pTable = $('#tablePosition');
var orgs = new Array();
var selectIndex = 0;

$(function() {
	getPositionList();
	orgs = new Array();
	loadTable();
});

function loadTable(){
	$pTable.bootstrapTable('destroy');
	// bootstrap table初始化
	$pTable.bootstrapTable({
		//url: '${basePath}/manage/user/list',
		columns: [
			{
				field : 'organizationId',
				title : '组织名称',
				formatter : 'orgFormatter',
				halign : 'center',
				'class' : 'col-md-8'
			}, {
				field : 'isPrimary',
				title : '主要组织',
				align : 'center',
				formatter : 'radioFormatter',
				clickToSelect : false,
				valign : 'middle',
				'class' : 'col-md-2'
			}, {
				field : 'action',
				formatter : 'removeFormatter',
				valign : 'middle',
				align : 'center',
				'class' : 'col-md-2'
			} ],
		data : orgs,
		//height: getHeight(),
		striped : true,
		//search: true,
		//showRefresh : true,
		//showColumns: true,
		minimumCountColumns : 2,
		clickToSelect : true,
		//detailView: true,
		//detailFormatter: 'detailFormatter',
		//pagination: true,
		//paginationLoop: false,
		//sidePagination: 'server',
		silentSort : false,
		smartDisplay : false,
		escape : true,
		toolbar : '#toolbarORG',
		//searchOnEnterKey: true,
		//onClickRow: onClickRow
	});
	
	for(i in orgs){
		if(orgs[i].isPrimary==1){
			$("[name=isPrimary]").eq(i).prop("checked",true);
		}
	}

	//Select setting
	$('select').select2({
		placeholder : '请选择用户组织',
		allowClear : true,
		//maximumSelectionLength : 1,
		language : "zh-CN"//TODO
	});
}
	function orgFormatter(value, row, index) {
		return ['<select name="organizationId" style="width:95%" onchange="updateOrg('+ index +',this)">',
				'<c:forEach var="upmsOrganization" items="${upmsOrganizations}">',
				'<option value="${upmsOrganization.organizationId}">${upmsOrganization.name}</option>',
				'</c:forEach>', '</select>' ].join('');
	}
	function radioFormatter(value, row, index) {
		return [ '<input type="radio" name="isPrimary" value="1" class="radio radio-inline radio-success" onchange="updateIsPrimary('+ index +',this)">'
		].join('');
	}
	function removeFormatter(value, row, index) {
		return [
		'<a class="update" href="javascript:;" onclick="removeRow('+ index +')" data-toggle="tooltip"><i class="zmdi zmdi-close"></i> 删除组织</a>　'
		].join('');
	}
	
	function initSelect(){
		$('select').each(function(i){
			$(this).val(orgs[i].organizationId).trigger("change");
		})
	}
	
	function addRow() {
		orgs.push({isPrimary:orgs.length==0?1:0});
		loadTable();
		initSelect();
	}
	
	function updateOrg(index,element){
		var obj = orgs[index];
		if($(element).val()){
			for(i in orgs){
				if(index==i || orgs.length==1)
					continue;
				if(orgs[i].organizationId==$(element).val()){
					$(element).val('').trigger('change');
					prompt("组织已存在");
					return;
				}
			}
			obj["organizationId"] = $(element).val();
		}else{
			obj["organizationId"] = "";
		}
	}
	
	function updateIsPrimary(index,element){
		for(i in orgs){
			orgs[i].isPrimary = index==i?1:0;
		}
	}
	
	function removeRow( index,row){
		var reset=false;
		if(orgs[index].isPrimary==1){
			reset=true;
		}
		orgs.splice(index,1);
		if(reset&&orgs.length>0){
			orgs[0].isPrimary=1;
		}
		
		loadTable();
		initSelect();
	}
	
	//Prompt dialog
	function prompt(message){
		$.confirm({
			theme: 'dark',
			animation: 'rotateX',
			closeAnimation: 'rotateX',
			title: false,
			content: message,
			buttons: {
				confirm: {
					text: '确认',
					btnClass: 'waves-effect waves-button waves-light'
				}
			}
		});
	}
	
</script>