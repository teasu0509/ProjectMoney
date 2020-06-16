<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>測試管理系統</title>
<!-- bootstrap -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="resources/css/bootstrap-table.min.css" rel="stylesheet">
<!-- FullCalendar v3.8.1 -->
<link href="resources/css/fullcalendar.min.css" rel="stylesheet">
<link href="resources/css/fullcalendar.print.css" rel="stylesheet" media="print">	
<!-- local -->
<link href="resources/css/local.css" rel="stylesheet">

<script src="resources/js/jquery-2.1.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<!-- table -->
<script src="resources/js/tableExport.min.js"></script>
<script src="resources/js/bootstrap-table.min.js"></script>
<script src="resources/js/bootstrap-table-zh-CN.min.js"></script>
<script src="resources/js/bootstrap-table-export.min.js"></script>
<!-- Moment.js v2.20.0 -->
<script src="resources/js/moment.min.js"></script>
<script src="resources/js/calendar.js"></script>
<script src="resources/js/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<!-- local -->
<script src="resources/js/local.js"></script>

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
				<a class="navbar-brand" href="#"><spring:message code="title.main" /></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a data-toggle="tab" onclick="changePage('homePage.jsp');"><span
							class="glyphicon glyphicon-home"></span> <spring:message code="title.home" /></a></li>
					<li><a data-toggle="tab" onclick="changePage('contact.jsp');"><span
							class="glyphicon glyphicon-earphone"> <spring:message code="title.contact" /></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a onclick="logout();"><span
							class="glyphicon glyphicon-log-out"></span> <spring:message code="title.logout" /></a></li>
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
							class="glyphicon glyphicon-th-large"></i> <spring:message code="title.side.main" />
					</a></li>
					<li><a href="#systemSetting" class="nav-header collapsed"
						data-toggle="collapse"> <i class="glyphicon glyphicon-cog"></i>
							<spring:message code="title.side.system.management" /> <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					</a>
						<ul id="systemSetting" class="nav nav-list collapse secondmenu"
							style="height: 0px;">
							<li class="active"><a onclick="changePage('user.jsp');">&nbsp;&nbsp;&nbsp;<i
									class="glyphicon glyphicon-user"></i> <spring:message code="title.side.user.management" />
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
							<li><a onclick="changePage('report.jsp');">&nbsp;&nbsp;&nbsp;<i
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
			<div class="col-md-10 col-sm-6">
				<div class="starter-template" id="content">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title text-center">公告欄</h3>
							</div>
							<div class="panel-body">
								<marquee direction="left" behavior="slide" scrollamount="10" id="">
									<a href="#">預計2020年01月20更版，屆時敬啟期待全新功能!</a>
								</marquee>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title text-center">待辦事項</h3>
							</div>
							<div class="panel-body">test</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a href="#" id="gotop">
    <i class="fa fa-angle-up"></i>
    </a>
</body>
</html>