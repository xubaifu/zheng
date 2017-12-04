<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div id="subsetTableDialog" class="crudDialog">
	<form id="subsetTable" method="post">
		<div class="form-group">
			<label for="cnTableName">子集名称</label>
			<input id="cnTableName" type="text" class="form-control" name="cnTableName" maxlength="200" value="">
		</div>
		<div class="form-group">
			<label for="enTableName">英文名称</label>
			<input id="enTableName" type="text" class="form-control" name="enTableName" maxlength="100" value="">
		</div>
		<div class="form-group">
			<label id="bak" for="pid">描述</label>
			<input id="bak" type="text" class="form-control" name="bak" maxlength="1000" value="">
		</div>
		<div id="orgtree" style="border:1px solid #d2d1d1;display: none;">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="createSubsetTable();">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="subsetTableDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
function createSubsetTable(){
	$.ajax({
        type: 'post',
        url: '${basePath}/manage/organization/insertSubsetTableData',
        data: $('#subsetTable').serialize(),
        beforeSend: function() {
            if ($('#cnTableName').val() == '') {
                $('#cnTableName').focus();
                return false;
            }
            if ($('#enTableName').val() == '') {
            	$('#enTableName').focus();
                return false;
            }
        },
        success: function(result) {
			/* alert("success");
			console.log(result); */
			subsetTableDialog.close();
			//getOrganizationList();
			loadTabPage();
			
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