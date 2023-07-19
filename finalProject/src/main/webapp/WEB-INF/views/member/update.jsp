<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보수정</title>
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
	const idRegExp = /^[a-zA-Z0-9]{4,12}$/; //아이디 
	const pwRegExp = /^[a-zA-Z0-9]{4,12}$/; //비밀번호
	const nameRegExp = /^[가-힣a-zA-Z]{2,20}$/; //이름
	let box;

	$(function() {
// 		console.log("onload....");

		$('#update_form').submit(function() {
			if (!validationPw()) {
				return false;
			} else if (!validationName()) {
				return false;
			}
			alert('회원정보수정 성공하셨습니다!');
			return true;
		});//function(),#update_form.submit

		//비밀번호를 체크하는 함수
		function validationPw() {
			box = document.getElementById('pw');
			if (!pwRegExp.test(box.value)) {
				alert('비밀번호를 정확하게 적어주세요.');
				box.value = "";
				box.focus();
				return false;
			} else if (box.value == document.getElementById('id').value) {
				alert('비밀번호는 아이디와 같을 수 없습니다.')
				box.value = "";
				box.focus();
				return false;
			}
			return true;
		}

		//이름체크하는 함수
		function validationName() {
			box = document.getElementById('name');
			if (!nameRegExp.test(box.value)) {
				alert('이름을 정확하게 적어주세요.');
				box.value = "";
				box.focus();
				return false;
			}
			return true;
		}

		$("sidenav").click(function() {
			toggleClass(".active-color");
		});

	});//end onload
</script>
<style type="text/css">
.myPageSidenav {
	z-index: 1;
	top: 20px;
	left: 10px;
	border: 3px solid #33A1FD;
	overflow-x: hidden;
	padding: 8px 0;
}

.myPageSidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block;
}

/* 마우스 오버(마우스 올렸을때) */
.myPageSidenav a:hover {
	opacity: 0.8;
}

.myPageUpdateBigContainer {
	width: 60%;
	margin: 0 auto;
}

.myPageUpdateForm {
	border: 3px solid #f1f1f1;
	width: 150%;
}

.memberUpdateItem {
	width: 60%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.memberUpdateButton {
	background-color: #33A1FD;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 60%;
}

.memberUpdateButton:hover {
	opacity: 0.8;
}

.memberUpdateContainer {
	padding: 16px;
}
</style>

</head>
<body>

	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="myPageUpdateBigContainer">
		<div class="breadcrumb fs-5 fw-bold px-4">회원정보수정</div>
		<div class="row my-3">
			<div class="col-md-3 col-lg-2">
				<div class="myPageSidenav">
					<ul class="mypage-floating-menu px-0">
						<li><a href="memberSelectOne.do?id=${user_id}">마이페이지</a></li>
						<li><a class="fw-bold" href="memberUpdate.do?id=${user_id}">회원정보수정</a></li>
						<li><a href="qnaSelectAll.do?writer=${user_id}">내 Q&A 목록</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-9 col-lg-10 px-5">
				<div class="row">
					<h4>${user_id}님회원정보수정</h4>
					<form action="memberUpdateOK.do" method="post"
						enctype="multipart/form-data" id="update_form"
						class="myPageUpdateForm">
						<div class="memberUpdateContainer">
							<div class="memberUpdateContainer">
								<label for="id"><b>아이디</b></label> <br>
								<td><span id="span_id">${vo2.id}</span></td> <input
									type="hidden" id="id" name="id" value="${vo2.id}"
									class="memberUpdateItem" required>
							</div>

							<div class="memberUpdateContainer">
								<label for="pw"><b>비밀번호</b></label> <br> <input
									type="password" id="pw" name="pw" value="${vo2.pw}"
									placeholder="비밀번호" class="memberUpdateItem" required>
							</div>
							<div class="memberUpdateContainer">
								<label for="name"><b>이름</b></label> <br> <input type="text"
									id="name" name="name" value="${vo2.name}" placeholder="이름"
									class="memberUpdateItem" required>
							</div>
							<br>
							<div class="memberUpdateContainer">
								<label for="address"><b>주소</b></label> <br> <select
									id="address" name="address" class="memberUpdateItem">
									<option selected>서울</option>
									<option>부산</option>
									<option>대구</option>
									<option>인천</option>
									<option>광주</option>
									<option>대전</option>
									<option>울산</option>
									<option>강원</option>
									<option>경기</option>
									<option>경남</option>
									<option>경북</option>
									<option>전남</option>
									<option>전북</option>
									<option>제주</option>
									<option>충남</option>
									<option>충북</option>
								</select>
							</div>
							<br>
							<div class="memberUpdateContainer">
								<label for="multipartFile"><b>프로필 사진</b></label> <br> <input
									type="file" id="multipartFile" name="multipartFile"> <input
									type="hidden" id="member_savename" name="member_savename"
									value="${vo2.member_savename}" class="memberUpdateItem">
							</div>
							<br>
							<div class="memberUpdateContainer">
								<input type="submit" value="회원수정완료" class="memberUpdateButton">
							</div>
							<hr>
							<div class="memberUpdateContainer">
								<h5>회원 탈퇴</h5>
								<p>회원 탈퇴시 모든 정보가 삭제되며 되돌릴 수 없습니다.</p>
								<p>정말 탈퇴하시겠습니까?</p>
								<a href="memberDeleteOK.do?id=${param.id}">회원탈퇴하기</a>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>