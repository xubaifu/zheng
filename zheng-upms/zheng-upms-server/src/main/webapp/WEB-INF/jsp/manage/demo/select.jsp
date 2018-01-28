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
			<label for="subsetColumn">选择条件</label> <input id="subsetColumn"
				type="text" class="form-control" name="subsetColumn" maxlength="20"
				value="">
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
	
</script>

<!--

<table class="myTable">
		<tbody>
			<tr class="firstRow">
				<th width="26">1<br /></th>
				<th width="228">2<br /></th>
				<th width="170">3<br /></th>
				<th width="37">4<br /></th>
				<th width="37">5<br /></th>
				<th width="37">6<br /></th>
				<th width="37">7<br /></th>
			</tr>
			<tr>
				<th width="5">2<br /></th>
				<td valign="middle" rowspan="3" colspan="2" align="center"
					style="word-break: break-all;" width="58"><br /></td>
				<td rowspan="1" valign="middle" align="center"
					style="word-break: break-all;" colspan="4">条件1</td>
			</tr>
			<tr>
				<th width="5">3<br /></th>
				<td valign="middle" rowspan="1" colspan="2" align="center"
					style="word-break: break-all;" width="58"><span
					style="text-align: -webkit-center;">条件1-1</span></td>
				<td valign="middle" rowspan="1" colspan="2" align="center"
					style="word-break: break-all;"><span
					style="text-align: -webkit-center;">条件1-2</span></td>
			</tr>
			<tr>
				<th width="5">4<br /></th>
				<td valign="middle" align="center" style="word-break: break-all;"
					width="170"><span style="text-align: -webkit-center;">条件1-1-1</span></td>
				<td valign="middle" align="center" style="word-break: break-all;"
					width="140"><span style="text-align: -webkit-center;">条件1-1-2</span></td>
				<td valign="middle" align="center" style="word-break: break-all;"
					width="169"><span style="text-align: -webkit-center;">条件1-2-1</span></td>
				<td valign="middle" align="center" style="word-break: break-all;"
					width="169"><span style="text-align: -webkit-center;">条件1-2-2</span></td>
			</tr>
			<tr>
				<th width="5">5<br /></th>
				<td colspan="1" valign="middle" align="center" rowspan="6"
					style="word-break: break-all;" width="228"><span
					style="text-align: -webkit-center;">条件2</span></td>
				<td valign="middle" align="center" style="word-break: break-all;"
					width="170"><span style="text-align: -webkit-center;">条件2-1</span></td>
				<td valign="middle" align="center" style="word-break: break-all;"
					width="140">0</td>
				<td valign="middle" align="center" style="word-break: break-all;"
					width="169">0</td>
				<td valign="middle" align="center" style="word-break: break-all;"
					width="169">0</td>
				<td valign="middle" align="center" style="word-break: break-all;"
					width="170">0</td>
			</tr>
			<tr>
				<th width="5">6<br /></th>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="228"><span
					style="text-align: -webkit-center;">条件2-</span>2</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="140">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="169">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="169">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="170">0</td>
			</tr>
			<tr>
				<th width="5">7<br /></th>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="228"><span
					style="text-align: -webkit-center;">条件2-</span><span
					style="text-align: -webkit-center;">3</span></td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="140">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="169">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="169">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="170">0</td>
			</tr>
			<tr>
				<th width="5">8<br /></th>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="228"><span
					style="text-align: -webkit-center;">条件2-</span><span
					style="text-align: -webkit-center;">4</span></td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="140">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="169">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="169">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="170">0</td>
			</tr>
			<tr>
				<th width="5">9<br /></th>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="228"><span
					style="text-align: -webkit-center;">条件2-</span>5</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="140">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="169">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="169">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="170">0</td>
			</tr>
			<tr>
				<th width="5">10<br /></th>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="228"><span
					style="text-align: -webkit-center;">条件2-</span>6</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="37">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="112">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="140">0</td>
				<td valign="middle" colspan="1" rowspan="1" align="center"
					style="word-break: break-all;" width="169">0</td>
			</tr>
		</tbody>
	</table> 
   -->