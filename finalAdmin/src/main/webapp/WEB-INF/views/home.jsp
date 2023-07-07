<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="top_menu.jsp"></jsp:include>
	<div class="container">
	<ul>
		<li><a href="jsonMemberSelectAll.do">jsonMemberSelectAll.do</a></li>
		<li><a href="memberSelectAll.do">memberSelectAll.do</a></li>
		<hr>
		<li><a href="jsonMemberSearchList.do?searchKey=id&searchWord=tester1">jsonMemberSearchList.do</a></li>
		<hr>
		<li><a href="jsonMemberSelectOne.do?id=tester1">jsonMemberSelectOne.do</a></li>
	</ul>
	</div>
</body>
</html>
