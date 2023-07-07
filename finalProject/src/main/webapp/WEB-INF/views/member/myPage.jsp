<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
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
<script type="text/javascript">
	$(function(){
		console.log("onload....","${param.id}");
	});//end onload..

</script>


</head>
<body>

	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="container">
		<div class="breadcrumb fs-5 fw-bold px-4">마이페이지</div>
		<div class="row my-3">
			<div class="col-md-3 col-lg-2">
				<ul class="mypage-floating-menu px-0">
					<li class="fw-bold"><a href="memberSelectOne.do?id=${user_id}">마이페이지</a></li>
					<li><a href="#">회원정보수정</a></li>
					<li><a href="#">찜목록</a></li>
					<li><a href="#">내가 쓴 글</a></li>
					<li><a href="#">내 거래 목록</a></li>
					<li><a href="#">내동네설정</a></li>
					<li><a href="#">내 Q&A 목록</a></li>
					<!-- 사용자 정보 수정하기 -->
				</ul>
			</div>
			<div class="col-md-9 col-lg-10 px-5">
				<div class="row">
					<h4>${user_id}님마이페이지</h4>
					<hr>

					<table>
						<thead>
							<tr>
								<th>id</th>
								<th>pw</th>
								<th>name</th>
								<th>address</th>
								<th>member_report</th>
								<th>프로필이미지</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="vo2">
						</tbody>

					</table>

				</div>
			</div>
		</div>
	</div>

</body>
</html>