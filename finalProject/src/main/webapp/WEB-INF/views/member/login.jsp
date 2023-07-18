<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous"></script>

<style type="text/css">
.loginContainer {
	width: 60%;
	margin: 0 auto;
}

.loginForm {
	border: 3px solid #f1f1f1;
	width: 80%;
}

input[type=text], input[type=password] {
	width: 60%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.myButton {
	background-color: #caffbf;
	color: black;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 60%;
}

.myButton:hover {
	opacity: 0.8;
}

.container {
	padding: 16px;
}
</style>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="loginContainer">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

		<h1>로그인</h1>
		<form action="loginOK.do" method="post" class="loginForm">
			<div class="container">
				<div class="container">
					<label for="id">아이디</label> <br> <input type="text" id="id"
						name="id" value="tester" placeholder="ID" required>
				</div>
				<div class="container">
					<label for="pw">비밀번호</label> <br> <input type="password"
						id="pw" name="pw" value="hi11" placeholder="PASSWORD" required>
				</div>
				<div class="container">
					<input type="submit" value="로그인" class="myButton">
				</div>
			</div>
		</form>
		<p>${message}</p>
	</div>
</body>
</html>