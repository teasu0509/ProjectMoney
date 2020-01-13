<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>測試管理系統</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.css">

<script src="resources/js/jquery-2.1.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<script src="https://unpkg.com/tableexport.jquery.plugin/tableExport.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/bootstrap-table.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="https://unpkg.com/bootstrap-table@1.15.5/dist/extensions/export/bootstrap-table-export.min.js"></script>
<!-- Moment.js v2.20.0 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.0/moment.min.js"></script>
<!-- FullCalendar v3.8.1 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.print.css" rel="stylesheet" media="print">
<script src="resources/js/calendar.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
	//切換頁面
	function changePage(value) {
		$("#content").load(value);
	}
	//登出
	function logout() {
		window.history.back(-1);
	}
	
</script>
<style>
@media ( max-width : 767.98px) {
	body {
		font-size: 12px;
	}
}

@media ( min-width : 768px) and (max-width: 1199.98px) {
	body {
		font-size: 14px;
	}
}

@media ( min-width : 1200px) {
	body {
		font-size: 16px;
	}
}
</style>
</head>
<body data-target="#navbar-spy" data-spy="scroll">
	<nav class="nav navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">測試管理系統</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a data-toggle="tab" onclick="changePage('homePage.jsp');"><span
							class="glyphicon glyphicon-home"></span> 首頁</a></li>
					<li><a data-toggle="tab" onclick="changePage('contact.jsp');"><span
							class="glyphicon glyphicon-earphone"> 聯絡我們</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a onclick="logout();"><span
							class="glyphicon glyphicon-log-out"></span> 登出</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							Johnny</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2" style="height: auto; overflow-y: scroll;">
				<ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
					<li class="active"><a href="#"> <i
							class="glyphicon glyphicon-th-large"></i> 歡迎使用
					</a></li>
					<li><a href="#systemSetting" class="nav-header collapsed"
						data-toggle="collapse"> <i class="glyphicon glyphicon-cog"></i>
							系統管理 <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					</a>
						<ul id="systemSetting" class="nav nav-list collapse secondmenu"
							style="height: 0px;">
							<li class="active"><a onclick="changePage('user.jsp');">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-user"></i> 使用者管理
							</a></li>
							<li><a href="#">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-th-list"></i> 選單管理
							</a></li>
							<li><a href="#">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-asterisk"></i> 角色管理
							</a></li>
							<li><a href="#">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-edit"></i> 修改密碼
							</a></li>
							<li><a href="#">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-eye-open"></i> 日誌檢視
							</a></li>
						</ul></li>

					<li><a href="#taskSetting" class="nav-header collapsed"
						data-toggle="collapse"> <i class="glyphicon glyphicon-cog"></i>
							工作管理 <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					</a>
						<ul id="taskSetting" class="nav nav-list collapse secondmenu"
							style="height: 0px;">
							<li><a onclick="changePage('product.jsp');">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-credit-card"></i> 商品管理
							</a></li>
							<li><a href="#">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-file"></i> 報表管理
							</a></li>
							<li><a href="#">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-tasks"></i> 排程管理
							</a></li>
							<li><a onclick="changePage('calendar.jsp');">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-calendar"></i> 行程管理
							</a></li>
						</ul></li>

					<li><a href="#"> <i class="glyphicon glyphicon-globe"></i>
							物流配置 <span class="label label-warning pull-right">12</span>
					</a></li>
					<li><a href="#"> <i class="glyphicon glyphicon-calendar"></i>
							圖表統計
					</a></li>
					<li><a href="#"> <i class="glyphicon glyphicon-info-sign"></i>
							關於系統
					</a></li>
				</ul>
			</div>
			<!-- 渲染頁面 -->
			<div class="col-md-10">
				<div class="starter-template" id="content"></div>
			</div>
		</div>
	</div>
	<!-- 置底 -->
	<nav class="navbar navbar-default navbar-fixed-bottom">
		<div class="container">
			<tr>
				<p class="text-muted text-center">
					<small>Magic 神奇資訊 &copy; 2020</small>
				</p>
			</tr>
			<tr>
				<p class="text-muted text-center">
					<small>地址：新北市新店區神奇路二段66號五樓</small>
				</p>
			</tr>
		</div>
	</nav>
</body>
</html>