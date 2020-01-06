<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>INSPINIA | Login</title>

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<!-- Mainly scripts -->
<script src="resources/js/jquery-2.1.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body class="gray-bg">

	<div class="middle-box text-center loginscreen animated fadeInDown">
		<div>
			<h3>~.~</h3>
			<p>練習 Spring MVC 的網站</p>
			<p>Login in. To see it in action.</p>
			<form class="m-t" role="form" action="login" method="POST"
				id="login-form" modelAttribute="userFormData">
				<div class="form-group">
					<input type="email" class="form-control" placeholder="Username"
						required="true" name="username">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="Password"
						required="true" name="password">
				</div>
				<button type="submit" class="btn btn-primary block full-width m-b">登入</button>			
				<p class="text-muted text-center">
					<small>忘記密碼?</small>
				</p>
				<a class="btn btn-sm btn-white btn-block" href="register.html">建立帳號</a>
			</form>
			<p class="m-t">
				<small>Intumit 碩網資訊 &copy; 2019</small>
			</p>
		</div>
	</div>
</body>
</html>
