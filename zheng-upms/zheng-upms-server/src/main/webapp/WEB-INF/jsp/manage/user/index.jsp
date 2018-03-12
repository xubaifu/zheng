<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>用户管理</title>
	<jsp:include page="/resources/inc/head.jsp" flush="true"/>
</head>
<body>
<div id="main">
	<div style="overflow-x: auto;">
		<div id="tabPage" style="height: 40px">
			<ul id="myTab" class="nav nav-tabs">
				<li id="userList" class="active"><a href="#listtableBySelected" data-toggle="tab" onclick='setOperation();setTabTitle("用户信息");'>用户列表</a></li>
				<li id="userdetails" class="disabled">
					<a href="#listtable" data-toggle="tab" id="detailsTitle">
						用户信息
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="listtableBySelected" style="height: 212px; padding-bottom: 40px;">
			<div id="toolbar">
				<shiro:hasPermission name="upms:user:create"><a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增用户</a></shiro:hasPermission>
				<shiro:hasPermission name="upms:user:update"><a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i> 编辑用户</a></shiro:hasPermission>
				<shiro:hasPermission name="upms:user:delete"><a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction()"><i class="zmdi zmdi-close"></i> 删除用户</a></shiro:hasPermission>
				<shiro:hasPermission name="upms:user:organization"><a class="waves-effect waves-button" href="javascript:;" onclick="organizationAction()"><i class="zmdi zmdi-accounts-list"></i> 用户组织</a></shiro:hasPermission>
				<shiro:hasPermission name="upms:user:role"><a class="waves-effect waves-button" href="javascript:;" onclick="roleAction()"><i class="zmdi zmdi-accounts"></i> 用户角色</a></shiro:hasPermission>
				<shiro:hasPermission name="upms:user:permission"><a class="waves-effect waves-button" href="javascript:;" onclick="permissionAction()"><i class="zmdi zmdi-key"></i> 用户权限</a></shiro:hasPermission>
				<shiro:hasPermission name="upms:user:create"><a class="waves-effect waves-button" href="javascript:;" onclick="createSubsetTable()"><i class="zmdi zmdi-close"></i> 新增子集</a></shiro:hasPermission>
			</div>
			<table id="table"></table>
		</div>
		<!-- 子集信息 -->
		<div class="tab-pane fade in" id="listtable">
			<%@include file="details.jsp"%>
		</div>
	</div>
</div>
<div id="userDialog"></div>
<input id="guserId" type="hidden">
<jsp:include page="/resources/inc/footer.jsp" flush="true"/>
<script>

/*global vars*/
var operation = "";//create or ""
var upmsOrganizations = [];
var $table = $('#table');
var isUploaderInitialized = false;
var details = null;
var $posTable = $('#tablePosition');
var user = {};
var zNodes =[];
var guserId = "";
var gtableId = "";

$(function() {
	loadUserList();
	loadTabPage();
	
	$("#userdetails").on("click",function(e,a){
		if($(this).hasClass("disabled"))
			return false;
		clickDetailsTab();
	})
});

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


function setOperation(row,input){
	var rows = $table.bootstrapTable('getSelections');
	if (rows.length==1) {
		operation = "";
		enableDetailsTab()
	}else{
		operation = "create";
		disableDetailsTab()
	}
	
	setUserId(rows.length>0 ? rows[0].userId : "");
}

function setUserId(id){
	guserId = id;
	$("#guserId").val(id);
}
	
/*User Table start*/
function loadUserList(){
	
	// bootstrap table初始化
	$table.bootstrapTable({
		url: '${basePath}/manage/user/list',
		height: getHeight(),
		striped: true,
		search: true,
		showRefresh: true,
		showColumns: true,
		minimumCountColumns: 2,
		clickToSelect: true,
		detailView: true,
		detailFormatter: 'detailFormatter',
		pagination: true,
		paginationLoop: false,
		sidePagination: 'server',
		silentSort: false,
		smartDisplay: false,
		escape: true,
		searchOnEnterKey: true,
		idField: 'userId',
		maintainSelected: true,
		toolbar: '#toolbar',
		onCheck: setOperation,
		onUncheck: setOperation,
		columns: [
					{field: 'ck', checkbox: true},
					{field: 'userId', title: '编号', sortable: true, align: 'center'},
		            {field: 'username', title: '帐号'},
					{field: 'realname', title: '姓名'},
					{field: 'avatar', title: '头像', align: 'center', formatter: 'avatarFormatter'},
					{field: 'phone', title: '电话'},
					{field: 'email', title: '邮箱'},
					{field: 'sex', title: '性别', formatter: 'sexFormatter'},
					{field: 'locked', title: '状态', sortable: true, align: 'center', formatter: 'lockedFormatter'},
					{field: 'action', title: '操作', align: 'center', formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false}
				]
	});
	
}

