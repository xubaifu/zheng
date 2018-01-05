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
	<title>编制管理</title>
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
			<ul id="tree" class="ztree"></ul>
		</div>
	</div>
	<div id="treepagebtn" class="unfolded-btn">
		<div id="openClose" class="close" style="height: 100%;" onclick="shrinkage()">&nbsp;</div>
	</div>
	<div id="main" class="treepage-main">
		<div style="overflow-x: auto;">
			<div id="tabPage" style="height: 40px">
				<ul id="myTab" class="nav nav-tabs">
					<li id="compilationList" class="active"><a href="#listtableBySelected" data-toggle="tab">编制列表</a></li>
					<!-- <li id="firstLi"><a href="#listtable" data-toggle="tab">基本信息</a></li> -->
				</ul>
			</div>
		</div>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="listtableBySelected" style="height: 212px; padding-bottom: 40px;">
				<div id="toolbar">
					<shiro:hasPermission name="upms:compilation:create"><a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增组织</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:compilation:update"><a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i> 编辑组织</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:compilation:delete"><a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction()"><i class="zmdi zmdi-close"></i> 删除组织</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:compilation:createSubset"><a class="waves-effect waves-button" href="javascript:;" onclick="createSubsetTable()"><i class="zmdi zmdi-close"></i> 新增子集</a></shiro:hasPermission>
				</div>
				<table id="tableBySelected"></table>
			</div>
			<div class="tab-pane fade in active" id="listtable">
				<table id="table"></table>
			</div>
			
		</div>
	</div>

</div>
<jsp:include page="/resources/inc/footer.jsp" flush="true"/>
<script>
	$(document).ready(function() {
		//$.fn.zTree.init($("#tree"), setting, zNodes);
		getOrganizationList();
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
		
	}
	function onClick(event, treeId, treeNode, clickFlag) {
		
	}
	//获取组织机构
	function getOrganizationList(treeNode,id){
		$.ajax({
	        type: 'get',
	        url: '${basePath}/manage/organization/listAll',
	        data: {},
	        success: function(data) {
	        	//console.log(data)
	        	zNodes = data.rows;
				for(var i = 0; i < data.rows.length; i++){
					zNodes[i].id = data.rows[i].organizationId;
					zNodes[i].pId = data.rows[i].pid;
					zNodes[i].name = data.rows[i].name;
					zNodes[i].title = data.rows[i].name;
				}
				$.fn.zTree.init($("#tree"), setting, zNodes);
				//加载BootstrapTable
				//loadBootstrapTable();
	        }
	    });
	}
	
</script>
</body>
</html>