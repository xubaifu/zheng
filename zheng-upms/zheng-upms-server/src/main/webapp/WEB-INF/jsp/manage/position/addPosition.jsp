<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<div id="addDialog" class="crudDialog">
	<form id="addFormPosition" method="post">
		<div class="form-group">
			<div style="border: 1px solid #d2d1d1;">
				<ul id="positionTree" class="ztree"></ul>
			</div>
		</div>
		<input id="isChecked" type="checkbox" name="isChecked">
		<label for="isChecked">是否为该组织下的所有子部门添加岗位</label>
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="addPositionSubmit();">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="addDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
	//新增编辑页面的ztree设置（setting）

	var settingForPosition = {
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
		},
		callback : {
		//beforeCheck: zTreeBeforeCheck
		}
	};
	//提交
	function addPositionSubmit() {
		var treeOrg = $.fn.zTree.getZTreeObj("treeOrg").getSelectedNodes();
		var orgNodes = '';
		//是否为该组织下的所有子部门添加岗位
		if($("#isChecked").is(':checked')){
			//获取选组织机构以及所有的子机构
			orgNodes = getAllChildrenNodes(treeOrg[0], orgNodes)
			if(orgNodes == "" || orgNodes == null){
				orgNodes = treeOrg[0].id
			}
		}else{
			//获取选中节点
			orgNodes = treeOrg[0].id
		}
		console.log(orgNodes)

		//获取选择的岗位信息
		var nodes = $.fn.zTree.getZTreeObj("positionTree").getCheckedNodes();
		if(nodes == null || nodes.length == 0){
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
		}
		var positionNodes = '';
		//获取所有非父节点的id值
		for (var i = 0; i < nodes.length; i++) {
			if (!nodes[i].isParent) {
				positionNodes += nodes[i].positionId + ',';
			}
		}
		console.log(positionNodes);
		$.ajax({
			type : 'post',
			url : '${basePath}/manage/positionStatistics/addPosition',
			data : {"orgNodes": orgNodes, "positionNodes": positionNodes},
			success : function(data) {
				if(data.code){
					addDialog.close();
					$.confirm({
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
					});
				}
			}
				
		});
		
	}


</script>