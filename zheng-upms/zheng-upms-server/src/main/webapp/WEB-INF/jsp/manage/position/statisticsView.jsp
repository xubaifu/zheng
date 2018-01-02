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
	<!-- <div id="treepagebtn" class="unfolded-btn">
		<div id="openClose" class="close" style="height: 100%;" onclick="shrinkage()">&nbsp;</div>
	</div> -->
	<div id="main" class="treepage-main">
		<%-- <div id="myTabContent" class="tab-content">
			<!-- 选中岗位列表以及子岗位列表 -->
			<div class="tab-pane fade in active" id="listtableBySelected" style="height: 212px; padding-bottom: 40px;">
				<div id="toolbar">
					<shiro:hasPermission name="upms:position:addPosition"><a id="addPosition" class="waves-effect waves-button" href="javascript:;" onclick="addPositionFun()"><i class="zmdi zmdi-plus"></i> 添加岗位</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:addOrg"><a id="addOrg" style="display: none" class="waves-effect waves-button" href="javascript:;" onclick="addOrgFun()"><i class="zmdi zmdi-plus"></i> 添加组织</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:addUser"><a id="addUser" style="display: none" class="waves-effect waves-button" href="javascript:;" onclick="addUserFun()"><i class="zmdi zmdi-plus"></i> 添加人员</a></shiro:hasPermission>
				</div>
				<input id="organizationId" style="display: none;">
				<input id="positionId" style="display: none;">
				<div id="tableByPositionDiv" style="display: none;"><table id="tableByPosition"></table></div>
				<!-- <div id="tableByOrgDiv" style="display: none;"><table id="tableByOrg"></table></div>
				<div id="tableByUserDiv" style="display: none;"><table id="tableByUser"></table></div> -->
			</div>
		</div> --%>
		<input id="organizationId" style="display: none;">
		<input id="positionId" style="display: none;">
		<!-- 岗位列表 -->
		<div id="myTabContent1" class="tab-content" style="display: none">
			<div class="tab-pane fade in active" id="listtableBySelected1" style="height: 212px; padding-bottom: 40px;">
				<div id="addPosition" >
					<shiro:hasPermission name="upms:position:addPosition"><a id="" class="waves-effect waves-button" href="javascript:;" onclick="addPositionFun()"><i class="zmdi zmdi-plus"></i> 添加岗位</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:delPosition"><a id="" class="waves-effect waves-button" href="javascript:;" onclick="delPositionFun()"><i class="zmdi zmdi-plus"></i> 删除岗位</a></shiro:hasPermission>
				</div>
				<table id="tableByPosition"></table>
			</div>
		</div>
		<!-- 组织列表 -->
		<div id="myTabContent2" class="tab-content" style="display: none">
			<div class="tab-pane fade in active" id="listtableBySelected2" style="height: 212px; padding-bottom: 40px;">
				<div id="addOrg" >
					<shiro:hasPermission name="upms:position:addOrg"><a class="waves-effect waves-button" href="javascript:;" onclick="addOrgFun()"><i class="zmdi zmdi-plus"></i> 添加组织</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:delOrg"><a class="waves-effect waves-button" href="javascript:;" onclick="delOrgFun()"><i class="zmdi zmdi-plus"></i> 删除组织</a></shiro:hasPermission>
				</div>
				<table id="tableByOrg"></table>
			</div>
		</div>
		<!-- 人员列表 -->
		<div id="myTabContent3" class="tab-content" style="display: none">
			<div class="tab-pane fade in active" id="listtableBySelected3" style="height: 212px; padding-bottom: 40px;">
				<div id="addUser" >
					<shiro:hasPermission name="upms:position:addUser"><a class="waves-effect waves-button" href="javascript:;" onclick="addUserFun()"><i class="zmdi zmdi-plus"></i> 添加人员</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:delUser"><a class="waves-effect waves-button" href="javascript:;" onclick="delUserFun()"><i class="zmdi zmdi-plus"></i> 删除人员</a></shiro:hasPermission>
				</div>
				<table id="tableByUser"></table>
			</div>
		</div>
	</div>

