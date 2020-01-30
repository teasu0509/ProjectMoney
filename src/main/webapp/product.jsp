<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
			url : "product/insert",
			data : str,
			success : function(data) {
				$("#ooo").modal('hide');
				$('#demo').bootstrapTable('refresh');
			},
			error : function(hqXHR) {
				alert(hqXHR.status);
			}
		});
	}

	function deleteProductByOne(obj) {
		alert(JSON.stringify(obj));
	}

	function reviseProduct() {
		var price = $('#showPrice').val();
		if (!isNaN(price)) {
			var str = $("#reviseForm").serialize();
			$.ajax({
				type : "post",
				url : "product/revise",
				data : str,
				success : function(data) {
					$("#ccc").modal('hide');
					$('#demo').bootstrapTable('refresh');
				},
				error : function(hqXHR) {
					alert(hqXHR.status);
				}
			});
		}
		if (isNaN(price)) {
			alert('請勿在價格欄位輸入數字以外的內容!');
		}

	}

	function deleteProduct() {
		var str = $('#DeleteCheck').val();
		var deletestr = $('#deleteshowId').val();
		if (str == 'delete') {
			$.ajax({
				type : "post",
				url : "product/delete",
				data : {
					"datas" : deletestr
				},
				success : function(data) {
					alert("刪除成功");
					$("#deleteModal").modal('hide');
					$('#demo').bootstrapTable('refresh');
				},
				error : function(hqXHR) {
					alert(hqXHR.status);
				}
			});
		}
	}