// 格式化操作按钮
function actionFormatter(value, row, index) {
    return [
		'<a class="update" href="javascript:;" onclick="updateAction(\''+index+'\')" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
		'<a class="delete" href="javascript:;" onclick="deleteAction(\''+index+'\')" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}
// 格式化图标
function avatarFormatter(value, row, index) {
    return '<img src="${basePath}' + value + '" style="width:20px;height:20px;"/>';
}
// 格式化性别
function sexFormatter(value, row, index) {
	if (value == 1) {
		return '男';
	}
	if (value == 0) {
		return '女';
	}
	return '-';
}
// 格式化状态
function lockedFormatter(value, row, index) {
	if (value == 1) {
		return '<span class="label label-default">锁定</span>';
	} else {
		return '<span class="label label-success">正常</span>';
	}
}

/*Menu Actions*/
// 新增
function createAction() {
	initData("create");
	setTabTitle("新增用户");
	gotoDetailsTab();
}
// 编辑
function updateAction(index) {
	if(index){
		//Fired by action button,check the row
		$table.bootstrapTable('uncheckAll');
		$table.bootstrapTable('check',index);
	}
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
	} else {
		initData();
		gotoDetailsTab();
	}
}
// 删除
var deleteDialog;
function deleteAction(index) {
	if(index){
		//Fired by action button,check the row
		$table.bootstrapTable('uncheckAll');
		$table.bootstrapTable('check',index);
	}
	var rows = $table.bootstrapTable('getSelections');
	
	if (rows.length == 0) {
		$.confirm({
			title: false,
			content: '请至少选择一条记录！',
			autoClose: 'cancel|3000',
			backgroundDismiss: true,
			buttons: {
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	} else {
		deleteDialog = $.confirm({
			type: 'red',
			animationSpeed: 300,
			title: false,
			content: '确认删除该用户吗？',
			buttons: {
				confirm: {
					text: '确认',
					btnClass: 'waves-effect waves-button',
					action: function () {
						var ids = new Array();
						for (var i in rows) {
							ids.push(rows[i].userId);
						}
						$.ajax({
							type: 'get',
							url: '${basePath}/manage/user/delete/' + ids.join(","),
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
									deleteDialog.close();
									$table.bootstrapTable('refresh');
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
				},
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	}
}
// 用户组织
var organizationDialog;
var organizationUserId;
function organizationAction() {
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
	} else {
		organizationUserId = rows[0].userId;
		organizationDialog = $.dialog({
			animationSpeed: 300,
			title: '用户组织',
			content: 'url:${basePath}/manage/user/organization/' + organizationUserId,
			onContentReady: function () {
				initMaterialInput();
				$('select').select2({
					placeholder: '请选择用户组织',
					allowClear: true
				});
			}
		});
	}
}
// 用户角色
var roleDialog;
var roleUserId;
function roleAction() {
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
	} else {
		roleUserId = rows[0].userId;
		roleDialog = $.dialog({
			animationSpeed: 300,
			title: '用户角色',
			content: 'url:${basePath}/manage/user/role/' + roleUserId,
			onContentReady: function () {
				initMaterialInput();
				$('select').select2({
					placeholder: '请选择用户角色',
					allowClear: true
				});
			}
		});
	}
}
// 用户权限
var permissionDialog;
var permissionUserId;
function permissionAction() {
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
	} else {
		permissionUserId = rows[0].userId;
		permissionDialog = $.dialog({
			animationSpeed: 300,
			title: '用户授权',
			columnClass: 'large',
			content: 'url:${basePath}/manage/user/permission/' + permissionUserId,
			onContentReady: function () {
				initMaterialInput();
				initTree();
			}
		});
	}
}

/*Subset start*/
var subsetDialog;
//添加子集数据
function createSubsetForm(tableId, tableName){
	var userId = $("#guserId").val();
	if(!guserId){
		$.confirm({
			title: false,
			content: '请在用户列表中选择一个用户！',
			autoClose: 'cancel|3000',
			backgroundDismiss: true,
			buttons: {
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	}else{
		subsetDialog = $.dialog({
			animationSpeed: 300,
			title: '新增子集数据',
			content: 'url:${basePath}/manage/user/createSubsetForm',
			onContentReady: function () {
				initMaterialInput();
				//获取子集的列信息并创建相应的form
				createSubsetClumns(tableId, tableName, userId, null);
			}
		});
	}
}

//新增子集
var subsetTableDialog;
function createSubsetTable(){
	subsetTableDialog = $.dialog({
		animationSpeed: 300,
		title: '新增子集',
		content: 'url:${basePath}/manage/user/createSubsetTable',
		onContentReady: function () {
			initMaterialInput();
		}
	});
}

//获取相关子集（加载tab页）
function loadTabPage(/* treeNode */){
	$(".forRemove").remove();
	$.ajax({
		type: 'get',
		url: '${basePath}/manage/user/getSysTableinfo?type=3',
		success: function(data) {
			
	        if(data.rows != null && data.rows.length != 0){
	        	var len = data.rows.length;
	        	var tabId = "tab";
	        	for(var i = 0; i < len; i++){
	        		//console.log(data.rows[i].enTableName)
	        		$("#myTab").append('<li class="forRemove"><a href="#'+(tabId + i)+'" data-toggle="tab" onclick="createTable(\'table'+i+'\',\''+data.rows[i].enTableName+'\')">'+data.rows[i].cnTableName+'</a></li>');
	        		$("#myTabContent").append('<div class="tab-pane fade forRemove" id="'+(tabId + i)+'">'+
	        				'<div class="fixed-table-toolbar"><div class="bs-bars pull-left"><div id="toolbar'+i+'">'+
								'<shiro:hasPermission name="upms:user:createSubset"><a class="waves-effect waves-button" href="javascript:;" onclick="createSubsetForm(\'table'+i+'\',\''+data.rows[i].enTableName+'\')"><i class="zmdi zmdi-plus"></i> 新增</a></shiro:hasPermission>'+
								'<shiro:hasPermission name="upms:user:createSubset"><a class="waves-effect waves-button" href="javascript:;" onclick="updateSubsetData(\''+data.rows[i].enTableName+'\',\'table'+i+'\')"><i class="zmdi zmdi-edit"></i> 编辑</a></shiro:hasPermission>'+
								'<shiro:hasPermission name="upms:user:createSubset"><a class="waves-effect waves-button" href="javascript:;" onclick="deletebsetData(\'table'+i+'\',\''+data.rows[i].enTableName+'\')"><i class="zmdi zmdi-close"></i> 删除</a></shiro:hasPermission>'+
								'<shiro:hasPermission name="upms:user:createSubset"><a class="waves-effect waves-button" href="javascript:;" onclick="creatrSubSetColumn(\'table'+i +'\',\''+data.rows[i].enTableName+'\')"><i class="zmdi zmdi-close"></i> 新增子集属性</a></shiro:hasPermission>'+
							'</div></div></div>'+
	        				'<table id="table'+i+'"></table></div>');
	        	} 
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

function queryParams(params){
    return {
        limit : params.limit,
        offset : params.offset,
        order : params.order,
        search : params.search,
        sort : params.sort,
        userId : guserId
    }
}

//动态生成table表格列
function createTable(tableId,tableName){
	var option = {
			url: '${basePath}/manage/user/getDataInfoPage?tableName='+tableName,
			height: getHeight(),
			striped: true,
			search: true,
			showRefresh: true,
			showColumns: true,
			minimumCountColumns: 2,
			clickToSelect: true,
			detailView: true,
			detailFormatter: 'detailFormatter',
			pagination: true,
			paginationLoop: false,
			sidePagination: 'server',
			silentSort: false,
			smartDisplay: false,
			escape: true,
			searchOnEnterKey: true,
			maintainSelected: true,
			queryParams: queryParams,//请求服务器时所传的参数
			//toolbar: '#toolbar',
			columns: [],//getTableColumns(tableId,tableName),
			//数据加载成功后执行
			onLoadSuccess: function(data){
			}
		}
	getTableColumns(tableId,tableName,option)
}

//动态获取表的列信息
function getTableColumns(tableId,tableName,option){
	//获取列信息
	$.ajax({
		type: 'get',
		url: '${basePath}/manage/user/getSysColumnInfo?type=3&tableName='+tableName,
		success: function(data) {
			//console.log(data)
			var cloumns = [];
			cloumns[0] = {field: 'ck', checkbox: true};
			cloumns[1] = {field: 'subId', title:"业务主键"};
	        if(data.rows != null && data.rows.length != 0){
	        	var obj = {};
	        	for(var i = 0; i < data.rows.length; i++){
	        		obj = {field: data.rows[i].enColName, title: data.rows[i].cnColName, align: 'center'};
	        		cloumns[i+2] = obj;
	        	}
	        	//console.log(cloumns)
	        }
	        option.columns = cloumns;
	        //加载表格
	        var table = $("#"+tableId);
	        table.bootstrapTable("destroy");
	        table.bootstrapTable(option);
	        //load data
	        //table.bootstrapTable("refresh");
	        //隐藏列
	        //$("#"+tableId).bootstrapTable('hideColumn', 'subId');
	      	//获取子集 详细数据信息
			//getDataInfo(tableId,tableName);
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
/*
//获取子集详细信息
function getDataInfo(tableId,tableName){
	$.ajax({
		type: 'get',
		url: '${basePath}/manage/user/getDataInfoPage?tableName='+tableName+'&userId='+guserId,	
		success: function(data) {
			//console.log(data)
			//刷新表格，加载数据
			if(data.rows == null || data.rows.length == 0){
				$("#"+tableId).bootstrapTable('load',{"total":0,"rows":[]});
			}else{
				$("#"+tableId).bootstrapTable('load',data); 
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
*/
/*子集属性*/
//新增子集属性
var subsetColumnDialog;
function creatrSubSetColumn(tableId,tableName){
	var name = tableName;
	subsetColumnDialog = $.dialog({
		animationSpeed: 300,
		title: '新增子集属性',
		content: 'url:${basePath}/manage/user/createSubsetColumn',
		onContentReady: function () {
			initMaterialInput();
			$('select').select2();
			$('#attribute').select2().val("0").trigger('change');
			$("#tableName").val(name);
		},
		onClose: function () {
			//$("#"+tableId).bootstrapTable("destroy");
	        createTable(tableId,name);
		}
	});
}
//编辑子集数据
function updateSubsetData(tableName,tableId){
	//var userId = $("#guserId").val();
	var rows = $("#"+tableId).bootstrapTable('getSelections');//选中的某行数据
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
	} else {
		subsetDialog = $.dialog({
			animationSpeed: 300,
			title: '新增子集数据',
			content: 'url:${basePath}/manage/user/createSubsetForm',
			onContentReady: function () {
				initMaterialInput();
				//获取子集的列信息并创建相应的form
				createSubsetClumns(tableId, tableName, guserId, rows);
			}
		});
	}
}
//删除子集数据
function deletebsetData(tableId, tableName){
	
	var rows = $("#"+tableId).bootstrapTable('getSelections');//选中的某行数据
	
	if (rows.length == 0) {
		$.confirm({
			title: false,
			content: '请至少选择一条记录！',
			autoClose: 'cancel|3000',
			backgroundDismiss: true,
			buttons: {
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	} else {
		var ids = new Array();
		for (var i in rows) {
			ids.push(rows[i].subId);
		}
		
		deleteDialog = $.confirm({
			type: 'red',
			animationSpeed: 300,
			title: false,
			content: '确认删除该数据吗？',
			buttons: {
				confirm: {
					text: '确认',
					btnClass: 'waves-effect waves-button',
					action: function () {
						$.ajax({
							type: 'get',
							url: '${basePath}/manage/user/deletebsetData/'+tableName+'/'+ids.join(","),
							//url: '${basePath}/manage/user/delete/' + ids.join(","),
							success: function(result) {
								//刷新表格
					        	createTable(tableId,tableName);
					        	subsetDialog.close();
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
				},
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	}
}



</script>
</body>
</html>