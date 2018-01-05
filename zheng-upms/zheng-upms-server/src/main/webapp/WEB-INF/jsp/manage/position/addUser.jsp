<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div id="addDialog" class="crudDialog">
	<form id="addFormUser" method="post">
		<div class="form-group">
			<div style="border: 1px solid #d2d1d1;">
				<ul id="userTree" class="ztree"></ul>
			</div>
		</div>
		<!-- <input id="isChecked" type="checkbox" name="isChecked">
		<label for="isChecked">是否为该组织下的所有子部门添加岗位</label> -->
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;"
				onclick="addSubmitUser();">保存</a> <a class="waves-effect waves-button"
				href="javascript:;" onclick="addDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
//新增编辑页面的ztree设置（setting）

var settingForUser = {
	data : {
		key : {
			title : "title"
		},
		simpleData : {
			enable : true
		}
	},
	check : {
		enable : true,
		chkboxType : { "Y" : "", "N" : "" },//父子关联关系
	},
	callback : {
	//beforeCheck: zTreeBeforeCheck
	}
};
//获取所有人员列表
function loadUserByOrg(){
	alert("jiazairenyuan");
	//获取所有组织列表
	$.ajax({
		type : 'get',
		url : '${basePath}/manage/positionStatistics/getAllUser',
		data : {},
		success : function(data) {
			console.log(data)
			zNodes = data;
			strArr = [];
			zNodesUser = data;
			var k = 0;
			/* for (var i = 0; i < data.length; i++) {
				
				if(){
					strArr[k] = data[i].organizationId;
				}
				
				zNodes[k].id = data[i].organizationId;
				zNodes[k].pId = data[i].pid;
				zNodes[k].name = data[i].name;
				zNodes[k].title = data[i].name;
				k++;
				/* for(var j = 0; j < data.length; i++){
					zNodes[k].id = data[j].userId;
					zNodes[k].pId = data[j].organizationId;
					zNodes[k].name = data[j].realname;
					zNodes[k].title = data[j].realname;
					k++;
				} */
			} */
			console.log(zNodes)
			$.fn.zTree.init($("#userTree"), settingForUser, zNodes);
		}
	});
}
//提交
function addSubmitUser() {
	//获取所选岗位的所有叶子节点
	var treePosition = $.fn.zTree.getZTreeObj("treePosition").getSelectedNodes();
	var positionNodes = '';
	positionNodes = getAllLeavesNodes(treePosition[0], positionNodes)

	console.log(positionNodes)

	//获取选择的组织信息
	var nodes = $.fn.zTree.getZTreeObj("userTree").getCheckedNodes();
	var userNodes = '';
	//获取所有选中节点的id值
	for (var i = 0; i < nodes.length; i++) {
		if(nodes[i].level != 0){//去掉根节点
			userNodes += nodes[i].id + ',';
		}
	}
	console.log(userNodes)
	if(nodes == null || nodes.length == 0 || userNodes == ''){
		$.confirm({
			title: false,
			content: '请选择人员！',
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
		$.ajax({
			type : 'post',
			url : '${basePath}/manage/positionStatistics/addUser',
			data : {"userNodes": userNodes, "positionNodes": positionNodes},
			success : function(data) {
				if(data.code){
					addDialog.close();
					$('#tableByUser').bootstrapTable(
				            "refresh",  
				            {  
				                url:'${basePath}/manage/positionStatistics/getUserByPosition'
				            }  
				    );
				}
			}
				
		});
	}
	
}

</script>