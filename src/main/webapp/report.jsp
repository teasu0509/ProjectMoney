<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.media.js"></script>
<script type="text/javascript">
	function a() {
		//初始化報表-------------------------------------
		$('#handout_wrap_inner')
				.media(
						{
							width : '100%',
							height : '800px',
							autoplay : true,
							src : '/report/report3.pdf',
						});
	}
</script>
</head>

<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">報表管理</h3>
		</div>
		<div class="panel-body">
			<div class="col-auto my-1">
				<table style="border-collapse: separate; border-spacing: 0px 10px;">
					<tr>
						<td width="10%" align="right"><label class="mr-sm-2"
							for="inlineFormCustomSelect">類型:&nbsp;&nbsp;</label></td>
						<td width="50%"><select class="form-control"
							id="inlineFormCustomSelect">
								<option selected>&nbsp;&nbsp;&nbsp;--請選擇--&nbsp;&nbsp;&nbsp;</option>
								<option value="1">&nbsp;&nbsp;水果</option>
								<option value="2">&nbsp;&nbsp;蔬菜</option>
						</select></td>
						<td width="10%"></td>
						<td width="10%"></td>
					</tr>
					<tr>
						<td width="10%" align="right"><label class="mr-sm-2"
							for="inlineFormCustomSelect">產地:&nbsp;&nbsp;</label></td>
						<td width="50%"><select class="form-control"
							id="inlineFormCustomSelect">
								<option selected>&nbsp;&nbsp;&nbsp;--請選擇--&nbsp;&nbsp;&nbsp;</option>
								<option value="1">&nbsp;&nbsp;台北</option>
								<option value="2">&nbsp;&nbsp;台中</option>
								<option value="3">&nbsp;&nbsp;台南</option>
								<option value="3">&nbsp;&nbsp;宜蘭</option>
						</select></td>
					<tr>
					<tr>
						<td width="10%" align="right"><label class="mr-sm-2"
							for="inlineFormCustomSelect">描述關鍵字:&nbsp;&nbsp;</label></td>
						<td><label class="sr-only" for="inlineFormInputName">Name</label>
							<input type="text" class="form-control" id="inlineFormInputName"
							placeholder="請輸入..."></td>
						<td></td>
						<td><button type="button" class="btn btn-primary"
								onclick="a();">預覽</button></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="panel-body">
			<div id="handout_wrap_inner"></div>
		</div>
	</div>
</body>
</html>