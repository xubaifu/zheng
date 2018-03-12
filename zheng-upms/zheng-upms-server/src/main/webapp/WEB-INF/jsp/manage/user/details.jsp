<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="/resources/inc/head.jsp" flush="true"/>
</head>
<body >

<div id="detailsDialog" class="crudDialog">
	<form id="detailsForm" method="post">
		<div class="form-group"></div>
		<div class="form-group">
			<label for="username" class="inputs">帐号</label>
			<input id="username" type="text" class="form-control" name="username" maxlength="20">
		</div>
		<div class="form-group" id="passwordGroup">
			<label for="password">密码</label>
			<input id="password" type="text" class="form-control" name="password" maxlength="32">
		</div>
		<div class="form-group">
			<label for="realname" class="inputs">姓名</label>
			<input id="realname" type="text" class="form-control" name="realname" maxlength="20">
		</div>
		<div class="row">
			<div class="col-lg-8 form-group">
				<label for="avatar" class="inputs">头像</label>
				<input id="avatar" type="text" class="form-control" name="avatar" maxlength="150">
			</div>
			<div class="col-lg-4">
				<div id="picker">上传头像</div>
			</div>
		</div>
		<div class="form-group"></div>
		<div class="form-group">
			<label for="phone" class="inputs">电话</label>
			<input id="phone" type="text" class="form-control" name="phone" maxlength="20">
		</div>
		<div class="form-group">
			<label for="email" class="inputs">邮箱</label>
			<input id="email" type="text" class="form-control" name="email" maxlength="50">
		</div>
		<div class="form-group">
			<label id="pidLable" for="pid" class="inputs">岗位</label>
			<input id="pName" type="text" class="form-control" name="pName" maxlength="64" onclick="loadPosition('details')" onkeydown="javascript:return false">
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
				<input id="sex_1" type="radio" name="sex" value="1">
				<label for="sex_1">男 </label>
			</div>
			<div class="radio radio-inline radio-danger">
				<input id="sex_0" type="radio" name="sex" value="0">
				<label for="sex_0">女 </label>
			</div>
			<div class="radio radio-inline radio-success">
				<input id="locked_0" type="radio" name="locked" value="0">
				<label for="locked_0">正常 </label>
			</div>
			<div class="radio radio-inline">
				<input id="locked_1" type="radio" name="locked" value="1">
				<label for="locked_1">锁定 </label>
			</div>
		</div>
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="doSubmit();">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="goHomeTab();">取消</a>
		</div>
	</form>
</div>
<jsp:include page="/resources/inc/footer.jsp" flush="true"/>

<script>
$(function(){
	//initUploader();
})

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
	
function loadTable(){
	//console.log("orgs..."+JSON.stringify(orgs));
	$posTable.bootstrapTable('destroy');
	// bootstrap table初始化
	$posTable.bootstrapTable({
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
		striped : true,
		minimumCountColumns : 2,
		clickToSelect : true,
		silentSort : false,
		smartDisplay : false,
		escape : true,
		toolbar : '#toolbarORG',
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
		data : upmsOrganizations,
		language : "zh-CN"//TODO
	});
	
}

