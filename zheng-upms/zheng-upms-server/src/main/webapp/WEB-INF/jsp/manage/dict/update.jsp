<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<div id="updateDialog" class="crudDialog">
	<form id="updateForm" method="post">
		<div class="form-group">
			<label for="type">类型</label>
			<input id="type" type="text" class="form-control" name="type" maxlength="100" value="${dict.type }">
		</div>
		<div class="form-group type2 type3">
			<label for="value">键值</label>
			<input id="value" type="text" class="form-control" name="value" maxlength="100" value="${dict.value }">
		</div>
		<div class="form-group type2 type3">
			<label for="label">标签</label>
			<input id="label" type="text" class="form-control" name="label" maxlength="100" value="${dict.label }">
		</div>
		<div class="form-group type1 type3">
			<label for="description">描述</label>
			<input id="description" type="text" class="form-control" name="description" maxlength="100" value="${dict.description }">
		</div>
		<div class="form-group">
			<!-- <label for="description">是否可用</label> -->
			<span class="type1 type2 type3">
				<select id="delFlag" name="delFlag">
					<option value="0" <c:if test="${dict.delFlag==0}">selected="selected"</c:if>>可用</option>
					<option value="1" <c:if test="${dict.delFlag==1}">selected="selected"</c:if>>不可用</option>
				</select>
			</span>
		</div>
		<div class="form-group text-right dialog-buttons">
			<a class="waves-effect waves-button" href="javascript:;" onclick="updateSubmit();">保存</a>
			<a class="waves-effect waves-button" href="javascript:;" onclick="updateDialog.close();">取消</a>
		</div>
	</form>
</div>
<script>

function updateSubmit() {
    $.ajax({
        type: 'post',
        url: '${basePath}/manage/dict/update/${dict.id}',
        data: $('#updateForm').serialize(),
        beforeSend: function() {
        	console.log($('#updateForm').serialize());
        	if ($('#type').val() == '') {
				$('#type').focus();
				return false;
			}
        	if ($('#value').val() == '') {
				$('#value').focus();
				return false;
			}
        	if ($('#label').val() == '') {
				$('#label').focus();
				return false;
			}
        },
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
				updateDialog.close();
				$table.bootstrapTable('refresh');
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
</script>