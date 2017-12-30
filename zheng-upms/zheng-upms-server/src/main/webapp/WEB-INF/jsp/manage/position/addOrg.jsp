<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<div id="addDialog" class="crudDialog">
	<form id="addFormOrg" method="post">
		<div class="form-group">
			<div style="border: 1px solid #d2d1d1;">
				<ul id="orgTree" class="ztree"></ul>
			</div>
		</div>
		<!-- <input id="isChecked" type="checkbox" name="isChecked">
		<label for="isChecked">是否为该组织下的所有子部门添加岗位</label> -->
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;"
				onclick="addSubmitOrg();">保存</a> <a class="waves-effect waves-button"
				href="javascript:;" onclick="addDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
	//新增编辑页面的ztree设置（setting）

	var settingForOrg = {
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
	//提交
	function addSubmitOrg() {
		//获取所选岗位的所有叶子节点
		var treePosition = $.fn.zTree.getZTreeObj("treePosition").getSelectedNodes();
		var positionNodes = '';
		positionNodes = getAllLeavesNodes(treePosition[0], positionNodes)

		console.log(positionNodes)

		//获取选择的组织信息
		var nodes = $.fn.zTree.getZTreeObj("orgTree").getCheckedNodes();
		var orgNodes = '';
		//获取所有选中节点的id值
		for (var i = 0; i < nodes.length; i++) {
			if(nodes[i].level != 0){//去掉根节点
				orgNodes += nodes[i].id + ',';
			}
		}
		console.log(orgNodes)
		if(nodes == null || nodes.length == 0 || orgNodes == ''){
			$.confirm({
				title: false,
				content: '请选择组织！',
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
				url : '${basePath}/manage/positionStatistics/addPosition',
				data : {"orgNodes": orgNodes, "positionNodes": positionNodes},
				success : function(data) {
					if(data.code){
						addDialog.close();
						$('#tableByOrg').bootstrapTable(
					            "refresh",  
					            {  
					                url:'${basePath}/manage/positionStatistics/getOrgByPosition'
					            }  
					    );
						/* $.confirm({
							title: "SUCCESS",
							content: '岗位添加成功！',
							autoClose: 'cancel|1000',
							backgroundDismiss: true,
							buttons: {
								cancel: {
									text: 'OK',
									btnClass: 'waves-effect waves-button'
								}
							}
						}); */
					}
				}
					
			});
		}
		
	}


</script>