function orgFormatter(value, row, index) {
	return ['<select name="organizationId" style="width:95%" onchange="updateOrg('+ index +',this)">',
			'<c:forEach var="upmsOrganization" items="${upmsOrganizations}">',
			'<option value="${upmsOrganization.organizationId}"',
			value=="${upmsOrganization.organizationId}" ? "selected" : "",
			'>${upmsOrganization.name}</option>',
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

function loadDetails(){
	if(operation=="create"){
		user.username="";
		user.realname="";
		user.avatar="";
		user.phone="";
		user.email="";
		user.positionId="";
		user.sex=1;
		user.locked=0;
		
		$("#password").val("");
		$("#passwordGroup").show();
		$("#username").removeAttr("readOnly");
		$("#pName").val("");
	}else{
		$("#password").val("");
		$("#passwordGroup").hide();
		$("#username").attr("readOnly","readonly");
	}
	
	orgs = eval(details.orglist);
	
	upmsOrganizations = details.upmsOrganizations;
	for(i in upmsOrganizations){
		var o = upmsOrganizations[i];
		o.id = o.organizationId;
		o.text = o.name;
	}
	if(details.user)
		user = details.user;
	
	$("#username").val(user.username);
	$("#realname").val(user.realname);
	$("#avatar").val(user.avatar);
	$("#phone").val(user.phone);
	$("#email").val(user.email);
	$("#positionId").val(user.positionId);
	if(user.sex==1)
		$("#sex_1").click();
	else
		$("#sex_0").click();
	if(user.locked==0)
		$("#locked_0").click();
	else
		$("#locked_1").click();
	//$("#sex_1").attr("checked",user.sex==1);
	//$("#sex_0").attr("checked",user.sex==0);
	//$("#locked_0").attr("checked",user.locked==0);
	//$("#locked_1").attr("checked",user.locked==1);
	

	setInputCss();
	getPositionList();
	loadTable();
	initSelect();
	initMaterialInput();
}

function doSubmit() {
	$("#orgs").val(JSON.stringify(orgs));
	var url = "";
	if(operation=="create"){
		url = '${basePath}/manage/user/create';
	}else{
		url = '${basePath}/manage/user/update/'+user.userId
	}
	
    $.ajax({
        type: 'post',
        url: url,
        data: $('#detailsForm').serialize(),
        beforeSend: function() {
        	if($("#realname").val().trim()==""){
        		prompt("姓名不能为空");
				return false;
        	}
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
        },
        success: function(result) {
			if (result.code != 1) {
				if (result.data instanceof Array) {
					$.each(result.data, function(index, value) {
						$.confirm({
							theme: 'dark',
							animation: 'rotateX',
							closeAnimation: 'rotateX',
							title: false,
							content: value.errorMsg,
							buttons: {
								confirm: {
									text: '确认',
									btnClass: 'waves-effect waves-button waves-light'
								}
							}
						});
					});
				} else {
						$.confirm({
							theme: 'dark',
							animation: 'rotateX',
							closeAnimation: 'rotateX',
							title: false,
							content: result.data.errorMsg,
							buttons: {
								confirm: {
									text: '确认',
									btnClass: 'waves-effect waves-button waves-light'
								}
							}
						});
				}
			} else {
				//detailsDialog.close();
				$table.bootstrapTable('refresh');
				goHomeTab();
				disableDetailsTab();
			}
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
			$.confirm({
				theme: 'dark',
				animation: 'rotateX',
				closeAnimation: 'rotateX',
				title: false,
				content: textStatus,
				buttons: {
					confirm: {
						text: '确认',
						btnClass: 'waves-effect waves-button waves-light'
					}
				}
			});
        }
    });
}


//获取岗位列表
function getPositionList(){
	//获取所有岗位列表
	 $.ajax({
	        type: 'get',
	        url: '${basePath}/manage/position/listAll',
	        data: {},
	        success: function(data) {
	        	zNodes = data.rows;
				for(var i = 0; i < data.rows.length; i++){
					zNodes[i].id = data.rows[i].positionId;
					zNodes[i].pId = data.rows[i].pid;
					zNodes[i].name = data.rows[i].name;
					zNodes[i].title = data.rows[i].name;
					if(user!=null && user.positionId==data.rows[i].positionId)
						$("#pName").val(data.rows[i].name);
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

function goHomeTab(){
	$("#userList").find("a").click();
	setTabTitle("用户信息");
}

function gotoDetailsTab(){
	enableDetailsTab();
	$("#userdetails").find("a").click();
}

function enableDetailsTab(){
	$("#userdetails").removeClass("disabled");
}

function disableDetailsTab(){
	$("#userdetails").addClass("disabled");
}

function initData(op){
	orgs = [];
	user = {};
	if(op)
		operation = op;//create
	else
		operation = "";
}

function setInputCss(){
	$(".inputs").each(function(e){
		if($(this).next().val()!="")
			$(this).addClass("active");
		else
			$(this).removeClass("active");
	})
}

function setTabTitle(op,text){
	$("#detailsTitle").text(op + (text||""));
}

function clickDetailsTab(){
	var userId;
	if(operation=="create"){
		userId = "new";
	}else{
		var rows = $table.bootstrapTable('getSelections');
		if (rows.length != 1) {
			$.confirm({
				title: false,
				content: '请选择一条记录！',
				autoClose: 'cancel|3000',
				backgroundDismiss: true,
				buttons: {
					cancel: {
						text: '取消',
						btnClass: 'waves-effect waves-button'
					}
				}
			});
			return;
		}
		userId = rows[0].userId;
		setTabTitle("用户信息",rows[0].username);
	}
		
	$.ajax({
		type: 'get',
      url: '${basePath}/manage/user/details/'+userId,
      data: {},
      beforeSend: function() {
      },
      onContentReady: function () {},
      success: function(result) {
			console.log(result.data);
			details = result.data;
			loadDetails();
			if(!isUploaderInitialized){
				isUploaderInitialized = true;
				initUploader();
			}
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
      	alert("failed...");
      }
	});
}

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
			"id": "#picker",
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
	
	WebUploader.create({
		// swf文件路径
		swf: '${basePath}/resources/zheng-admin/plugins/webuploader-0.1.5/Uploader.swf',
		// 文件接收服务端
		method: 'POST',
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: {
			"id": "#test",
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
}

</script>
</body>
</html>