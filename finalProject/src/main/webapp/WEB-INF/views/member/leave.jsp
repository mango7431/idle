<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원탈퇴</title>
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
.leaveBigContainer {
	width: 60%;
	margin: 0 auto;
}
</style>
</head>
<body>

	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="leaveBigContainer">
		<div class="breadcrumb fs-5 fw-bold px-4">회원탈퇴</div>
		<div class="row my-3">
			<div class="col-md-3 col-lg-2">
			</div>
			<div class="col-md-9 col-lg-10 px-5">
				<div class="row">
					<h4>회원탈퇴</h4>
					<hr>
					<p>회원 탈퇴가 완료되었습니다.</p>
					<p>그동안 이용해주셔서 감사합니다.</p>
					
					<a href="home.do">메인으로</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>