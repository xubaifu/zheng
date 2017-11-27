<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div id="subsetDialog" class="crudDialog">
	<form id="subsetCreate" method="post">
		<%-- <div class="form-group">
			<label for="name">名称</label>
			<input id="name" type="text" class="form-control" name="name" maxlength="20" value="${organization.name}">
		</div>
		<div class="form-group">
			<label for="description">描述</label>
			<input id="description" type="text" class="form-control" name="description" maxlength="300" value="${organization.description}">
		</div>
		<div class="form-group">
			<label id="pidLable" for="pid">上级组织</label>
			<input id="pName" type="text" class="form-control" name="pName" maxlength="64" value="${organization.pid}">
			<input id="pid" type="text" class="form-control" name="pid" maxlength="64" value="${organization.pid}" style="display: none;">
		</div>
		<div id="orgtree" style="border:1px solid #d2d1d1;display: none;">
			<ul id="treeDemo" class="ztree"></ul>
		</div> --%>
		<!-- <div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="alert(1);">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="subsetDialog.close();">取消</a>
		</div> -->
	</form>
</div>
<script>
//创建子集表单(动态获取列并拼接成表单)
function createSubsetClumns(tableId, tableName, organizationId){
	$.ajax({
		type: 'get',
		url: '${basePath}/manage/organization/getSysColumnInfo?type=1&tableName='+tableName,
		success: function(data) {
			var cloumns = [];
	        if(data.rows != null && data.rows.length != 0){
	        	//var obj = {};
	        	for(var i = 0; i < data.rows.length; i++){
	        		/* obj = {field: data.rows[i].enColName, title: data.rows[i].cnColName};
	        		cloumns[i] = obj; */
	        		$("#subsetCreate").append(
	        				'<div class="form-group">'+
		        				'<label for="name">'+data.rows[i].cnColName+'</label>'+
		        				'<input id="name" type="text" class="form-control" name="'+data.rows[i].enColName+'" maxlength="'+data.rows[i].length+'" value="">'+
		        			'</div>'
		        		);
	        	}
	        	$("#subsetCreate").append(
	        			'<div class="form-group text-right dialog-buttons">'+
	        				'<a class="waves-effect waves-button" href="javascript:;" onclick="insertSubsetData(\''+tableId+'\',\''+tableName+'\',\''+organizationId+'\')">保存</a>'+
	        				'<a class="waves-effect waves-button" href="javascript:;" onclick="subsetDialog.close();">取消</a>'+
	        			'</div>'
	        		)
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
//新增子集数据
function insertSubsetData(tableId, tableName, organizationId){
	//console.log($('#subsetCreate').find("input").length);
	var param = new Object();
	var columns = new Object;
	for(var i = 0; i < $('#subsetCreate').find("input").length; i++){
		//console.log($('#subsetCreate').find("input")[i].name);
		//console.log($('#subsetCreate').find("input")[i].value);
		param[$('#subsetCreate').find("input")[i].name] = $('#subsetCreate').find("input")[i].value;
	}
	//var paramArr = [];
	//paramArr[0] = param;
	//console.log(param);
	//return;
	$.ajax({
        type: 'post',
        url: '${basePath}/manage/organization/insertSubsetData/'+tableName+'/'+organizationId,
        data: {"data":JSON.stringify(param)},
        dataType: "json",
       /*  beforeSend: function() {
        }, */
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
</script>