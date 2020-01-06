<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css">

<script src="resources/js/jquery-2.1.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/locale/bootstrap-table-zh-CN.min.js"></script>

</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">商品資料查詢結果</h3>
		</div>
		<div class="panel-body">		
			<table id="demo">
			</table>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$("button[name='toggle']").height(20);
		$("button[name='refresh']").height(20);		
	});

	$('#demo')
			.bootstrapTable(
					{
						url : "${home}ec", 				
						dataType : "json", 
						method : 'get',  
						dataField : "data",        
						/*queryParams : function(params) {//後台分頁用 
							return {
								offset : params.offset,
								limit : params.limit
							};
						},*/
						classes : 'table table-hover',
						//uniqueId:'id', //哪一個欄位是key
						//sortName:'name', //依照那個欄位排序			
						//height : 520,
						clickToSelect : true, 
						pagination : true, //是否要分頁
						pageSize : 5, //一頁顯示幾筆
						pageList : [ 5, 10, 15, 20 ], //一頁顯示幾筆的選項
						pageNumber : 1,
						
						//可於ToolBar上顯示的按鈕
						showColumns : true, //顯示/隱藏哪些欄位
						showToggle : true, //名片式/table式切換
						//showPaginationSwitch : true, //分頁/不分頁切換
						showRefresh : true, //重新整理
						search : true, //查詢

						onPageChange : function(currentPage, pageSize) {
							console.log("目前頁數:" + currentPage + ",一頁顯示:"
									+ pageSize + "筆");
						},
						formatRecordsPerPage : function(pageSize) {
							return '&nbsp;&nbsp;每頁顯示' + pageSize + '筆';
						},
						formatShowingRows : function(fromIndex, toIndex, totalSize) {
							//目前第幾頁
							var currentPage = Math.ceil(fromIndex / this.pageSize);
							//總共幾頁
							var totalPageCount = Math.ceil(totalSize / this.pageSize);
							return '第' + currentPage + '頁&nbsp;&nbsp;共' + totalPageCount + '頁';
						},
						columns : [
								{
									field : 'checkbox',
									title : '選取',
									align : 'center',
									width : 80,
									visible : true,
									checkbox : true
								},
								{
									field : 'id',
									title : 'ID',
									align : 'center'
								},
								{
									field : 'description',
									title : '描述',
									align : 'center'
								},
								{
									field : 'name',
									title : '商品名稱',
									align : 'center'
								},
								{
									field : 'price',
									title : '價格',
									align : 'center'
								},
								{
									field : 'id',
									title : '操作',
									align : 'center',
									formatter : function(value, row, index) {
										var html = "<button type='button' class='btn btn-primary btn-sm'>詳細資料</button>&nbsp;&nbsp;";
										html += "<button type='button' class='btn btn-sm btn-warning'><span class='glyphicon glyphicon-pencil' aria-hidden='true'/>修改</button>&nbsp;&nbsp;";
										html += "<button type='button' class='btn btn-sm btn-danger'><span class='glyphicon glyphicon-remove' aria-hidden='true'/>刪除</button>&nbsp;&nbsp;";
										return html;
									}
								} ]
					});
</script>
</html>