</div>
<jsp:include page="/resources/inc/footer.jsp" flush="true"/>
<script>
	$(document).ready(function() {
		//$.fn.zTree.init($("#tree"), setting, zNodes);
		/* loadPositionByOrg();
		loadOrgByPosition(); */
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
		if(treeNode.type == orgType){
			loadPositionByOrg();
			$("#myTabContent3").hide();
			$("#myTabContent2").hide();
			$("#myTabContent1").show();
			$("#addPosition").show();
			$("#organizationId").val(treeNode.organizationId)
			$('#tableByPosition').bootstrapTable(
		            "refresh",  
		            {  
		                url:'${basePath}/manage/positionStatistics/getPositionByOrg'
		            }  
		    );
		}
		if(treeNode.type == positionType){
			loadOrgByPosition();
			$("#myTabContent3").hide();
			$("#myTabContent1").hide();
			$("#myTabContent2").show();
			$("#addOrg").show();
			$("#positionId").val(treeNode.positionId)
			$('#tableByOrg').bootstrapTable(
		            "refresh",  
		            {  
		                url:'${basePath}/manage/positionStatistics/getOrgByPosition'
		            }  
		    );
		}
		if(treeNode.type == userType){
			$("#myTabContent1").hide();
			$("#myTabContent2").hide();
			$("#myTabContent3").show();
			/* $("#tableByOrg").hide();
			$("#tableByPosition").hide(); */
		}
		
	}
	
	//var $table = $('#tableBySelected');
	//岗位列表
	function loadPositionByOrg(){
		// bootstrap table初始化
		$('#tableByPosition').bootstrapTable({
			url: '${basePath}/manage/positionStatistics/getPositionByOrg',
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
			idField: 'positionId',
			maintainSelected: true,
			toolbar: '#toolbar',
			queryParams: queryPositionParams,
			columns: [
				{field: 'ck', checkbox: true},
				{field: 'positionId', title: 'ID', visible: false, align: 'center'},
				{field: 'name', title: '岗位名称',align: 'center'},
				{field: 'positionCode', title: '岗位编号',align: 'center'},
	            {field: 'description', title: '岗位描述', align: 'center'},
				/* {field: 'action', title: '操作', align: 'center', formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false} */
			],
			//数据加载成功后执行
			onLoadSuccess: function(data){
				$("#addPosition").show();
			},
		});
	}
	function queryPositionParams(params){
		var organizationId = $("#organizationId").val();
	    return {
	        limit : params.limit,
	        offset : params.offset,
	        order : params.order,
	        search : params.search,
	        sort : params.sort,
	        organizationId : organizationId
	    }
	}
	//组织列表
	function loadOrgByPosition(){
		//$('#tableByPosition').children();
		// bootstrap table初始化
		$('#tableByOrg').bootstrapTable({
			url: '${basePath}/manage/positionStatistics/getOrgByPosition',
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
			queryParams: queryOrgParams,
			columns: [
				{field: 'ck', checkbox: true},
				{field: 'organizationId', title: 'ID', visible: false, align: 'center'},
				{field: 'name', title: '组织名称',align: 'center'},
				{field: 'organizationCode', title: '组织编号',align: 'center'},
	            {field: 'description', title: '组织描述', align: 'center'},
				/* {field: 'action', title: '操作', align: 'center', formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false} */
			],
			//数据加载成功后执行
			onLoadSuccess: function(data){
				
			},
		});
	}
	function queryOrgParams(params){
		var positionId = $("#positionId").val();
	    return {
	        limit : params.limit,
	        offset : params.offset,
	        order : params.order,
	        search : params.search,
	        sort : params.sort,
	        positionId : positionId
	    }
	}
	//获取所有组织列表
	function getOrganizationList() {
		/* $("#toolbar").children().hide();
		$("#addPosition").show(); */
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
		//$("#toolbar").children().hide();
		/* if(type == userType){
			$("#addUser").show();
		}
		if(type == positionType){
			$("#addOrg").show();
		} */
		
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
		$.ajax({
			type : 'get',
			url : '${basePath}/manage/positionStatistics/getPositionByOrgAll',
			data : {"organizationId" : $("#organizationId").val()},
			success : function(data) {
				//设置节点选中
				var treeObj = $.fn.zTree.getZTreeObj("positionTree");
				for(var i = 0; i < data.length; i++){
					var node = treeObj.getNodeByParam("id", data[i].positionId, null);
					treeObj.checkNode(node, true, true);
					//设置禁选
					node.chkDisabled = true;
					treeObj.updateNode(node);
				}
			}
		});
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
		$.ajax({
			type : 'get',
			url : '${basePath}/manage/positionStatistics/getOrgByPositionAll',
			data : {"positionId" : $("#positionId").val()},
			success : function(data) {
				console.log(data);
				//设置节点选中
				var treeObj = $.fn.zTree.getZTreeObj("orgTree");
				for(var i = 0; i < data.length; i++){
					var node = treeObj.getNodeByParam("id", data[i].organizationId, null);
					treeObj.checkNode(node, true, true);
					//设置禁选
					node.chkDisabled = true;
					treeObj.updateNode(node);
				}
			}
		});
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
					}//else{
						result = getAllLeavesNodes(childrenNodes[i], result);
					//}
				}
			}
		}else{
			result += treeNode.id + ',';
		}
		return result;
		
	}
	//删除岗位下的组织
	function delOrgFun(){
		var treeObj = $.fn.zTree.getZTreeObj("treePosition").getSelectedNodes();
		var positionId = treeObj[0].positionId;
		var rows = $("#tableByOrg").bootstrapTable('getSelections');
		if (rows == null || rows.length == 0) {
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
			var orgIds = new Array();
			for (var i in rows) {
				orgIds.push(rows[i].organizationId);
			}
			deleteDialog = $.confirm({
				type: 'red',
				animationSpeed: 300,
				title: false,
				content: '确认将该组织在岗位下删除吗？',
				buttons: {
					confirm: {
						text: '确认',
						btnClass: 'waves-effect waves-button',
						action: function () {
							$.ajax({
								type: 'get',
								url: '${basePath}/manage/positionStatistics/deleteOrg/'+ positionId + '/' + orgIds.join(","),
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
										$("#tableByOrg").bootstrapTable('refresh');
										//getPositionList();
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
	//删除组织下的岗位
	function delPositionFun(){
		var treeObj = $.fn.zTree.getZTreeObj("treeOrg").getSelectedNodes();
		var organizationId = treeObj[0].organizationId;
		var rows = $("#tableByPosition").bootstrapTable('getSelections');
		if (rows == null || rows.length == 0) {
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
			var positionIds = new Array();
			for (var i in rows) {
				positionIds.push(rows[i].positionId);
			}
			deleteDialog = $.confirm({
				type: 'red',
				animationSpeed: 300,
				title: false,
				content: '确认将该岗位在组织下删除吗？',
				buttons: {
					confirm: {
						text: '确认',
						btnClass: 'waves-effect waves-button',
						action: function () {
							$.ajax({
								type: 'get',
								url: '${basePath}/manage/positionStatistics/deletePosition/'+ organizationId + '/' + positionIds.join(","),
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
										$("#tableByPosition").bootstrapTable('refresh');
										//getPositionList();
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
	//删除岗位下的人员
	function delUserFun(){
		alert("删除人员");
	}
</script>
</body>
</html>
