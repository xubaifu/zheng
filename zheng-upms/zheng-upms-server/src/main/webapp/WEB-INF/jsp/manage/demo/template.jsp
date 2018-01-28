<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>编制管理</title>
<jsp:include page="/resources/inc/head.jsp" flush="true" />
<link
	href="${basePath}/resources/zheng-admin/plugins/bootstrap3-editable-1.5.1/bootstrap3-editable/css/bootstrap-editable.css"
	rel="stylesheet" />
<style type="text/css">
::-webkit-scrollbar {
	width: 5px;
	height: 5px
}

::-webkit-scrollbar-track {
	background-color: #bee1eb;
}

::-webkit-scrollbar-thumb {
	background-color: rgba(0, 0, 0, .2);
}
/* ::-webkit-scrollbar-thumb<a href="https://www.baidu.com/s?wd=%3Ahover&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YLm16suWTkmW9-uWfYm1cv0ZwV5Hcvrjm3rH6sPfKWUEw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EP1RkPjRYP1TvPHf3rjRsnW0Y" target="_blank" class="baidu-highlight">:hover</a> {background-color:#9c3} */
::-webkit-scrollbar-thumb:active {
	background-color: rgba(0, 0, 0, .2)
}
</style>
</head>
<body>
	<div>
		<br>
		<div id="rowCondition" class="conditions" >
			<div class="input-group input-group-sm">
				<span class="input-group-addon">横向条件</span>
				<input type="text" class="form-control" style="width: 200px">
				<button type="button" class="btn btn-default btn-sm" onclick="addCondition(this)">
					<span class="glyphicon glyphicon-plus"></span> 添加条件
				</button>
				<button type="button" class="btn btn-default btn-sm" onclick="extendCondition(this)">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>扩展条件
				</button>
			</div>
		</div>
		<br>
		<div id="colCondition" class="conditions">
			<div class="input-group input-group-sm">
				<span class="input-group-addon">纵向条件</span>
				<input type="text" class="form-control" style="width: 200px">
				<button type="button" class="btn btn-default btn-sm" onclick="addCondition(this)">
					<span class="glyphicon glyphicon-plus"></span> 添加条件
				</button>
				<button type="button" class="btn btn-default btn-sm" onclick="extendCondition(this)">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>扩展条件
				</button>
			</div>
		</div>
		<br>
		<button type="button" class="btn btn-default btn-sm" onclick="createTemplateTable()">
			<span class="glyphicon glyphicon-play" aria-hidden="true"></span>生成表格模板
		</button>
		<br>
	</div>

	<div style="width: 80%">
		<table id="templateTable" class="table table-striped">
			
			
		</table>
	</div>


	<jsp:include page="/resources/inc/footer.jsp" flush="true" />
<script>
	
	//扩展条件
	function extendCondition(obj){
		$(obj).parent().children("input:last").after('<input type="text" class="form-control" style="width: 200px">')
	}
	//添加条件
	function addCondition(obj){
		$(obj).parents(".conditions").append($(obj).parents(".conditions div:first").clone());
		//$("#rowCondition").append($("#rowCondition div:first").clone());
	}
	//生成表格
	function createTemplateTable(){
		var html = "";
		//横向条件行数
		var transverseRowLen = $("#rowCondition div").length;
		console.log("横向条件行数="+transverseRowLen);
		//横向条件列数
		var transverseColLen = 1;//$("#rowCondition div:eq(1) input").length;
		var temp = 0;
		//横向条件列数=各行条件数相乘
		for(var i = 0; i < transverseRowLen; i++){
			temp = $("#rowCondition div:eq("+i+") input").length;
			transverseColLen = transverseColLen * temp;
		}
		console.log("横向条件列数="+transverseColLen);
		//纵向条件行数
		var longitudinalRowLen = $("#colCondition div").length;
		console.log("纵向条件行数="+longitudinalRowLen);
		//纵向条件列数
		var longitudinalColLen = 1;//$("#colCondition div:eq(1) input").length;
		//纵向条件列数=各行条件数相乘
		for(var i = 0; i < longitudinalRowLen; i++){
			temp = $("#colCondition div:eq("+i+") input").length;
			longitudinalColLen = longitudinalColLen * temp;
		}
		console.log("纵向条件列数="+longitudinalColLen);
		
		//生成表格，生成表格的行数=横向条件行数+纵向条件列数
		var tableRow = transverseRowLen + longitudinalColLen;
		console.log("表格行数="+(tableRow));
		//生成表格的列数=横向条件列数+纵向条件行数
		var tableCol = transverseColLen + longitudinalRowLen;
		console.log("表格列数="+(tableCol));
		var tr = "";
		var td = "";
		var val = "";
		for(var i = 0; i < tableRow; i++){
			tr = "<tr>"
			td = "";
			for(var j = 0; j < tableCol; j++){
				//获取横向条件和纵向条件的值
				/* if(i < transverseRowLen){
					td = td + "<td>"+$("#rowCondition div:eq("+i+") input").val()+"</td>";
				}else{
					td = td + "<td>"+$("#colCondition div:eq("+(i - transverseRowLen)+") input").val()+"</td>";
				} */
				td = td + "<td>"+i+"</td>";
			}
			html = html + tr + td + "</tr>"
		}
		
		$("#templateTable").append(html);
		
	}
</script>
</body>
</html>