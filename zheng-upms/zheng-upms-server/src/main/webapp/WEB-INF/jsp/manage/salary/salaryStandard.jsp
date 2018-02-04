<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><!-- 编制管理 --></title>
<jsp:include page="/resources/inc/head.jsp" flush="true" />
<link href="${basePath}/resources/zheng-admin/plugins/ueditor1_4_3_3-utf8-jsp/utf8-jsp/themes/default/css/ueditor.css" type="text/css" rel="stylesheet">
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
<!-- 选中部门基本信息以及子集信息 -->
<div class="tab-pane fade in active" id="bootStrapTable" style="display: none;">
	<table id="table"></table>
</div>
	<!--style给定宽度可以影响编辑器的最终宽度-->
<script type="text/plain" id="myEditor" style="width:1000px;height:400px;">
	<table class="myTable">
		<tbody>
			<tr  class="firstRow">
				<td valign="middle" rowspan="3" colspan="2" align="center"
					style="word-break: break-all;" width="58"><br /></td>
				<td rowspan="1" valign="middle" align="center"
					style="word-break: break-all;" colspan="4">条件1</td>
			</tr>
			<tr>
				<td valign="middle" rowspan="1" colspan="2" align="center"
					style="word-break: break-all;" width="58"><span
					style="text-align: -webkit-center;">条件1-1</span></td>
				<td valign="middle" rowspan="1" colspan="2" align="center"
					style="word-break: break-all;"><span
					style="text-align: -webkit-center;">条件1-2</span></td>
			</tr>
			<tr>
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
</script>
	<div class="clear"></div>
<div id="btns">

		<table>
        <tr>
            <td>
                <button class="btn" id="enable" onclick="setEnabled()">可以编辑</button>&nbsp;
                <button class="btn" onclick="setDisabled()">不可编辑</button>
            </td>
        </tr>
        <tr>
            <td>
                <button class="btn" onclick="turnTable()">模板转换</button>
                <button class="btn" onclick="turnToUeditor()">编辑编辑</button>
                <button class="btn" onclick="splitTable()">表格拆分</button>
                <button class="btn" onclick="getData()">获取表格数据</button>
                <button class="btn" onclick="getTemplate()">固定模板</button>
                <button class="btn" onclick="getAllData()">获取数据</button>
            </td>
        </tr>
    </table>
</div>
<div>
    <h3 id="focush2"></h3>
</div>
<div>
	<div id="conditions" class="input-group input-group-sm">
		<!-- <span class="input-group-addon">横向条件</span> -->
		<!-- <input type="text" class="form-control" style="width: 200px"> -->
	</div>
</div>

<jsp:include page="/resources/inc/footer.jsp" flush="true" />


<script src="${basePath}/resources/zheng-admin/plugins/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.config.js"></script>
<script src="${basePath}/resources/zheng-admin/plugins/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.all.js"></script>
<script src="${basePath}/resources/zheng-admin/plugins/ueditor1_4_3_3-utf8-jsp/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script>
//实例化编辑器
var um = UE.getEditor('myEditor');
um.addListener( 'contentChange', function( editor ) {
    console.log('内容发生改变');
    //bindingFun();
});
function disableBtn(str) {
    var div = document.getElementById('btns');
    var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
    for (var i = 0, btn; btn = btns[i++];) {
        if (btn.id == str) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        } else {
            btn.setAttribute("disabled", "true");
        }
    }
}


//固定模板
function getTemplate(){
    //绑定事件，设置class属性
    //取消绑定
    $("#ueditor_0").contents().find(".myTable").find("td").unbind();
    for(var i = 0; i < $("#ueditor_0").contents().find(".myTable").find("td").length; i++){
        $("#ueditor_0").contents().find(".myTable").find("td:eq("+i+")").attr("class",guid())
    }
    
    //重新绑定
    $("#ueditor_0").contents().find(".myTable").find("td").click(
        function(){
        
        	sessionStorage.setItem("class", $(this).attr("class"));
        	//弹出子集属性选择页面
        	selectDialog = $.dialog({
				animationSpeed: 300,
				title: '选择属性',
				content: 'url:${basePath}/manage/salary/select',
				onContentReady: function () {
					initMaterialInput();
					
				}
			});
        }		
    );
  //设置不可编辑
	um.setDisabled('fullscreen');
    disableBtn("enable");
}
//获取数据
function getAllData(){
	var mytable = $("#ueditor_0").contents().find(".myTable").find("table").prevObject[0];
	rowLen = mytable.rows.length;//表格行数
	var colLenArr = [];//各行列数
	var colLen = 0;//最大列数
	for(var i = 0; i < rowLen; i++){
		colLenArr[i] = mytable.rows[i].cells.length;
	}
	colLen = Math.max.apply(null, colLenArr)
	var dataArr = [];
	for(var i = 0; i < rowLen; i++){
		dataArr[i] = [];
		for(var j = 0; j < colLen; j++){
			dataArr[i][j] = 0;
		}
	}
	
	var data = [];
    for(var i=0,rows=mytable.rows.length; i<rows; i++){
        for(var j=0,cells=mytable.rows[i].cells.length; j<cells; j++){
            if(!data[i]){
                data[i] = new Array();
            }
            data[i][j] = mytable.rows[i].cells[j].getAttribute("class");
        }
    }
	
	//遍历表格
	//var rowLen = mytable.rows.length;//行数
	//var colLen = 0;
	var colspan = 0, rowspan = 0;
	var classVal = "";
	var rowColArr = [];
	for(var i = 0; i < rowLen; i++){
		colLen = mytable.rows[i].cells.length;//列数
		n = 0;
		
		rowColArr[i] = [];
		for(var j = 0; j < colLen; j++){
			classVal = mytable.rows[i].cells[j].getAttribute("class");
			colspan = mytable.rows[i].cells[j].getAttribute("colspan");
			if(colspan == null || colspan == "null" || colspan == ""){
				colspan = 1;
			}else{
				colspan = parseInt(colspan);
			}
			
			rowspan = mytable.rows[i].cells[j].getAttribute("rowspan");
			if(rowspan == null || rowspan == "null" || rowspan == ""){
				rowspan = 1;
			}else{
				rowspan = parseInt(rowspan);
			}
			rowColArr[i][j] = {"row":rowspan,"col":colspan}
			//console.log("行="+rowspan+";"+"列="+colspan);
		}
		
	}
	console.log(data);
	console.log(dataArr);
	console.log(rowColArr);
	//testFun(data,dataArr);
	//dataFun(data,dataArr,rowColArr);		
}
//用于生成uuid
function S4() {
    return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
}
function guid() {
    return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
}

</script>
</body>
</html>