</script>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">商品管理</h3>
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
						<div class="col-md-5">
							<td><input class="form-control" placeholder="名稱"
								required="true" name="name"></td>
						</div>
						<div class="col-md-2">
							<td><input class="form-control" placeholder="價格"
								required="true" name="price"></td>
						</div>
						<div class="col-md-5">
							<td><input class="form-control" placeholder="說明"
								required="true" name="description"></td>
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

	<!-- 跳出修改視窗 -->
	<div id="ccc" class="modal inmodal fade" role="dialog"
		aria-hidden="true" data-backdrop="static" data-keyboard="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<div class="modal-title ">修改商品</div>
				</div>
				<form modelAttribute="reviseForm" method="post" id="reviseForm">
					<div class="modal-body">
						<div class="col-md-5">
							<td><input class="form-control" placeholder="ccc"
								required="true" name="name" class="form-control" id="showName"
								value=""></td>
						</div>
						<input type=hidden class="form-control" placeholder="ccc"
							required="true" name="id" class="form-control" id="showId"
							value="">

						<div class="col-md-2">
							<td><input class="form-control" placeholder="ccc"
								required="true" name="price" class="form-control" id="showPrice"
								value=""></td>
						</div>
						<div class="col-md-5">
							<td><input class="form-control" placeholder="說cc明"
								required="true" name="description" class="form-control"
								id="showDescription" value=""></td>
						</div>
					</div>
				</form>
				<div class="modal-footer">
					<button class="btn" onclick="reviseProduct();">確認</button>
					<button class="btn" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 跳出刪除視窗 -->
	<div id="deleteModal" class="modal inmodal fade" role="dialog"
		aria-hidden="true" data-backdrop="static" data-keyboard="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<div class="modal-title ">刪除確認</div>
				</div>
				<input type=hidden class="form-control" placeholder="ccc"
					required="true" name="id" class="form-control" id="deleteshowId"
					value="">
				<div class="modal-body">
					<div class="col-md-5">
						<td><input class="form-control"
							placeholder="請輸入delete，並且點擊刪除" required="true" name="DeleteCheck"
							class="form-control" id="DeleteCheck" value=""></td>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn" onclick="deleteProduct();">刪除</button>
					<button class="btn" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 跳出批次刪除視窗 -->
	<div id="deleteAllModal" class="modal inmodal fade" role="dialog"
		aria-hidden="true" data-backdrop="static" data-keyboard="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<div class="modal-title ">批次刪除確認</div>
				</div>
				<form modelAttribute="deleteAllIdForm" method="post"
					id="deleteAllIdForm">
					<input type=hidden class="form-control" placeholder="ccc"
						required="true" name="id" class="form-control"
						id="deleteAllshowId" value="">
				</form>
				<form modelAttribute="deleteForm" method="post" id="deleteAllForm">
					<div class="modal-body">
						<div class="col-md-5">
							<td><input class="form-control"
								placeholder="請輸入delete，並且點擊刪除" required="true"
								name="DeleteCheck" class="form-control" id="DeleteAllCheck"
								value=""></td>
						</div>
					</div>
				</form>
				<div class="modal-footer">
					<button class="btn" onclick="deleteAllProduct();">刪除</button>
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
									field : 'price',
									title : '價格',
									align : 'center'
								},
								{
									field : 'description',
									title : '商品描述',
									align : 'center'
								},
								{
									field : 'operation',
									title : '操作',
									align : 'center',
									clickToSelect : false,
									formatter : function(value, row, index) {
										var a = index;
										var b = JSON.stringify(row.id);
										var html = "<button type='button' class='btn btn-primary btn-sm'>詳細資訊</button>&nbsp;&nbsp;";
										html += "<button type='button' class='btn btn-sm btn-warning' data-toggle='modal' data-target='#ccc' data-id='"
												+ JSON.stringify(row.id)
												+ "' data-name='"
												+ JSON.stringify(row.name)
												+ "' data-description='"
												+ JSON
														.stringify(row.description)
												+ "' data-price='"
												+ JSON.stringify(row.price)
												+ "'><span class='glyphicon glyphicon-pencil' aria-hidden='true'/>修改</button>&nbsp;&nbsp;";
										html += "<button type='button' class='btn btn-sm btn-danger'  data-toggle='modal' data-target='#deleteModal' data-id='"
												+ JSON.stringify(row.id)
												+ "'><span class='glyphicon glyphicon-remove' aria-hidden='true'/>刪除</button>&nbsp;&nbsp;";
										return html;

									}
								} ]
					});

	//修改與刪除的modal事件傳值
	$('#ccc').on(
			'show.bs.modal',
			function(event) {
				var btnThis = $(event.relatedTarget); //触发事件的按钮
				var modal = $(this); //当前模态框
				var modalId = btnThis.data('id').replace(/^\"|\"$/g, ''); //解析出data-id的内容
				var modalName = btnThis.data('name').replace(/^\"|\"$/g, '');
				var modalDescription = btnThis.data('description').replace(
						/^\"|\"$/g, '');
				var modalPrice = btnThis.data('price');
				modal.find('#showId').val(modalId);
				modal.find('#showName').val(modalName);
				modal.find('#showDescription').val(modalDescription);
				modal.find('#showPrice').val(modalPrice);
			});

	$('#deleteModal').on('show.bs.modal', function(event) {
		var btnThis = $(event.relatedTarget); //触发事件的按钮
		var modal = $(this); //当前模态框
		var modalId = btnThis.data('id').replace(/^\"|\"$/g, ''); //解析出data-id的内容\
		modal.find('#deleteshowId').val(modalId);
	});

	//批次刪除，獲取checkbox選中的值-------------------------------------
	$('#btn1').click(function() {
		if ($table.bootstrapTable('getSelections') != '') {
			$("#deleteAllModal").modal('toggle');
		}
		if ($table.bootstrapTable('getSelections') == '') {
			alert("請勾選刪除項目!");
		}

	});

	$('#deleteAllModal').on('show.bs.modal', function(event) {
		var result = $table.bootstrapTable('getSelections');
		if (result.length == 0) {
			alert("請勾選要刪除項目");
			return;
		}
		var ids = [];
		for (var i = 0; i < result.length; i++) {
			var item = result[i];
			ids.push(item.id);
		}
		var modal = $(this); //当前模态框
		modal.find('#deleteAllshowId').val(ids);
	});

	function deleteAllProduct() {
		var result = $table.bootstrapTable('getSelections');
		if (result.length == 0) {
			alert("請勾選要刪除項目");
			return;
		}
		console.log('刪除確認');
		var ids = [];
		for (var i = 0; i < result.length; i++) {
			var item = result[i];
			ids.push(item.id);
		}
		var deletestr = $("#deleteAllForm").serialize();
		deletestr = deletestr.slice(deletestr.indexOf('=') + 1)

		if (deletestr.slice(deletestr.indexOf('=') + 1).toLowerCase() == 'delete') {

			$.ajax({
				type : "post",
				url : "product/delete",
				data : {
					"datas" : ids.join()
				},
				success : function(data) {
					alert("刪除成功");
					$("#deleteAllModal").modal('hide');
					$('#demo').bootstrapTable('refresh');

				},
				error : function(hqXHR) {
					alert(hqXHR.status);
				}
			});
		}
	}
</script>
</html>