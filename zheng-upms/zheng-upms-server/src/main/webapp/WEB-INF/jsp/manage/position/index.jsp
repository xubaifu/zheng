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
	<title>岗位管理</title>
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
					<li id="positionList" class="active"><a href="#listtableBySelected" data-toggle="tab">岗位列表</a></li>
					<li id="firstLi"><a href="#listtable" data-toggle="tab">基本信息</a></li>
					<!-- <li><a href="#ios" data-toggle="tab">iOS</a></li>
					<li><a href="#ios" data-toggle="tab">iOS</a></li> -->
				</ul>
			</div>
		</div>
		<div id="myTabContent" class="tab-content">
			<!-- 选中岗位列表以及子岗位列表 -->
			<div class="tab-pane fade in active" id="listtableBySelected" style="height: 212px; padding-bottom: 40px;">
				<div id="toolbar">
					<shiro:hasPermission name="upms:position:create"><a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增岗位</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:update"><a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i> 编辑岗位</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:delete"><a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction()"><i class="zmdi zmdi-close"></i> 删除岗位</a></shiro:hasPermission>
					<shiro:hasPermission name="upms:position:createSubset"><a class="waves-effect waves-button" href="javascript:;" onclick="createSubsetTable()"><i class="zmdi zmdi-close"></i> 新增子集</a></shiro:hasPermission>
				</div>
				<table id="tableBySelected"></table>
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
		getPositionList();
		//动态加载tab页(子集)
		loadTabPage();
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
		//点击岗位切换时，将内容定位到基本信息位置
		$("#myTabContent").children().removeClass("active");
		$("#myTab").children().removeClass("active");
		$("#positionList").addClass("active");
		$("#listtableBySelected").addClass("in active");
		//获取岗位基本信息以及子集信息
		getPositionList(treeNode,treeNode.id);
		//获取岗位及子岗位信息
		$('#tableBySelected').bootstrapTable(
	            "refresh",  
	            {  
	                url:'${basePath}/manage/position/list?id='+treeNode.id
	            }  
	    );
	}
	var $table = $('#tableBySelected');
	function loadBootstrapTable(){
		// bootstrap table初始化
		$table.bootstrapTable({
			url: '${basePath}/manage/position/list',
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
			columns: [
				{field: 'ck', checkbox: true},
				{field: 'positionId', title: 'ID', visible: false, align: 'center'},
				{field: 'name', title: '岗位名称',align: 'center'},
				{field: 'positionCode', title: '岗位编号',align: 'center'},
	            {field: 'description', title: '岗位描述', align: 'center'},
				{field: 'action', title: '操作', align: 'center', formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false}
			],
			//数据加载成功后执行，加载树结构
			onLoadSuccess: function(data){
				/* if(data.rows != null || data.rows.length != 0){
					for(var i = 0; i < data.rows.length; i++){
						if(data.rows[i].pid == ''){
							$table.bootstrapTable('hideRow', {index:i});
						}
					}
				}  */
			},
		});
	}
	
	//获取岗位列表
	function getPositionList(treeNode,id){
		//获取所有岗位列表
		if(treeNode == null || treeNode == "undefined"){
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
						$.fn.zTree.init($("#tree"), setting, zNodes);
						//加载BootstrapTable
						loadBootstrapTable();
			        }
			    });
		}else{
		    //获取某岗位基本信息
			$.ajax({
				type: 'get',
				url: '${basePath}/manage/position/getPositionById?id='+id,
				success: function(data) {
					if(data.positionPar == null){
						console.log(data)
						data.positionPar = {name:"根节点"};
					}
					$("#listtable").children().remove();
					$("#listtable").append('<input style="display:none" id="positionId" value="'+id+'" />'+
							'<input style="display:none" id="positionName" value="'+treeNode.name+'" />'
					);
			        /* for(var i in data.rows[0]) {//获取对象属性
			            if (data.rows[0].hasOwnProperty(i) && typeof data.rows[0][i] != "function") {
			            	$("#listtable").append('<label>'+i+':</label><span>'+data.rows[0][i]+'</span><br />');
		    	         }
			        } */
			        $("#listtable").append(
			        		'<div>'+
			        			'<shiro:hasPermission name="upms:position:update"><a class="waves-effect waves-button" href="javascript:;" onclick="updateAction(\''+data.rows[0].positionId+'\')"><i class="zmdi zmdi-edit"></i> 编辑岗位</a></shiro:hasPermission>'+
			        		'</div>'
			        		);
			        $("#listtable").append('<div class="form-group">'+
												'<label for="name">名称 :&nbsp;&nbsp;&nbsp; <span>'+data.rows[0].name+'</span></label>'+
												'<span class="form-control"></span>'+
											'</div>'+
											'<div class="form-group">'+
												'<label for="positionCode">岗位编号:&nbsp;&nbsp;&nbsp; <span>'+data.rows[0].positionCode+'</span></label>'+
												'<span class="form-control"></span>'+
											'</div>'+
											'<div class="form-group">'+
												'<label for="description">描述:&nbsp;&nbsp;&nbsp; <span>'+data.rows[0].description+'</span></label>'+
												'<span class="form-control"></span>'+
											'</div>'+
											'<div class="form-group">'+
												'<label for="description">上级岗位:&nbsp;&nbsp;&nbsp; <span>'+data.positionPar.name+'</span></label>'+
												'<span class="form-control"></span>'+
											'</div>'+
												'<div class="form-group">'+
												'<label for="description">操作时间:&nbsp;&nbsp;&nbsp; <span>'+new Date(data.rows[0].ctime).toLocaleString()+'</span></label>'+
												'<span class="form-control"></span>'+
											'</div>'
										);
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
	}
	// 格式化操作按钮
	function actionFormatter(value, row, index) {
	    return [
			'<a class="update" href="javascript:;" onclick="updateAction(\''+row.positionId+'\')" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
			'<a class="delete" href="javascript:;" onclick="deleteAction(\''+row.positionId+'\')" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
	    ].join('');
	}
	//点击tab页加载岗位列表
	/* function refreshBootstrapTable(){alert(1)
		$table.bootstrapTable(  
	            "refresh",  
	            {  
	                url:'${basePath}/manage/position/list'
	            }  
	    );  
	} */
	// 新增
	var createDialog;
	function createAction() {
		createDialog = $.dialog({
			animationSpeed: 300,
			title: '新增岗位',
			content: 'url:${basePath}/manage/position/create',
			onContentReady: function () {
				initMaterialInput();
				var parentId = $("#positionId").val();//默认采用已选择的岗位
				var parentName = $("#positionName").val();
				if(parentId != null && parentId != "" && parentId != "undefined"){
					$('#pid').val(parentId);
					$('#pName').val(parentName);
					$('#pName').focus();
				}
			}
		});
	}
	// 编辑
	var updateDialog;
	function updateAction(positionId) {//根据是否传入positionId，判断点击的按钮
		var rows = $table.bootstrapTable('getSelections');//选中的某行数据
		
		if ((positionId == null || positionId == 'undefined') && rows.length != 1) {
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
			if(positionId == null || positionId == 'undefined'){//是否传入positionId
				url = 'url:${basePath}/manage/position/update/' + rows[0].positionId;
			}else{
				url = 'url:${basePath}/manage/position/update/' + positionId;
			}
			updateDialog = $.dialog({
				animationSpeed: 300,
				title: '编辑岗位',
				content: url,
				onContentReady: function () {
					initMaterialInput();
					if($('#pid').val() == '0'){//根节点不可选择父机构
						$('#pName').val("根节点不可选");
						$('#pName').attr("disabled", "disabled");
					}
				}
			});
		}
	}
	// 删除
	var deleteDialog;
	function deleteAction(positionId) {//根据是否传入positionId，判断点击的按钮
		var rows = $table.bootstrapTable('getSelections');
		if ((positionId == null || positionId == 'undefined') && rows.length == 0) {
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
			if(positionId == null || positionId == 'undefined'){
				for (var i in rows) {
					ids.push(rows[i].positionId);
				}
			}else{
				ids.push(positionId);
			}
			deleteDialog = $.confirm({
				type: 'red',
				animationSpeed: 300,
				title: false,
				content: '确认删除该岗位吗？',
				buttons: {
					confirm: {
						text: '确认',
						btnClass: 'waves-effect waves-button',
						action: function () {
							$.ajax({
								type: 'get',
								url: '${basePath}/manage/position/delete/' + ids.join(","),
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
										getPositionList();
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
	//加载岗位机构
	function loadPosition(){
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
	//获取相关子集（加载tab页）
	function loadTabPage(/* treeNode */){
		$(".forRemove").remove();
		$.ajax({
			type: 'get',
			url: '${basePath}/manage/position/getSysTableinfo?type=2',
			success: function(data) {
				
		        if(data.rows != null && data.rows.length != 0){
		        	var len = data.rows.length;
		        	var tabId = "tab";
		        	for(var i = 0; i < len; i++){
		        		//console.log(data.rows[i].enTableName)
		        		$("#myTab").append('<li class="forRemove"><a href="#'+(tabId + i)+'" data-toggle="tab" onclick="createTable(\'table'+i+'\',\''+data.rows[i].enTableName+'\')">'+data.rows[i].cnTableName+'</a></li>');
		        		$("#myTabContent").append('<div class="tab-pane fade forRemove" id="'+(tabId + i)+'">'+
		        				'<div class="fixed-table-toolbar"><div class="bs-bars pull-left"><div id="toolbar'+i+'">'+
									'<shiro:hasPermission name="upms:position:createSubset"><a class="waves-effect waves-button" href="javascript:;" onclick="createSubsetForm(\'table'+i+'\',\''+data.rows[i].enTableName+'\')"><i class="zmdi zmdi-plus"></i> 新增</a></shiro:hasPermission>'+
									'<shiro:hasPermission name="upms:position:update"><a class="waves-effect waves-button" href="javascript:;" onclick="updateSubsetData(\''+data.rows[i].enTableName+'\',\'table'+i+'\')"><i class="zmdi zmdi-edit"></i> 编辑</a></shiro:hasPermission>'+
									'<shiro:hasPermission name="upms:position:delete"><a class="waves-effect waves-button" href="javascript:;" onclick="deletebsetData(\'table'+i+'\',\''+data.rows[i].enTableName+'\')"><i class="zmdi zmdi-close"></i> 删除</a></shiro:hasPermission>'+
									'<shiro:hasPermission name="upms:position:delete"><a class="waves-effect waves-button" href="javascript:;" onclick="creatrSubSetColumn(\''+data.rows[i].enTableName+'\')"><i class="zmdi zmdi-close"></i> 新增子集属性</a></shiro:hasPermission>'+
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
	//动态生成table表格列
	function createTable(tableId,tableName){
		/* console.log($("#positionId").val());
		var positionId = $("#positionId").val(); */
		var option = {
				url: '${basePath}/manage/position/getDataInfoPage?tableName='+tableName,//+'&positionId='+positionId,//该链接分页使用
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
				//idField: 'positionId',
				maintainSelected: true,
				queryParams: queryParams,//请求服务器时所传的参数
				//toolbar: '#toolbar',
				columns: [],//getTableColumns(tableId,tableName),
				//数据加载成功后执行
				onLoadSuccess: function(data){
					console.log("id="+$("#positionId").val());
				}
			}
		getTableColumns(tableId,tableName,option)
	}
	
	function queryParams(params){
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
	//动态获取表的列信息
	function getTableColumns(tableId,tableName,option){
		//获取列信息
		$.ajax({
			type: 'get',
			url: '${basePath}/manage/position/getSysColumnInfo?type=2&tableName='+tableName,
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
		        $("#"+tableId).bootstrapTable(option);
		        //隐藏列
		        //$("#"+tableId).bootstrapTable('hideColumn', 'subId');
		      //获取子集 详细数据信息
				getDataInfo(tableId,tableName);
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
	
	//获取子集详细信息
	function getDataInfo(tableId,tableName){
		var positionId = $("#positionId").val();
		$.ajax({
			type: 'get',
			//url: '${basePath}/manage/position/getDataInfo?type=1&tableName='+tableName+'&positionId='+positionId,	
			url: '${basePath}/manage/position/getDataInfoPage?tableName='+tableName+'&positionId='+positionId,	
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
	var subsetDialog;
	//添加子集数据
	function createSubsetForm(tableId, tableName){
		var positionId = $("#positionId").val();
		if(positionId == "undefined" || positionId == "" || positionId == null){
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
			subsetDialog = $.dialog({
				animationSpeed: 300,
				title: '新增子集数据',
				content: 'url:${basePath}/manage/position/createSubsetForm',
				onContentReady: function () {
					initMaterialInput();
					//获取子集的列信息并创建相应的form
					createSubsetClumns(tableId, tableName, positionId);
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
			content: 'url:${basePath}/manage/position/createSubsetTable',
			onContentReady: function () {
				initMaterialInput();
			}
		});
	}
	//新增子集属性
	var subsetColumnDialog;
	function creatrSubSetColumn(tableName){
		subsetTableDialog = $.dialog({
			animationSpeed: 300,
			title: '新增子集属性',
			content: 'url:${basePath}/manage/position/createSubsetColumn',
			onContentReady: function () {
				initMaterialInput();
				$('select').select2();
				$('#attribute').select2().val("0").trigger('change');
				$("#tableName").val(tableName);
			}
		});
	}
	//编辑子集数据
	function updateSubsetData(tableName,tableId){
		var positionId = $("#positionId").val();
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
			/* console.log(rows);
			console.log(rows[0].subId);
			for(var i in rows[0]) {//获取对象属性
		        if (rows[0].hasOwnProperty(i) && typeof rows[0][i] != "function") {
		        	console.log("属性："+i);
		        	console.log("属性值"+rows[0][i]);
		         }
		    } */
			subsetDialog = $.dialog({
				animationSpeed: 300,
				title: '新增子集数据',
				content: 'url:${basePath}/manage/position/createSubsetForm',
				onContentReady: function () {
					initMaterialInput();
					//获取子集的列信息并创建相应的form
					createSubsetClumns(tableId, tableName, positionId, rows);
				}
			});
		}
		/* 
		$.ajax({
			type: 'get',
			url: '${basePath}/manage/position/getDataInfo?tableName='+tableName+'&positionId='+positionId+'&subId='+rows[0].subId,	
			success: function(data) {
				console.log(data)
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
		}); */
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
								url: '${basePath}/manage/position/deletebsetData/'+tableName+'/'+ids.join(","),
								//url: '${basePath}/manage/position/delete/' + ids.join(","),
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