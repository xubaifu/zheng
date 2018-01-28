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
<link href="${basePath}/resources/zheng-admin/plugins/bootstrap3-editable-1.5.1/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
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
	<div style="height: 100%">
		<!-- 选中部门基本信息以及子集信息 -->
		<div class="tab-pane fade in active" id="listtable">
			<table id="table"></table>
		</div>
	</div>
	<jsp:include page="/resources/inc/footer.jsp" flush="true" />
	<script src="${basePath}/resources/zheng-admin/plugins/bootstrap3-editable-1.5.1/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
	<script src="${basePath}/resources/zheng-admin/plugins/bootstrap3-editable-1.5.1/bootstrap3-editable/js/bootstrap-table-editable.js"></script>
	
	<script>
		$(document).ready(function() {
			//$.fn.zTree.init($("#tree"), setting, zNodes);
			loadBootstrapTable();

		});
		var $table = $('#table');
		function loadBootstrapTable() {
			//var curRow = {};
			// bootstrap table初始化
			$table.bootstrapTable({
				//url: '${basePath}/demo/getData',
				//editable : true,//开启编辑模式  
				height : getHeight(),
				//striped : true,
				search : true,
				showRefresh : true,
				showColumns : true,
				minimumCountColumns : 2,
				clickToSelect : true,
				/* detailView : true, */
				//detailFormatter : 'detailFormatter',
				pagination : true,
				paginationLoop : false,
				sidePagination : 'server',
				silentSort : false,
				smartDisplay : false,
				escape : true,
				searchOnEnterKey : true,
				idField : 'name',
				maintainSelected : true,
				toolbar : '#toolbar',
				data : [ {
							"name" : "测试组",
							"level" : "1级",
							"mideaNum" : "0",
							"mideaPercent" : "0",
							"panasonicNum" : "0",
							"panasonicPercent" : "0"
						}, {
							"name" : "测试组",
							"level" : "2级",
							"mideaNum" : "0",
							"mideaPercent" : "0",
							"panasonicNum" : "0",
							"panasonicPercent" : "0"
						}, {
							"name" : "测试组",
							"level" : "3级",
							"mideaNum" : "0",
							"mideaPercent" : "0",
							"panasonicNum" : "0",
							"panasonicPercent" : "0"
						}, {
							"name" : "测试组",
							"level" : "4级",
							"mideaNum" : "0",
							"mideaPercent" : "0",
							"panasonicNum" : "0",
							"panasonicPercent" : "0"
						}, {
							"name" : "测试组",
							"level" : "5级",
							"mideaNum" : "0",
							"mideaPercent" : "0",
							"panasonicNum" : "0",
							"panasonicPercent" : "0"
				} ],
				edit : {
					click : function() {
						alert("单列点击")
					} //这个地主，如何设置onkeypress事件，我需要键盘按下去的时候就响应事件！！设为keypress不行!
				},
				columns : [ [ {
					"title" : "通过",
					"halign" : "center",
					"align" : "center",
					"colspan" : 7
				} ], [ {
					field : 'name',
					title : "分组",
					valign : "middle",
					align : "center",
					colspan : 1,
					rowspan : 2
				}, {
					field : 'level',
					title : "级别",
					valign : "middle",
					align : "center",
					colspan : 1,
					rowspan : 2,
				}, {
					title : "英语",
					valign : "middle",
					align : "center",
					colspan : 2,
					rowspan : 1
				}, {
					title : "日语",
					valign : "middle",
					align : "center",
					colspan : 2,
					rowspan : 1
				}], [ {
					field : 'mideaNum',
					title : '四级',
					valign : "middle",
					align : "center",
					editable : {
						type : 'text',
						title : '二级',
						validate : function(v) {
							if (!v)
								return '二级不能为空';
						}
					},
				}, {
					field : 'mideaPercent',
					title : '六级',
					valign : "middle",
					align : "center",
					editable : {
						type : 'text',
						title : '二级',
						validate : function(v) {
							if (!v)
								return '二级不能为空';
						}
					},
				}, {
					field : 'panasonicNum',
					title : '一级',
					valign : "middle",
					align : "center",
					editable : {
						type : 'text',
						title : '二级',
						validate : function(v) {
							if (!v)
								return '二级不能为空';
						}
					},
				}, {
					field : 'panasonicPercent',
					title : '二级',
					valign : "middle",
					align : "center",
					editable : {
						type : 'text',
						title : '二级',
						validate : function(v) {
							if (!v)
								return '二级不能为空';
						}
					},
				}
				 ] ], //数据加载成功后执行，加载树结构
				onLoadSuccess : function(data) {
					console.log(JSON.stringify(data))
					var data = $('#table').bootstrapTable('getData', true);
					//合并单元格
					mergeCells(data, "name", 1, $('#table'));
					mergeCells(data, "level", 1, $('#table'));

				},
				/* onClickRow: function (row, $element) {
				    curRow = row;
				}, */
				onEditableSave : function(field, row, oldValue, $el) {
					alert("111");
					/* $.ajax({
					   type: "post",
					   url: "/Editable/Edit",
					   data: row,
					   dataType: 'JSON',
					   success: function (data, status) {
					       if (status == "success") {
					           alert('提交数据成功');
					       }
					   },
					   error: function () {
					       alert('编辑失败');
					   },
					   complete: function () {

					   }

					});  */
				}
			});
		}

		/**
		 * 合并单元格
		 * @param data  原始数据（在服务端完成排序）
		 * @param fieldName 合并属性名称
		 * @param colspan   合并列
		 * @param target    目标表格对象
		 */
		function mergeCells(data, fieldName, colspan, target) {
			/* var data = $('#table').bootstrapTable('getData', true);
			//声明一个map计算相同属性值在data对象出现的次数和
			var fieldName=["level","name"];
			var colspan = 1; 
			var target =  $('#table'); */

			var sortMap = {};
			for (var i = 0; i < data.length; i++) {
				for ( var prop in data[i]) {
					if (prop == fieldName) {
						var key = data[i][prop]
						if (sortMap.hasOwnProperty(key)) {
							sortMap[key] = sortMap[key] * 1 + 1;
						} else {
							sortMap[key] = 1;
						}
						break;
					}
				}
			}
			for ( var prop in sortMap) {
				console.log(prop, sortMap[prop])
			}
			var index = 0;
			for ( var prop in sortMap) {
				var count = sortMap[prop] * 1;
				$(target).bootstrapTable('mergeCells', {
					index : index,
					field : fieldName,
					colspan : colspan,
					rowspan : count
				});
				index += count;
			}
		}
	</script>
	
</body>
</html>