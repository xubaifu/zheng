<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div id="subsetColumnDialog" class="crudDialog">
	<form id="subsetColumn" method="post">
		<div class="form-group">
			<!-- <label for="tableName">系统表名</label> -->
			<input id="tableName" type="text" class="form-control" name="tableName" maxlength="200" value="" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="cnColName">子集名称</label>
			<input id="cnColName" type="text" class="form-control" name="cnColName" maxlength="200" value="">
		</div>
		<div class="form-group">
			<label for="enColName">英文名称</label>
			<input id="enColName" type="text" class="form-control" name="enColName" maxlength="100" value="">
		</div>
		<div class="form-group">
			<!-- <label for="attribute">类型</label> -->
			<span class="type1 type2 type3">
				<select id="attribute" name="attribute">
					<option value="0">请选择类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
					<%-- <c:forEach var="upmsSystem" items="${upmsSystems}"> --%>
					<%-- <option value="${upmsSystem.systemId}" <c:if test="${permission.systemId==upmsSystem.systemId}">selected="selected"</c:if>>${upmsSystem.title}</option> --%>
					<%-- </c:forEach> --%>
					<option value="int" >整型</option>
					<option value="varchar" >字符串</option>
					<option value="date" >日期</option>
				</select>
			</span>
		</div>
		
		<div class="form-group">
			<label for="length">长度</label>
			<input id="length" type="text" class="form-control" name="length" maxlength="64" value="" onkeyup="value=value.replace(/[^\d]/g,'') " ng-pattern="/[^a-zA-Z]/">
		</div>
		<!-- <div class="form-group">
			<label for="type">所属类别</label>
			<input id="type" type="text" class="form-control" name="type" maxlength="100" value="">
		</div> -->
		<div class="form-group">
			<label id="bak" for="pid">描述</label>
			<input id="bak" type="text" class="form-control" name="bak" maxlength="1000" value="">
		</div>
		<div id="orgtree" style="border:1px solid #d2d1d1;display: none;">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="createSubsetColumn();">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="subsetTableDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>
function createSubsetColumn(){
	$.ajax({
        type: 'post',
        url: '${basePath}/manage/position/insertSubsetColumnData',
        data: $('#subsetColumn').serialize(),
        beforeSend: function() {
            if ($('#cnColName').val() == '') {
                $('#cnColName').focus();
                return false;
            }
            if ($('#enColName').val() == '') {
            	$('#enColName').focus();
                return false;
            }
            if ($('#attribute').val() == '' || $('#attribute').val() == '0') {
            	$('#attribute').focus();
                return false;
            }
            if ($('#length').val() == '') {
            	$('#length').focus();
                return false;
            }
        },
        success: function(result) {
			console.log(result);
			//createTable(tableId,tableName);
			subsetTableDialog.close();
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