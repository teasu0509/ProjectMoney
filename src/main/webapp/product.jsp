<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	function insertProduct() {
		var str = $("#insertForm").serialize();
		$.ajax({
			type : "post",
			url : "insert",
			data : str,
			success : function(data) {

			},
			error : function(hqXHR) {
				alert(hqXHR.status);
			}
		});
	}
	function deleteProductByOne(obj) {
		alert(JSON.stringify(obj));
	}
</script>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">商品資訊</h3>
		</div>
		<div class="panel-body">
			<div id="toolbar">
				<button id="build" type="button" class="btn btn-success"
					data-toggle="modal" data-target="#ooo">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
				</button>
				<button id="btn1" type="button" class="btn btn-danger">
					<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>刪除
				</button>
			</div>

			<table id="demo">
			</table>
		</div>
	</div>
	<!-- 跳出新增視窗 -->
	<div id="ooo" class="modal inmodal fade" role="dialog"
		aria-hidden="true" data-backdrop="static" data-keyboard="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<div class="modal-title ">新增商品</div>
				</div>
				<form modelAttribute="insertForm" method="post" id="insertForm">
					<div class="modal-body">
						<div class="col-md-6">
							<td><input class="form-control" placeholder="名稱"
								required="true" name="name"></td>
						</div>
						<div class="col-md-6">
							<td><input class="form-control" placeholder="價格"
								required="true" name="price"></td>
						</div>
					</div>
				</form>
				<div class="modal-footer">
					<button class="btn" onclick="insertProduct();">確認</button>				
					<button class="btn" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$("button[name='toggle']").height(20);
		$("button[name='refresh']").height(20);
	});

	//初始化Table----------------------------------
	var $table = $('#demo')
			.bootstrapTable(
					{
						url : "product/get",
						dataType : "json",
						method : 'get',
						dataField : "data",

						classes : 'table table-hover',

						toolbar : '#toolbar',
						clickToSelect : true,
						pagination : true,
						pageSize : 5,
						pageList : [ 5, 10, 15, 20 ],
						pageNumber : 1,

						showColumns : true,
						showToggle : true,
						showRefresh : true,
						showExport : true,
						search : true,

						exportOptions : {
							ignoreColumn : [ 4 ]
						},//不匯出欄位
						onPageChange : function(currentPage, pageSize) {
							console.log("第:" + currentPage + "共:" + pageSize
									+ "頁");
						},
						formatRecordsPerPage : function(pageSize) {
							return '&nbsp;&nbsp;每頁顯示' + pageSize + '筆';
						},
						formatShowingRows : function(fromIndex, toIndex,
								totalSize) {

							var currentPage = Math.ceil(fromIndex
									/ this.pageSize);
							var totalPageCount = Math.ceil(totalSize
									/ this.pageSize);
							return '第' + currentPage + '頁 &nbsp;&nbsp;共'
									+ totalPageCount + '頁';
						},
						columns : [
								{
									field : 'checkbox',
									title : 'id',
									align : 'center',
									width : 40,
									visible : true,
									checkbox : true
								},
								{
									field : 'id',
									title : 'ID',
									align : 'center'
								},
								{
									field : 'name',
									title : '名稱',
									align : 'center'
								},
								{
									field : 'description',
									title : '商品描述',
									align : 'center'
								},
								{
									field : 'price',
									title : '價格',
									align : 'center'
								},
								{
									field : 'operation',
									title : '操作',
									align : 'center',
									clickToSelect : false,
									formatter : function(value, row, index) {
										var a = index;
										var b = JSON.stringify(row);

										var html = "<button type='button' class='btn btn-primary btn-sm'>詳細資訊</button>&nbsp;&nbsp;";
										html += "<button type='button' class='btn btn-sm btn-warning'><span class='glyphicon glyphicon-pencil' aria-hidden='true'/>修改</button>&nbsp;&nbsp;";
										html += "<button type='button' class='btn btn-sm btn-danger' onclick='deleteProductByOne("
												+ b
												+ ");'><span class='glyphicon glyphicon-remove' aria-hidden='true'/>刪除</button>&nbsp;&nbsp;";
										return html;
									}
								} ]
					});

	//獲取checkbox選中的值-------------------------------------
	$('#btn1').click(function() {
		var result = $table.bootstrapTable('getSelections');
		if (result.length == 0) {
			alert("請勾選要刪除項目");
			return;
		}
		console.info(result);
		var ids = [];
		for (var i = 0; i < result.length; i++) {
			var item = result[i];
			ids.push(item.id);
		}
		alert(ids);
	});
</script>
</html>