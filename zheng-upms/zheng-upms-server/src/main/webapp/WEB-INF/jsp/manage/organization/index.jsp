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
	<title>组织管理</title>
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
			<shiro:hasPermission name="upms:organization:create"><a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增组织</a></shiro:hasPermission>
			<shiro:hasPermission name="upms:organization:update"><a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i> 编辑组织</a></shiro:hasPermission>
			<shiro:hasPermission name="upms:organization:delete"><a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction()"><i class="zmdi zmdi-close"></i> 删除组织</a></shiro:hasPermission>
		</div>
		<table id="table"></table>
	</div>

</div>
<jsp:include page="/resources/inc/footer.jsp" flush="true"/>
	<script>
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
		var zNodes =[
			 /* { id:1, pId:0, name:"普通的父节点", title:"我很普通，随便点我吧"},
			{ id:11, pId:1, name:"叶子节点 - 1", title:"我很普通，随便点我吧"},
			{ id:12, pId:1, name:"叶子节点 - 2", title:"我很普通，随便点我吧"},
			{ id:13, pId:1, name:"叶子节点 - 3", title:"我很普通，随便点我吧"},
			{ id:2, pId:0, name:"NB的父节点", title:"点我可以，但是不能点我的子节点，有本事点一个你试试看？"},
			{ id:21, pId:2, name:"叶子节点2 - 1", title:"你哪个单位的？敢随便点我？小心点儿.."},
			{ id:22, pId:2, name:"叶子节点2 - 2", title:"我有老爸罩着呢，点击我的小心点儿.."},
			{ id:23, pId:2, name:"叶子节点2 - 3", title:"好歹我也是个领导，别普通群众就来点击我.."},
			{ id:3, pId:0, name:"郁闷的父节点", title:"别点我，我好害怕...我的子节点随便点吧..."},
			{ id:31, pId:3, name:"叶子节点3 - 1", title:"唉，随便点我吧"},
			{ id:32, pId:3, name:"叶子节点3 - 2", title:"唉，随便点我吧"},
			{ id:33, pId:3, name:"叶子节点3 - 3", title:"唉，随便点我吧"}  */
		];
		var log, className = "dark";
		function beforeClick(treeId, treeNode, clickFlag) {
			console.log("treeId=" + treeId + ";treeNode=" + treeNode
					+ ";clickFlag=" + clickFlag);
			console.log(treeNode.id+";"+treeNode.pId);
		}
		function onClick(event, treeId, treeNode, clickFlag) {
			getOrganizationList(treeNode);
			//$table.bootstrapTable('refresh');
		}

		$(document).ready(function() {
			//$.fn.zTree.init($("#tree"), setting, zNodes);
			getOrganizationList();
		});
	</script>
	<script>
var $table = $('#table');
$(function() {
	// bootstrap table初始化
	$table.bootstrapTable({
		url: '${basePath}/manage/organization/list',
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
		idField: 'organizationId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'ck', checkbox: true},
			{field: 'organizationId', title: '编号', sortable: true, align: 'center'},
			{field: 'name', title: '组织名称',sortable: true},
            {field: 'description', title: '组织描述'},
			{field: 'action', title: '操作', align: 'center', formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false}
		],
		//数据加载成功后执行，加载树结构
		onLoadSuccess: function(data){
			//alert(1);
		},
	});
});
//获取组织列表
function getOrganizationList(treeNode){
	console.log(treeNode);
	//获取所有组织列表
	if(treeNode == null || treeNode == "undefined"){
		 $.ajax({
		        type: 'get',
		        url: '${basePath}/manage/organization/list',
		        data: {},
		        success: function(data) {
		        	zNodes = data.rows;
					for(var i = 0; i < data.rows.length; i++){
						zNodes[i].id = data.rows[i].organizationId;
						zNodes[i].pId = data.rows[i].pid;
						zNodes[i].name = data.rows[i].name;
						zNodes[i].title = data.rows[i].name;
					}
					$.fn.zTree.init($("#tree"), setting, zNodes);
		        }
		    });
	}else{
		//获取某组织以及下一级组织列表，并刷新table
		$table.bootstrapTable(  
	              "refresh",  
	              {  
	                  url:'${basePath}/manage/organization/list?id='+treeNode.id
	              }  
	      );  
	}
}
// 格式化操作按钮
function actionFormatter(value, row, index) {
    return [
		'<a class="update" href="javascript:;" onclick="updateAction('+row.organizationId+')" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
		'<a class="delete" href="javascript:;" onclick="deleteAction('+row.organizationId+')" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}
// 新增
var createDialog;
function createAction() {
	createDialog = $.dialog({
		animationSpeed: 300,
		title: '新增组织',
		content: 'url:${basePath}/manage/organization/create',
		onContentReady: function () {
			initMaterialInput();
		}
	});
}
// 编辑
var updateDialog;
function updateAction(organizationId) {//根据是否传入organizationId，判断点击的按钮
	var rows = $table.bootstrapTable('getSelections');//选中的某行数据
	
	if ((organizationId == null || organizationId == 'undefined') && rows.length != 1) {
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
		if(organizationId == null || organizationId == 'undefined'){//是否传入organizationId
			url = 'url:${basePath}/manage/organization/update/' + rows[0].organizationId;
		}else{
			url = 'url:${basePath}/manage/organization/update/' + organizationId;
		}
		updateDialog = $.dialog({
			animationSpeed: 300,
			title: '编辑组织',
			content: url,
			onContentReady: function () {
				initMaterialInput();
			}
		});
	}
}
// 删除
var deleteDialog;
function deleteAction(organizationId) {//根据是否传入organizationId，判断点击的按钮
	var rows = $table.bootstrapTable('getSelections');
	if ((organizationId == null || organizationId == 'undefined') && rows.length == 0) {
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
		if(organizationId == null || organizationId == 'undefined'){
			for (var i in rows) {
				ids.push(rows[i].organizationId);
			}
		}else{
			ids.push(organizationId);
		}
		deleteDialog = $.confirm({
			type: 'red',
			animationSpeed: 300,
			title: false,
			content: '确认删除该组织吗？',
			buttons: {
				confirm: {
					text: '确认',
					btnClass: 'waves-effect waves-button',
					action: function () {
						$.ajax({
							type: 'get',
							url: '${basePath}/manage/organization/delete/' + ids.join("-"),
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
									getOrganizationList();
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
//加载组织机构
function loadOrganization(){
	$("#orgtree").show();
	$.fn.zTree.init($("#treeDemo"), settingForCreate, zNodes);
	//设置节点选中
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	var node = treeObj.getNodeByParam("id", $('#pid').val());
	treeObj.selectNode(node);
	settingForCreate.callback.onClick = onClickForCheck;
	
}
//选中节点，将节点的信息添加到相应的input框
function onClickForCheck(event, treeId, treeNode, clickFlag){
	$("#pid").val(treeNode.id);
	$("#pName").val(treeNode.name);
	$("#pidLable").addClass('active');
}
</script>
</body>
</html>