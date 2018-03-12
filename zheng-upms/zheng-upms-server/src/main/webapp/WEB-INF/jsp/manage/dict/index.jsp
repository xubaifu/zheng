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
	<title>字典管理</title>
	<jsp:include page="/resources/inc/head.jsp" flush="true"/>
</head>
<body>
<div style="height: 100%">
	<div id="treepage" class="unfolded">
		<div>
			<ul id="tree" class="ztree"></ul>
		</div>
	</div>
	<div id="treepagebtn" class="unfolded-btn">
		<div id="openClose" class="close" style="height: 100%;" onclick="shrinkage()">&nbsp;</div>
	</div>
	<div id="main" class="treepage-main">
		<div id="toolbar">
			<shiro:hasPermission name="upms:dict:create"><a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增</a></shiro:hasPermission>
			<%-- <shiro:hasPermission name="upms:dict:create"><a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增字典数据</a></shiro:hasPermission> --%>
			<shiro:hasPermission name="upms:dict:update"><a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i> 编辑</a></shiro:hasPermission>
			<shiro:hasPermission name="upms:dict:delete"><a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction()"><i class="zmdi zmdi-close"></i> 删除</a></shiro:hasPermission>
		</div>
		<table id="table"></table>
	</div>
</div>
<jsp:include page="/resources/inc/footer.jsp" flush="true"/>
<script>

$(document).ready(function() {
	loadDictTable();
	getDictist();
});
var setting = {
		data : {
			key : {
				title : "title"
			},
			simpleData : {
				enable : true
			}
		},
		callback : {
			//beforeClick : beforeClick,
			onClick : onClick
		}
	};
	var zNodes =[];
	var log, className = "dark";
	function beforeClick(treeId, treeNode, clickFlag) {
		/* console.log("treeId=" + treeId + ";treeNode=" + treeNode
				+ ";clickFlag=" + clickFlag);
		console.log(treeNode.id+";"+treeNode.pId); */
	}
	function onClick(event, treeId, treeNode, clickFlag) {
		$('#table').bootstrapTable(
	            "refresh",  
	            {  
	                url:'${basePath}/manage/dict/list?dictId='+treeNode.id
	            }  
	    );
	}
	
	//获取字典类型列表
	function getDictist(){
		 $.ajax({
		        type: 'get',
		        url: '${basePath}/manage/dict/listAll',
		        data: {},
		        success: function(data) {
		        	//console.log(data)
		        	zNodes = data.rows;
		        	zNodes = data.rows;
					for(var i = 0; i < data.rows.length; i++){
						zNodes[i].id = data.rows[i].id;
						zNodes[i].pId = data.rows[i].parentId;
						zNodes[i].name = data.rows[i].label;
						zNodes[i].title = data.rows[i].label;
					}
					$.fn.zTree.init($("#tree"), setting, zNodes);
		        }
		    });
	}

	//新增编辑页面的ztree设置（setting）
	var settingForCreate = {
			data : {
				key : {
					title : "title"
				},
				simpleData : {
					enable : true
				}
			},
			callback : {
				//beforeClick : beforeClick,
				onClick : onClickForCheck
			}
		};
	//加载字典列表
	function loadDict(){
		$("#dicttree").show();
		$.fn.zTree.init($("#treeDict"), settingForCreate, zNodes);
		//设置节点选中
		var treeObj = $.fn.zTree.getZTreeObj("treeDict");
		var node = treeObj.getNodeByParam("id", $('#pid').val());
		treeObj.selectNode(node);
		settingForCreate.callback.onClick = onClickForCheck;
		
	}
	//选中节点，将节点的信息添加到相应的input框
	function onClickForCheck(event, treeId, treeNode, clickFlag){
		$("#parentId").val(treeNode.id);
		$("#labelName").val(treeNode.name);
		$("#pidLable").addClass('active');
	}

var $table = $('#table');
function loadDictTable(){
	// bootstrap table初始化
	$table.bootstrapTable({
		url: '${basePath}/manage/dict/list',
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
		idField: 'id',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'ck', checkbox: true},
			{field: 'id', title: '编号',align: 'center', visible: false},
            {field: 'type', title: '类型'},
			{field: 'value', title: '键值'},
			{field: 'label', title: '标签'},
			{field: 'description', title: '描述'},
			{field: 'delFlag', title: '状态', align: 'center', formatter: 'statusFormatter'},
			{field: 'action', title: '操作', align: 'center', formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false}
		]
	});
}
// 格式化操作按钮
function actionFormatter(value, row, index) {
    return [
		'<a class="update" href="javascript:;" onclick="updateAction(\''+row.id+'\')" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
		'<a class="delete" href="javascript:;" onclick="deleteAction(\''+row.id+'\')" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}
/* // 格式化图标
function iconFormatter(value, row, index) {
    return '<i class="' + value + '"></i>';
}
// 格式化类型
function typeFormatter(value, row, index) {
	if (value == 1) {
		return '目录';
	}
	if (value == 2) {
		return '菜单';
	}
	if (value == 3) {
		return '按钮';
	}
	return '-';
} */
// 格式化状态
function statusFormatter(value, row, index) {
	if (value == 0) {
		return '<span class="label label-success">正常</span>';
	} else {
		return '<span class="label label-default">弃用</span>';
	}
}
// 新增
var createDialog;
function createAction() {
	createDialog = $.dialog({
		animationSpeed: 300,
		title: '新增字典',
		content: 'url:${basePath}/manage/dict/create',
		onContentReady: function () {
			initMaterialInput();
			$('select').select2();
		}
	});
}
// 编辑
var updateDialog;
function updateAction(id) {
	var rows = $table.bootstrapTable('getSelections');
	if ((id == null || id == 'undefined') && rows.length != 1) {
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
		var url = '';
		if(id == null || id == 'undefined'){//是否传入organizationId
			url = 'url:${basePath}/manage/dict/update/' + rows[0].id;
		}else{
			url = 'url:${basePath}/manage/dict/update/' + id;
		}
		updateDialog = $.dialog({
			animationSpeed: 300,
			title: '编辑字典',
			content: url,
			onContentReady: function () {
				initMaterialInput();
				$('select').select2();
				
			}
		});
	}
}
// 删除
var deleteDialog;
function deleteAction(id) {
	var rows = $table.bootstrapTable('getSelections');
	if ((id == null || id == 'undefined') && rows.length == 0) {
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
		if(id == null || id == 'undefined'){
			for (var i in rows) {
				ids.push(rows[i].id);
			}
		}else{
			ids.push(id);
		}
		deleteDialog = $.confirm({
			type: 'red',
			animationSpeed: 300,
			title: false,
			content: '确认删除该字典数据吗？',
			buttons: {
				confirm: {
					text: '确认',
					btnClass: 'waves-effect waves-button',
					action: function () {
						console.log(ids);
						/* var ids = new Array();
						for (var i in rows) {
							ids.push(rows[i].id);
						} */
						$.ajax({
							type: 'get',
							url: '${basePath}/manage/dict/delete/' + ids.join(","),
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
</script>
</body>
</html>