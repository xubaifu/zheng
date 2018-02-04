<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<div id="selectDialog" class="selectDialog">
	<form id="subsetTable" method="post">
		<div class="form-group">
			<label for="subsetColumn" id="subsetLabel">选择条件</label> <input id="subsetColumn"
				type="text" class="form-control" name="subsetColumn" maxlength="20"
				value="" >
		</div>
		<div id="tree" style="border:1px solid #d2d1d1;display: none;">
			<ul id="subsetTree" class="ztree"></ul>
		</div>
		<div class="form-group">
			<label for="subsetValue">输入数值</label> <input id="subsetValue"
				type="text" class="form-control" name="subsetValue" maxlength="20"
				value="">
		</div>
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;"
				onclick="getSelectVal()">保存</a> <a class="waves-effect waves-button"
				href="javascript:;" onclick="selectDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
	$(document).ready(function() {
		//获取子集信息
		loadSubsetTree();
	});

	function getSelectVal() {
		//获取当前单元格的class属性
		console.log(sessionStorage.getItem("class"));
		//将所选条件赋值到当前单元格
		if($("#subsetColumn").val() != null && $("#subsetColumn").val() != ''){
			$("#ueditor_0").contents().find(".myTable").find("." + sessionStorage.getItem("class")).text($("#subsetColumn").val());
			//页面隐藏输入框，存放所选的单元格的条件
			if ($("#" + sessionStorage.getItem("class")).val() != null
					&& $("#" + sessionStorage.getItem("class")).val() != "undefined") {
				$("#" + sessionStorage.getItem("class")).val($("#subsetColumn").val());
			} else {
				$("#conditions").append('<input id="'+ sessionStorage.getItem("class")+ '" type="text" class="form-control" style="width: 200px" value="'+ $("#subsetColumn").val() + '">');
				//um.setContent('<input id="'+ sessionStorage.getItem("class")+ '" type="text" class="form-control" style="width: 200px" value="'+ $("#subsetColumn").val() + '">', true);
			}
		}
		//将所填数值赋值到单元格
		if($("#subsetValue").val() != null && $("#subsetValue").val() != ''){
			$("#ueditor_0").contents().find(".myTable").find("." + sessionStorage.getItem("class")).text($("#subsetValue").val());
		}
		
		selectDialog.close();
		//splitTable();
	}

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
	var zNodes = [];
	var log, className = "dark";
	function beforeClick(treeId, treeNode, clickFlag) {

		console.log(treeNode.id + ";" + treeNode.pId);
	}
	function onClick(event, treeId, treeNode, clickFlag) {
		$("#subsetColumn").val(treeNode.name);
		//$("#pName").val(treeNode.name);
		$("#subsetLabel").addClass('active');
		/* //点击组织切换时，将内容定位到基本信息位置
		$("#myTabContent").children().removeClass("active");
		$("#myTab").children().removeClass("active");
		$("#organizationList").addClass("active");
		$("#listtableBySelected").addClass("in active");
		//获取部门基本信息以及子集信息
		getOrganizationList(treeNode,treeNode.id);
		//获取部门及子部门信息
		$('#tableBySelected').bootstrapTable(
	            "refresh",  
	            {  
	                url:'${basePath}/manage/organization/list?id='+treeNode.id
	            }  
	    ); */

	}
	//加载子集信息
	function loadSubsetTree() {
		$("#tree").show();
		$.ajax({
			type : 'get',
			url : '${basePath}/manage/salary/getSubsetTree',
			data : {},
			success : function(data) {
				//console.log(data)
				zNodes = data.rows;
				for (var i = 0; i < data.rows.length; i++) {
					zNodes[i].id = data.rows[i].id;
					zNodes[i].pId = data.rows[i].pid;
					zNodes[i].name = data.rows[i].name;
					zNodes[i].title = data.rows[i].bak;
				}
				$.fn.zTree.init($("#subsetTree"), setting, zNodes);

				//setting.callback.onClick = onClickForCheck;
			}
		});
	}
	//选中节点，将节点的信息添加到相应的input框
	function onClickForCheck(event, treeId, treeNode, clickFlag) {
		$("#subsetColumn").val(treeNode.id);
		//$("#pName").val(treeNode.name);
		$("#subsetColumn").addClass('active');
	}
</script>
