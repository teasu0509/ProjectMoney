<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>產品列表</title>
	<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/font-awesome/css/font-awesome.css' />" rel="stylesheet">

    <link href="<c:url value='/resources/css/animate.css' />" rel="stylesheet">
	<link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">
</head>
<body>

	<c:forEach items="${list }" var="p" >
		${p.id }
		<br/>
		${p.name }
		<br/>
	</c:forEach>

	<!-- Mainly scripts -->
    <script src="<c:url value='resources/js/jquery-2.1.1.js' />"></script>
    <script src="<c:url value='resources/js/bootstrap.min.js' />"></script>

</body>
</html>