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
.loginBigContainer {
	width: 60%;
	margin: 0 auto;
}

.loginMediumContainer {
	width: 80%;
	margin: 0 auto;
}

.loginForm {
	border: 3px solid #f1f1f1;
	width: 80%;
	margin: 0 auto;
}

.idPwInput {
	font-size: 20px;
	width: 60%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.memberLoginButton {
	background-color: #33A1FD;
	color: white;
	font-size: 20px;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 60%;
}

.memberLoginButton:hover {
	opacity: 0.8;
}

.loginContainer {
	padding: 16px;
}
</style>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="loginBigContainer">
			<h3 class="loginMediumContainer">로그인</h3>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
			<form action="loginOK.do" method="post" class="loginForm">
				<div class="loginContainer">
					<div class="loginContainer">
						<label for="id"><b>아이디</b></label> <br> <input type="text"
							id="id" name="id" value="tester" placeholder="아이디"
							class="idPwInput" required>
					</div>
					<div class="loginContainer">
						<label for="pw"><b>비밀번호</b></label> <br> <input
							type="password" id="pw" name="pw" value="hi11" placeholder="비밀번호"
							class="idPwInput" required> <br>
						<p>${message}</p>
					</div>
					<div class="loginContainer">
						<input type="submit" value="로그인" class="memberLoginButton">
					</div>
				</div>
			</form>
	</div>
</body>
</html>