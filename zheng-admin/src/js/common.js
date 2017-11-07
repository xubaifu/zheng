$(function() {
	// Waves初始化
	Waves.displayEffect();
	// 数据表格动态高度
	$(window).resize(function () {
		$('#table').bootstrapTable('resetView', {
			height: getHeight()
		});
	});
	// 设置input特效
	$(document).on('focus', 'input[type="text"]', function() {
		$(this).parent().find('label').addClass('active');
	}).on('blur', 'input[type="text"]', function() {
		if ($(this).val() == '') {
			$(this).parent().find('label').removeClass('active');
		}
	});
	// select2初始化
	$('select').select2();
});
// 动态高度
function getHeight() {
	return $(window).height() - 20;
}
// 数据表格展开内容
function detailFormatter(index, row) {
	var html = [];
	$.each(row, function (key, value) {
		html.push('<p><b>' + key + ':</b> ' + value + '</p>');
	});
	return html.join('');
}
// 初始化input特效
function initMaterialInput() {
	$('form input[type="text"]').each(function () {
		if ($(this).val() != '') {
			$(this).parent().find('label').addClass('active');
		}
	});
}
//树形页面展开收缩
function shrinkage(){
	
	//$table.bootstrapTable('refresh');
	if($("#treepage").attr("class") == "folded"){
		$("#treepage").attr("class","unfolded");
		$("#treepagebtn").attr("class","unfolded-btn");
		$("#main").attr("class","treepage-main");
	}else{
		$("#treepage").attr("class","folded");
		$("#treepagebtn").attr("class","folded-btn");
		$("#main").attr("class","treepage-main-folded");
	}
	
}