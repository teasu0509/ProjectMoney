<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<html>
<head>
<script type="text/javascript">
	//	上傳檔案
	function upload() {
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
				$("#successMessageDialog").fadeIn("slow", function() {
					// Animation complete.
				});
			},
			error : function() {
				$("#faildMessageDialog").fadeIn("slow", function() {
					// Animation complete.
				});
			}
		});
	}
</script>
<style>
#relative {
	position: relative;
}

#successMessageDialog {
	position: absolute;
	top: 150px;
	right: 0;
	width: 400px;
	height: 50px;
}

#faildMessageDialog {
	position: absolute;
	top: 120px;
	right: 0;
	width: 300px;
	height: 50px;
}
</style>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<div class="panel panel-default" id="relative">
		<div class="panel-heading">
			<h3 class="panel-title text-center">文件管理</h3>
		</div>
		<div class="panel-body">
			<div class="input-group">
				<span class="input-group-addon">標題:</span> <input type="text"
					class="form-control" placeholder="請填寫文件標題">
			</div>
			<br>
			<div class="input-group">
				<span class="input-group-addon">內容:</span>
				<textarea name="editor1"></textarea>
				<script>
					CKEDITOR.replace("editor1");
				</script>
			</div>
			<br>
			<div class="input-group">
				<span class="input-group-addon">有效期限:</span>
				<div class="custom-control custom-radio">
					&nbsp;&nbsp; <input type="radio" class="custom-control-input"
						id="defaultUnchecked" name="defaultExampleRadios"> <label
						class="custom-control-label" for="defaultUnchecked">1年</label>

					&nbsp;&nbsp; <input type="radio" class="custom-control-input"
						id="defaultUnchecked" name="defaultExampleRadios"> <label
						class="custom-control-label" for="defaultUnchecked">2年</label>

					&nbsp;&nbsp; <input type="radio" class="custom-control-input"
						id="defaultUnchecked" name="defaultExampleRadios"> <label
						class="custom-control-label" for="defaultUnchecked">3年</label>

					&nbsp;&nbsp; <input type="radio" class="custom-control-input"
						id="defaultUnchecked" name="defaultExampleRadios"> <label
						class="custom-control-label" for="defaultUnchecked">永久</label>
				</div>
			</div>
			<br>
			<div class="input-group">
				<span class="input-group-addon">附加檔案:</span>
				<div>
					<form id="uploadForm">
						<td><input class="form-control" type="file" name="file"
							id="file" /></td> <br>
					</form>
				</div>
			</div>
			<br>
			<div>
				<td><input type="button" value="上傳檔案" class="btn btn-primary"
					onclick="upload();"></input></td>
			</div>
		</div>
		<td><p>
				<em><span style="font-size: 8px"><span
						style="color: #e74c3c">&nbsp;&nbsp;&nbsp;※上傳檔案目前暫存位置為D曹的tmp資料夾下</span></span></em>
			</p></td>
	</div>
	<div class="alert alert-success" style="display: none"
		id="successMessageDialog">
		<strong>檔案上傳成功!</strong>
		<button type="button" class="close" id="sucessCloseButton">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="alert alert-danger" style="display: none"
		id="faildMessageDialog">
		<strong>檔案上傳失敗!</strong>
		<button type="button" class="close" id="faildCloseButton">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

	<script type="text/javascript">
		//檔案上傳成功視窗
		$("#sucessCloseButton").click(function() {
			$("#successMessageDialog").fadeOut("slow", function() {
				// Animation complete.
			});
		});
		//檔案上傳失敗視窗
		$("#faildCloseButton").click(function() {
			$("#faildMessageDialog").fadeOut("slow", function() {
				// Animation complete.
			});
		});
	</script>
</body>
</html>