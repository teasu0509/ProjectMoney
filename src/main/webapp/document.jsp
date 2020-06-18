<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">文件管理</h3>
		</div>
		<div class="panel-body">
			<form id="uploadForm">
				<td><input class="form-control" type="file" name="file"
					id="file" /></td> <br>
				<td><button class="btn btn-primary" type="submit">上傳檔案</button></td>

			</form>
		</div>
		<td><p>
				<em><span style="font-size: 8px"><span
						style="color: #e74c3c">&nbsp;&nbsp;&nbsp;※上傳檔案目前暫存位置為D曹的tmp資料夾下</span></span></em>
			</p></td>
	</div>
</body>
<script>
	$(function() {
		$("#uploadForm").submit(function(e) {
			e.preventDefault(); // 停止觸發submit
			console.log("upload");
			var formData = new FormData($("#uploadForm")[0]); // 使用FormData包裝form表單來傳輸資料
			$.ajax({
				type : "POST",
				url : "document/upload",
				data : formData,
				cache : false, // 不需要cache
				processData : false, // jQuery預設會把data轉為query String, 所以要停用
				contentType : false, // jQuery預設contentType為'application/x-www-form-urlencoded; charset=UTF-8', 且不用自己設定為'multipart/form-data'
				dataType : 'text',
				success : function(data) {
					console.log(data);
				}
			});
		});
	});
</script>
</html>