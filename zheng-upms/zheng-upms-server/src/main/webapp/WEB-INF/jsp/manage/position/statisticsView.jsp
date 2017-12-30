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
	<title>岗位统计</title>
	<jsp:include page="/resources/inc/head.jsp" flush="true"/>
	<style type="text/css">
		::-webkit-scrollbar{width:5px;height: 5px}
		::-webkit-scrollbar-track{background-color:#bee1eb;}
		::-webkit-scrollbar-thumb{background-color:rgba(0,0,0,.2);}
		/* ::-webkit-scrollbar-thumb<a href="https://www.baidu.com/s?wd=%3Ahover&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YLm16suWTkmW9-uWfYm1cv0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EP1RkPjRYP1TvPHf3rjRsnW0Y" target="_blank" class="baidu-highlight">:hover</a> {background-color:#9c3} */
		::-webkit-scrollbar-thumb:active {background-color:rgba(0,0,0,.2)}
		</style>
</head>
<body>


<div style="height: 100%">
	<div id="treepage" class="unfolded">
		<div>
			<ul class="nav nav-tabs">
				<li class="active"><a style="padding: 5px 5px" href="#organizationView" data-toggle="tab" onclick="getOrganizationList()">部门视角</a></li>
				<li><a style="padding: 5px 5px" href="#positionView" data-toggle="tab" onclick="getPositionList('POS')">岗位视角</a></li>
				<li><a style="padding: 5px 5px" href="#userView" data-toggle="tab" onclick="getPositionList('USER')">人员视角</a></li>
			</ul>
		</div>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="organizationView">
				<ul id="treeOrg" class="ztree"></ul>
			</div>
			<div class="tab-pane fade" id="positionView">
				<ul id="treePosition" class="ztree"></ul>
			</div>
			<div class="tab-pane fade" id="userView">
				<ul id="treeUser" class="ztree"></ul>
			</div>
		</div>
	</div>
	<div id="treepagebtn" class="unfolded-btn">
		<div id="openClose" class="close" style="height: 100%;" onclick="shrinkage()">&nbsp;</div>
	</div>
	<div id="main" class="treepage-main">
		<!-- <div style="overflow-x: auto;">
			<div id="tabPage" style="height: 40px">
				<ul id="myTab" class="nav nav-tabs">
					<li id="positionList" class="active"><a href="#listtableBySelected" data-toggle="tab">岗位列表</a></li>
					<li id="firstLi"><a href="#listtable" data-toggle="tab">基本信息</a></li>
					<li><a href="#ios" data-toggle="tab">iOS</a></li>
					<li><a href="#ios" data-toggle="tab">iOS</a></li>
				</ul>
			</div>
		</div> -->
		<div id="myTabContent" class="tab-content">
			<!-- 选中岗位列表以及子岗位列表 -->
			<div class="tab-pane fade in active" id="listtableBySelected" style="height: 212px; padding-bottom: 40px;">
				<div id="toolbar">
					<shiro:hasPermission name="upms:position:addPosition"><a id="addPosition" class="waves-effect waves-button" href="javascript:;" onclick="addPositionFun()"><i class="zmdi zmdi-plus"></i> 添加岗位</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:addOrg"><a id="addOrg" style="display: none" class="waves-effect waves-button" href="javascript:;" onclick="addOrgFun()"><i class="zmdi zmdi-plus"></i> 添加组织</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:addUser"><a id="addUser" style="display: none" class="waves-effect waves-button" href="javascript:;" onclick="addUserFun()"><i class="zmdi zmdi-plus"></i> 添加人员</a></shiro:hasPermission>
				</div>
				<table id="tableBySelected">sdfghdh</table>
			</div>
			<!-- 选中岗位基本信息以及子集信息 -->
			<div class="tab-pane fade in active" id="listtable">
				<table id="table"></table>
			</div>
			
			<!-- <div class="tab-pane fade" id="ios">
				<p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple 
					TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
			</div> -->
		</div>
	</div>

</div>
<jsp:include page="/resources/inc/footer.jsp" flush="true"/>
<script>
	$(document).ready(function() {
		//$.fn.zTree.init($("#tree"), setting, zNodes);
		getPositionList(positionType);
		getOrganizationList();
	});
	var userType = "USER";
	var orgType = "ORG";
	var positionType = "POS";

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
			beforeClick : beforeClick,
			onClick : onClick
		}
	};
	var zNodes =[];
	var zNodesPosition =[];
	var zNodesOrg =[];
	var log, className = "dark";
	function beforeClick(treeId, treeNode, clickFlag) {
		
	}
	function onClick(event, treeId, treeNode, clickFlag) {
		
	}
	
	//获取所有组织列表
	function getOrganizationList() {
		$("#toolbar").children().hide();
		$("#addPosition").show();
		if($("#treeOrg").children().length !=0){
			return;
		}
		//获取所有组织列表
		$.ajax({
			type : 'get',
			url : '${basePath}/manage/organization/listAll',
			data : {},
			success : function(data) {
				//console.log(data)
				zNodes = data.rows;
				zNodesOrg = data.rows;
				for (var i = 0; i < data.rows.length; i++) {
					zNodes[i].id = data.rows[i].organizationId;
					zNodes[i].pId = data.rows[i].pid;
					zNodes[i].name = data.rows[i].name;
					zNodes[i].title = data.rows[i].name;
					zNodes[i].type = orgType;
				}
				$.fn.zTree.init($("#treeOrg"), setting, zNodes);
			}
		});
	}
	//获取岗位列表
	function getPositionList(type) {
		$("#toolbar").children().hide();
		if(type == userType){
			$("#addUser").show();
		}
		if(type == positionType){
			$("#addOrg").show();
		}
		
		if(type == userType && $("#treeUser").children().length !=0){
			return;
		}
		if(type == positionType && $("#treePosition").children().length !=0){
			return;
		}
		//获取所有岗位列表
		$.ajax({
			type : 'get',
			url : '${basePath}/manage/position/listAll',
			data : {},
			success : function(data) {
				//console.log(data)
				zNodes = data.rows;
				zNodesPosition = data.rows;
				for (var i = 0; i < data.rows.length; i++) {
					zNodes[i].id = data.rows[i].positionId;
					zNodes[i].pId = data.rows[i].pid;
					zNodes[i].name = data.rows[i].name;
					zNodes[i].title = data.rows[i].name;
					if(type == userType){
						zNodes[i].type = userType;
					}
					if(type == positionType){
						zNodes[i].type = positionType;
					}
				}
				if(type == userType){
					$.fn.zTree.init($("#treeUser"), setting, zNodes);
				}
				if(type == positionType){
					$.fn.zTree.init($("#treePosition"), setting, zNodes);
				}
			}
		});
	}
	var addDialog;
	//添加岗位
	function addPositionFun(){
		var treeObj = $.fn.zTree.getZTreeObj("treeOrg").getSelectedNodes();
		if(treeObj == null || treeObj.length == 0){
			$.confirm({
				title: false,
				content: '请选择部门！',
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
			addDialog = $.dialog({
				animationSpeed: 300,
				title: '添加岗位',
				content: 'url:${basePath}/manage/positionStatistics/addPosition',
				onContentReady: function () {
					initMaterialInput();
					loadPosition();
				}
			});
		}
	}
	//加载岗位树结构
	function loadPosition(){
		$.fn.zTree.init($("#positionTree"), settingForPosition, zNodesPosition);
		/* //设置节点选中
		var treeObj = $.fn.zTree.getZTreeObj("positionTree");
		var node = treeObj.getNodeByParam("id", $('#pid').val());
		treeObj.selectNode(node); */
		//settingForPosition.callback.onClick = onClickForCheck;
	}
	//添加组织
	function addOrgFun(){
		var treeObj = $.fn.zTree.getZTreeObj("treePosition").getSelectedNodes();
		if(treeObj == null || treeObj.length == 0){
			$.confirm({
				title: false,
				content: '请选择岗位！',
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
			addDialog = $.dialog({
				animationSpeed: 300,
				title: '添加组织',
				content: 'url:${basePath}/manage/positionStatistics/addOrg',
				onContentReady: function () {
					initMaterialInput();
					loadOrganization();
				}
			});
		}
	}
	//加载组织结构树结构
	function loadOrganization(){
		$.fn.zTree.init($("#orgTree"), settingForOrg, zNodesOrg);
		/* //设置节点选中
		var treeObj = $.fn.zTree.getZTreeObj("positionTree");
		var node = treeObj.getNodeByParam("id", $('#pid').val());
		treeObj.selectNode(node); */
		//settingForPosition.callback.onClick = onClickForCheck;
	}
	//添加人员
	function addUserFun(){
		var treeObj = $.fn.zTree.getZTreeObj("treeUser").getSelectedNodes();
		if(treeObj == null || treeObj.length == 0){
			$.confirm({
				title: false,
				content: '请选择岗位！',
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
			alert("添加人员");
		}
	}
	//获取选中节点以及所有子节点
	function getAllChildrenNodes(treeNode, result) {
		if (treeNode.isParent) {
			result += treeNode.id + ',';
			var childrenNodes = treeNode.children;
			if (childrenNodes) {
				for (var i = 0; i < childrenNodes.length; i++) {
					result += childrenNodes[i].id + ',';
					result = getAllChildrenNodes(childrenNodes[i], result);
				}
			}
		}
		return result;
	}
	//获取选中节点的所有叶子节点
	function getAllLeavesNodes(treeNode, result) {
		if (treeNode.isParent) {
			var childrenNodes = treeNode.children;
			//console.log(childrenNodes);
				
			if (childrenNodes) {
				for (var i = 0; i < childrenNodes.length; i++) {
					if(!childrenNodes[i].children){
						result += childrenNodes[i].id + ',';
					}
					result = getAllLeavesNodes(childrenNodes[i], result);
				}
			}
		}
		return result;
		
	}
</script>
</body>
</html>
