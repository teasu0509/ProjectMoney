<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery.media.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">報表管理</h3>
		</div>
		<div class="panel-body">
			<div id="handout_wrap_inner"></div>
		</div>
	</div>
</body>
<script>
	//初始化報表-------------------------------------
	$('#handout_wrap_inner')
			.media(
					{
						width : '100%',
						height : '800px',
						autoplay : true,
						src : 'http://storage.xuetangx.com/public_assets/xuetangx/PDF/PlayerAPI_v1.0.6.pdf',
					});
</script>
</html>