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


		<div class="control-group">
			<label class="control-label">区域类型:</label>
			<div class="controls">
				<form method="post">
					<c:forEach var="item" items="${fns:getDictList('sys_area_type')}" varStatus="status">
					</c:forEach> 
				</form>
				<%-- <form:select path="type" class="input-medium">
					<form:options items="${fns:getDictList('sys_area_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select> --%>
			</div>
		</div>

	
	<div class="clear"></div>
<div id="btns">

		<table>
        <tr>
            <td>
                <button class="btn" unselected="on" onclick="bindingFun()">绑定事件</button>&nbsp;
                <button class="btn" onclick="getContent()">获得内容</button>&nbsp;
                <button class="btn" onclick="setContent()">写入内容</button>&nbsp;
                <button class="btn" onclick="setContent(true)">追加内容</button>&nbsp;
                <button class="btn" onclick="getContentTxt()">获得纯文本</button>&nbsp;
                <button class="btn" onclick="getPlainTxt()">获得带格式的纯文本</button>&nbsp;
                <button class="btn" onclick="hasContent()">判断是否有内容</button>
            </td>
        </tr>
        <tr>
            <td>
                <button class="btn" onclick="setFocus()">编辑器获得焦点</button>&nbsp;
                <button class="btn" onmousedown="isFocus();return false;">编辑器是否获得焦点</button>&nbsp;
                <button class="btn" onclick="doBlur()">编辑器取消焦点</button>&nbsp;
                <button class="btn" onclick="insertHtml()">插入给定的内容</button>&nbsp;
                <button class="btn" onclick="getContentTxt()">获得纯文本</button>&nbsp;
                <button class="btn" id="enable" onclick="setEnabled()">可以编辑</button>&nbsp;
                <button class="btn" onclick="setDisabled()">不可编辑</button>
            </td>
        </tr>
        <tr>
            <td>
                <button class="btn" onclick="UE.getEditor('myEditor').setHide()">隐藏编辑器</button>&nbsp;
                <button class="btn" onclick="UE.getEditor('myEditor').setShow()">显示编辑器</button>&nbsp;
                <button class="btn" onclick="UE.getEditor('myEditor').setHeight(300)">设置编辑器的高度为300</button>&nbsp;
                <button class="btn" onclick="UE.getEditor('myEditor').setWidth(1200)">设置编辑器的宽度为1200</button>
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
			
		</div>
	</div>

	
	<jsp:include page="/resources/inc/footer.jsp" flush="true" />

	
	<script src="${basePath}/resources/zheng-admin/plugins/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.config.js"></script>
    <script src="${basePath}/resources/zheng-admin/plugins/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.all.min.js"></script>
    <script src="${basePath}/resources/zheng-admin/plugins/ueditor1_4_3_3-utf8-jsp/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
	
    //实例化编辑器
    var um = UE.getEditor('myEditor');
    /* um.addListener('blur',function(){
        $('#focush2').html('编辑器失去焦点了');
    });
    um.addListener('focus',function(){
        $('#focush2').html('');
    }); */
    um.addListener( 'contentChange', function( editor ) {
	     console.log('内容发生改变');
	     //bindingFun();
	 });
    //按钮的操作
    function insertHtml() {
        var value = prompt('插入html代码', '');
        um.execCommand('insertHtml', value)
    }
    function isFocus(){
        alert(um.isFocus());
    }
    function doBlur(){
        um.blur();
    }
    
	var selectDialog;
	
	//绑定事件
    function bindingFun() {
        //alert(UE.getEditor('myEditor').getAllHtml());
        //取消绑定
        $("#ueditor_0").contents().find(".myTable").find("td").unbind();
       /*  for(var i = 0; i < $("#ueditor_0").contents().find(".myTable").find("td").length; i++){
        	if($("#ueditor_0").contents().find(".myTable").find("td:eq("+i+")").attr("class") == "" 
        			|| $("#ueditor_0").contents().find(".myTable").find("td:eq("+i+")").attr("class") == null){
	        	$("#ueditor_0").contents().find(".myTable").find("td:eq("+i+")").attr("class",guid())
        	}
        } */
        //重新绑定
        $("#ueditor_0").contents().find(".myTable").find("td").click(
	        function(){
	        	if($(this).attr("class") == null || $(this).attr("class") == ""){
		        	$(this).attr("class",guid());
	        	}
	        	
	        	sessionStorage.setItem("class", $(this).attr("class"));
	        	//console.log($(this).attr("class"));
	        	//console.log($(this));
	        	//弹出子集属性选择页面
	        	selectDialog = $.dialog({
					animationSpeed: 300,
					title: '选择属性',
					content: 'url:${basePath}/demo/select',
					onContentReady: function () {
						initMaterialInput();
						
					}
				});
	        }		
        );
        
        
        
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('myEditor').getContent());
        alert(arr.join("\n"));
        console.log(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('myEditor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('myEditor').setContent('欢迎使用ueditor<input value="asdhgfhjasgd"/>', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('myEditor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('myEditor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('myEditor').selection.getRange();
        range.select();
        var txt = UE.getEditor('myEditor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('myEditor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('myEditor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('myEditor').focus();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            domUtils.removeAttributes(btn, ["disabled"]);
        }
    }
    //绑定事件
    function bd(){
    	UE.dom.domUtils.on($("#ueditor_0").contents().find(".aaaa").find("table").prevObject[0],"click",function(e){
    		alert(111)
            //e为事件对象，this为被点击元素对戏那个
        });
    }
    
    
  //用于生成uuid
    function S4() {
        return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
    }
    function guid() {
        return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
    }
    
</script>

<script>
	/** 
	 * 获取表格行数
	 * @param  Int id 表格id
	 * @return Int
	 */
	function getTableRowsLength(id){
		//var mytable = $("#ueditor_0").contents().find(".aaaa").find("table").prevObject[0];
	    var mytable = document.getElementById(id);
	    return mytable.rows.length;
	}
	/** 
	 * 获取表格某一行列数
	 * @param  Int id    表格id
	 * @param  Int index 行数
	 * @return Int
	 */
	function getTableRowCellsLength(id, index){
	    var mytable = document.getElementById(id);
	    if(index<mytable.rows.length){
	        return mytable.rows[index].cells.length;
	    }else{
	        return 0;
	    }
	}
	/** 
	 * 遍历表格内容返回数组
	 * @param  Int   id 表格id
	 * @return Array
	 */
	function getTableContent(id){
	    var mytable = document.getElementById(id);
	    var data = [];
	    for(var i=0,rows=mytable.rows.length; i<rows; i++){
	        for(var j=0,cells=mytable.rows[i].cells.length; j<cells; j++){
	            if(!data[i]){
	                data[i] = new Array();
	            }
	            data[i][j] = mytable.rows[i].cells[j].innerHTML;
	        }
	    }
	    return data;
	}
	
	
	//模板转换
	function turnTable(){
		var option = {
				//url: '${basePath}/demo/getData',
				//editable : true,//开启编辑模式  
				height : getHeight(),
				pagination : true,
				paginationLoop : false,
				sidePagination : 'server',
				silentSort : false,
				smartDisplay : false,
				escape : true,
				searchOnEnterKey : true,
				idField : 'name',
				maintainSelected : true,
				//onClickCell : test,
				/* edit : {
					click : function() {
						alert("单列点击")
					} //这个地主，如何设置onkeypress事件，我需要键盘按下去的时候就响应事件！！设为keypress不行!
				}, */
				columns : [], //数据加载成功后执行，加载树结构
				onLoadSuccess : function(data) {
					console.log(JSON.stringify(data))
				},
			}
		
		var mytable = $("#ueditor_0").contents().find(".myTable").find("table").prevObject[0];
		//console.log(mytable);
		var rowLen = mytable.rows.length;//行数
		var colLen = 0;
		var columns = [];
		var title = "", valign = "", align = "", colspan = 0, rowspan = 0;
		for(var i = 0; i < rowLen; i++){
			//console.log(mytable.rows[i]);
			columns[i] = [];
			//console.log(JSON.stringify(columns))
			colLen = mytable.rows[i].cells.length;//列数
			for(var j = 0; j < colLen; j++){
				
				title = mytable.rows[i].cells[j].innerText;
				valign = mytable.rows[i].cells[j].getAttribute("valign"); 
				align = mytable.rows[i].cells[j].getAttribute("align"); 
				colspan = mytable.rows[i].cells[j].getAttribute("colspan");
				if(colspan == null || colspan == "null" || colspan == ""){
					colspan = 0;
				}else{
					colspan = parseInt(colspan);
				}
				
				rowspan = mytable.rows[i].cells[j].getAttribute("rowspan");
				if(rowspan == null || rowspan == "null" || rowspan == ""){
					rowspan = 0;
				}else{
					rowspan = parseInt(rowspan);
				}
				
				columns[i][j] =  {
						title : title, 
						valign : valign, 
						align : align, 
						colspan : colspan, 
						rowspan : rowspan,
						"class" : "table_" + (i+1) + "_" + (j+1)
					};
			}
		}
		//console.log(columns);
		//console.log(JSON.stringify(columns));
		turnToBootstrapTable(option,columns);
	}
	//转换成BootstrapTable,模板转换
	function turnToBootstrapTable(option,columns,data) {
		$("#bootStrapTable").append('<table id="table"></table>');
		UE.getEditor('myEditor').setHide();//隐藏编辑器
		$("#bootStrapTable").show();
		option.columns = columns;
		option.data = data;
        //加载表格
        $('#table').bootstrapTable(option);
        //绑定事件
        $('#table th').bind("click",function(event){
        	event.stopPropagation();
        	//console.log(event.currentTarget);
        	if($(event.currentTarget).children("input").length == 0){//判断是否有输入框
        		var id = $(event.currentTarget).attr("class");//$(this).parent().attr("class");
        		console.log(id)
        		$(event.currentTarget).append("<input id='"+id+"' value='"+$(this).text()+"'/>");
        		$(event.currentTarget).children(".th-inner").hide();
            	//防止事件被继承
            	$("#"+id).bind({"click":function(event){
            		event.stopPropagation();  
            		},
            		"change":function(event){
            			event.stopPropagation();  
            			alert("值改变");
            			$("."+id).children(".th-inner").text($("#"+id).val());
            			$("."+id).children(".th-inner").show();
            			$("#"+id).hide();
            		}
            	});
        	}
        	
        	
            alert("这个段落被点击了。");
        });
       
	}
	
	//转换成ueditor，模板编辑
	function turnToUeditor() {
		//console.log( $('#table thead').html());
		var value ="<table class='myTable'>"+$('#table thead').html()+"</table>";
		//转换标签元素
		value = value.replace(/<\/th>/gmi,"</td>");
		value = value.replace(/<th/gmi,"<td");
		console.log(value);
		//写入编辑器（此时写入的格式中带有<p>标签，需要将该标签去掉，防止模板转换时出现问题）
		UE.getEditor('myEditor').setContent(value);
		//取出table内容，替换标签<p>
        var mytable = $("#ueditor_0").contents().find(".myTable").find("table").prevObject[0];
        value = value.replace(/<\/p>/gmi,"");
		value = value.replace(/<p/gmi,"");
        //重新写入编辑器
		UE.getEditor('myEditor').setContent(value);
        
        //展示编辑器，隐藏bootstrapTable
		$("#bootStrapTable").children().remove(); 
		$("#bootStrapTable").hide();
		UE.getEditor('myEditor').setShow();//隐藏编辑器
	}
	
	//数据转换
	function turnToData(){
		var option = {
				//url: '${basePath}/demo/getData',
				//editable : true,//开启编辑模式  
				height : getHeight(),
				pagination : true,
				paginationLoop : false,
				sidePagination : 'server',
				silentSort : false,
				smartDisplay : false,
				escape : true,
				searchOnEnterKey : true,
				idField : 'name',
				maintainSelected : true,
				//onClickCell : test,
				/* edit : {
					click : function() {
						alert("单列点击")
					} //这个地主，如何设置onkeypress事件，我需要键盘按下去的时候就响应事件！！设为keypress不行!
				}, */
				columns : [], //数据加载成功后执行，加载树结构
				onLoadSuccess : function(data) {
					console.log(JSON.stringify(data))
				},
			}
		var mytable = $("#ueditor_0").contents().find(".myTable").find("table").prevObject[0];
		console.log(mytable);
		var rowLen = mytable.rows.length;//行数
		var colLen = [];
		var columns = [];
		var title = [], valign = "", align = "", colspan = 0, rowspan = 0;
		var field = "";
		
		for(var i = 0; i < rowLen; i++){
			colLen[i] = mytable.rows[i].cells.length;
			
		}
		//console.log(colLen);
		//console.log(Math.max.apply(null, colLen));
		var maxCol = Math.max.apply(null, colLen);
		for(var i = 0; i < maxCol; i++){
			columns[i]=  {
					title : "col_"+(i+1), 
					field : "col_"+(i+1),
					valign : valign, 
					align : align, 
					colspan : colspan, 
					rowspan : rowspan,
					//"class" : "table_" + (i+1) + "_" + (j+1)
				};
		}
		//console.log(columns);
		var data = [];
		for(var i = 0; i < rowLen; i++){
			//console.log(mytable.rows[i]);
			//columns[i] = [];
			//console.log(JSON.stringify(columns))
			colLen = mytable.rows[i].cells.length;//maxCol;//列数
			for(var j = 0; j < colLen; j++){
				title[j] = mytable.rows[i].cells[j].innerText;
				//valign = mytable.rows[i].cells[j].getAttribute("valign"); 
				//align = mytable.rows[i].cells[j].getAttribute("align"); 
				//colspan = mytable.rows[i].cells[j].getAttribute("colspan");
				/* if(colspan == null || colspan == "null" || colspan == ""){
					colspan = 0;
				}else{
					colspan = parseInt(colspan);
				} */
			}
			console.log(title)
			data[i] = {
					"col_1" : "测试组",
					"col_2" : "1级",
					"col_3" : "0",
					"col_4" : "0",
					"col_5" : "0",
					"col_6" : "0"
			}
		}
		//console.log(data);
		turnToBootstrapTable(option,columns,data);
	}
	
	
	
	//将表格转换为标准表格
	function splitTable(){
		//var tableHtml = UE.getEditor('myEditor').getContent();
		var mytable = $("#ueditor_0").contents().find(".myTable").find("table").prevObject[0];
		var len = 0;
		for(var i = 0; i < mytable.rows.length; i++){
			for(var j = 0;j < mytable.rows[i].cells.length; j++){
				if($(mytable.rows[i].cells[j]).attr("colspan") > 1){
					len = $(mytable.rows[i].cells[j]).attr("colspan");
					//console.log(len);
					$(mytable.rows[i].cells[j]).attr("colspan",1);
					//$(mytable.rows[i].cells[j]).after($(mytable.rows[i].cells[j]).clone());
					for(var k = 1; k < len; k++){
						//console.log("k="+k);
						$(mytable.rows[i].cells[j]).after($(mytable.rows[i].cells[j]).clone());
					}
				}
			}
		}
		
		
		for(var i = 0; i < mytable.rows.length; i++){
			for(var j = 0;j < mytable.rows[i].cells.length; j++){
				if($(mytable.rows[i].cells[j]).attr("rowspan") > 1){
					len = $(mytable.rows[i].cells[j]).attr("rowspan");
					console.log("len="+len);
					$(mytable.rows[i].cells[j]).attr("rowspan",1);
					
					$("#conditions").append($(mytable.rows[i].cells[j]).clone());
					console.log($("#conditions").html());
					var str = $("#conditions").html();
					$("#conditions").html("");
					console.log($(mytable.rows[i].cells[j]).context);
					for(var k = 1; k < len; k++){
						//console.log("k="+k);
						debugger;
						$(mytable.rows[i+k].cells[j]).after("<td>11</td>");
					}
					return;
				}
			}
		}
		
		
		console.log(mytable);
	}
	
	//获取表格数据
	function getData(){
		var mytable = $("#ueditor_0").contents().find(".myTable").find("table").prevObject[0];
	    var data = [];//存放表格转换出的原始数据
	    var arr = [];//存放data数组下标(需要扩展的数据下标)
	    var colArr = [];//存放某行表格占有的列数。与arr对应
	    var n = 0;//数组arr和colarr下标计数
	    for(var i=0,rows=mytable.rows.length; i<rows; i++){
	        for(var j=0,cells=mytable.rows[i].cells.length; j<cells; j++){
	            if(!data[i]){
	                data[i] = new Array();
	            }
	           	data[i][j] = $(mytable.rows[i].cells[j]).text();//遍历表格获取数据
	           
	            if($(mytable.rows[i].cells[j]).attr("colspan") > 1){//统计各行占有的列数并记录
	            	arr[n] = [i,j];
	            	colArr[n] = $(mytable.rows[i].cells[j]).attr("colspan");
	            	n++;
	            }
	        }
	    }
	    
	    var dataBak = new Array();
	    $.extend(true,dataBak,data);//数组深度复制，深度复制则是修改复制后的对象不会影响原始对象
	    for(var i = 0; i < arr.length; i++){
	    	console.log(i)
	    	console.log(colArr[i]);
	    	for(var j = 0; j < colArr[i]; j++){
		    	data[arr[i][0]][arr[i][1] + j+1] = dataBak[arr[i][0]][arr[i][1]];
	    	}
	    }
	    
	    
	    
	    
	   
	   /*  for(var i = 0; i < arr.length; i++){
		   var dataTest = new Array();
	    	 var x= 0;
	    	for(var j = 0; j< dataBak.length; j++){
	 	    	var y = 0;
	    		for(var k = 0; k < dataBak[j].length; k++){
	    			if(!dataTest[j]){
	    				dataTest[j] = new Array();
		            }
	    			if(i==arr[i][0] && k == arr[i][1]){
	    				for(var n = 0; n < colArr[i]; n++){
	    					dataTest[x][y] = dataBak[j][k];
	    					y++;
	    				}
	    			}else{
	    				dataTest[x][y] = dataBak[j][k];
	    				y++;
	    			}
	    			
	    		}
	    		x++;
	    	}
	    } */
	    
	   // console.log(dataTest);
	    
	    console.log(arr);
	    console.log(data);
	    console.log(colArr);
	    console.log(dataBak);
	    
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
					content: 'url:${basePath}/demo/select',
					onContentReady: function () {
						initMaterialInput();
						
					}
				});
	        }		
        );
      //设置不可编辑
		UE.getEditor('myEditor').setDisabled('fullscreen');
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
		dataFun(data,dataArr,rowColArr);		
	}
	//操作数组，组装数据
	function dataFun(data,dataArr,rowColArr){
		//遍历dataArr数组，并获取对应元素的行列值，并赋值到data
		var m =0, n = 0;
		var colspan = 0, rowspan = 0;
		var colNum = 0, rowNum = 0;
		for(var i = 0; i < data.length; i++){
			colNum = 0;
			n = 0;
			for(var j = 0,len = data[i].length; j < len; j++){
				rowspan = rowColArr[i][j].row;
				colspan = rowColArr[i][j].col;
				
				console.log("rowspan="+rowspan);
				console.log("colspan="+colspan);
				if(rowspan > 1 || colspan > 1 ){
					///m = rowColArr[i][j].row;
					
					for(var k = 0; k < rowspan; k++){
						for(var l = 0; l < colspan; l++){
							dataArr[i+k][j+colNum+l] = data[i][j];
						}
					}
				}
				colNum = colspan;
				rowNum = rowspan;
				console.log(dataArr);
				debugger;
				//return;
				
				
				/* dataArr[i][n] = data[i][j];
				//console.log("占用行:"+rowColArr[i][j].row);
				console.log("占用列:"+rowColArr[i][j].col);
				console.log("本次计数列"+n);
				n = n + rowColArr[i][j].col;
				//m = m + rowColArr[i][j].row;
				//console.log("下一次计数行"+m);
				console.log("下一次计数列"+n); */
				
				
				//console.log("本次计数行："+m);
			}
		}
		console.log(dataArr)
	}
	
	
	
	function testFun(data,dataArr){
		for(var i = 0; i < 1; i++){
			for(var j=0;j<2;j++){
				for(var n = 0;n<3;n++){
					/* if(dataArr[i][j+n] == 0){
						dataArr[i][j+n] = data[i][j];
					}else{
						dataArr[i][j+n+1]  = data[i][j];
					} */
					dataArr = aaa(data,dataArr,i,j,n);
				}
			}
		}
		
		console.log(data);
		console.log(dataArr);
	}
	
	function aaa(data,dataArr,i,j,n){
		if(j+n > dataArr[i].length){
			return dataArr;
		}
		if(dataArr[i][j+n] == 0){
			dataArr[i][j+n] = data[i][j];
		}else{
			n++;
			aaa(data,dataArr,i,j,n)
		}
	}
	/* function bbb(data,dataArr,i,j,n){
		if(i+n > dataArr.length){
			return dataArr;
		}
		if(dataArr[i+n][j] == 0){
			dataArr[i+n][j] = data[i][j];
		}else{
			n++;
			bbb(data,dataArr,i,j,n)
		}
	} */
</script>
	
</body>
</html>