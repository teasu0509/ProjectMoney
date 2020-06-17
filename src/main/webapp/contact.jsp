<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">聯絡我們</h3>
		</div>
		<div class="panel-body">
			<textarea name="editor1"></textarea>
			<script>
				CKEDITOR.replace("editor1");
			</script>
		</div>
</body>
</html>