<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
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
// 		console.log('onload....');

		$('#insert_form').submit(
				function() {
// 					console.log("insert_form!", $("#idCheck_flag").val(), $(
// 							"#idCheck_flag").val() === '1');
					if (!validationId()) {
						return false;
					} else if (!validationPw()) {
						return false;
					} else if (!validationPwCheck()) {
						return false;
					} else if (!validationName()) {
						return false;
					}

					else if ($("#idCheck_flag").val() === '1') {
						alert("회원가입 완료되었습니다!");
						return true;
					}
					alert("ID중복검사버튼을 눌러 사용가능한 아이디인지 확인해주세요!");
					return false;
				});

		$('#btn_idCheck').click(function() {
// 			console.log("btn_idCheck!");
			if (!validationId()) {
				return false;
			}
			idCheck();

			return false;
		});
	});

	function idCheck() {
// 		console.log('idCheck()....');

// 		console.log('id:', $("#id").val());
		$.ajax({
			url : "jsonIdCheck.do",
			data : {
				id : $("#id").val()
			},
			method : 'GET',
			dataType : 'json',
			success : function(response) {
// 				console.log('ajax...success:', response);

				let msg = '';
				if (response.result === 'OK') {
					msg = '사용가능한 아이디 입니다';
					$("#idCheck_flag").val(1);
				} else {
					msg = '아이디: 사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.';
					$("#idCheck_flag").val(0);
				}

				$("#demo").html(msg);
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});//end  $.ajax()
	}

	//ID를 체크하는 함수
	function validationId() {
		box = document.getElementById('id');
		if (!idRegExp.test(box.value)) {
			alert('아이디를 정확하게 적어주세요.');
			$("#demo").html("");
			box.value = "";
			box.focus();
			return false;
		}
		return true;
	}

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

	//비밀번호를 한번더 적어서 맞게 썼는지 확인하는 함수
	function validationPwCheck() {
		box = document.getElementById('pwCheck');
		if (box.value != document.getElementById('pw').value) {
			alert('비밀번호가 서로 다릅니다.');
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
</script>
<style type="text/css">
.insertBigContainer {
	width: 60%;
	margin: 0 auto;
}

.insertMediumContainer {
	width: 95%;
	margin: 0 auto;
}

.memberInsertForm {
	border: 3px solid #f1f1f1;
	width: 80%;
}

.memberInsertItem {
	width: 60%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.memberInsertButton {
	background-color: #33A1FD;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 60%;
}

.memberInsertButton:hover {
	opacity: 0.8;
}

.idCheckButton {
	background-color: #33A1FD;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 20%;
}

.idCheckButton:hover {
	opacity: 0.8;
}

.memberInsertContainer {
	padding: 16px;
}
</style>


</head>

<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="insertBigContainer">
			<h3 class="insertMediumContainer">회원가입</h3>
		<form action="memberInsertOK.do" method="post"
			enctype="multipart/form-data" id="insert_form"
			class="memberInsertForm">
			<input type="hidden" id="idCheck_flag" value="0">
			<div class="memberInsertContainer">
				<div class="memberInsertContainer">
					<label for="id"><b>아이디</b></label> <br> <input type="text"
						id="id" name="id" placeholder="아이디" class="memberInsertItem"
						required value="">
					<button type="button" id="btn_idCheck" class="idCheckButton">ID중복검사</button>
					<br> <span id="demo"></span>
					<p>4~12자의 영문 대소문자와 숫자로만 입력</p>
				</div>

				<div class="memberInsertContainer">
					<label for="pw"><b>비밀번호</b></label> <br> <input type="password" 
						id="pw" name="pw" placeholder="비밀번호" class="memberInsertItem" 
						required value="">
					<p>4~12자의 영문 대소문자와 숫자로만 입력</p>
				</div>

				<div class="memberInsertContainer">
					<label for="pwCheck"><b>비밀번호 확인</b></label> <br> <input type="password" 
						id="pwCheck" placeholder="비밀번호 확인" class="memberInsertItem" 
						required value="" >
					<p>4~12자의 영문 대소문자와 숫자로만 입력</p>
				</div>

				<div class="memberInsertContainer">
					<label for="name"><b>이름</b></label> <br> <input type="text"
						id="name" name="name" placeholder="Name" class="memberInsertItem"
						required value="">
				</div>

				<div class="memberInsertContainer">
					<label for="address"><b>주소</b></label> <br> <select
						id="address" name="address" class="memberInsertItem">
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

				<div class="memberInsertContainer">
					<label for="multipartFile"><b>프로필 사진</b></label> <br> <input
						type="file" id="multipartFile" name="multipartFile"
						class="memberInsertItem">
				</div>

				<div class="memberInsertContainer">
					<input type="submit" value="회원가입" class="memberInsertButton">
				</div>
			</div>
		</form>
	</div>
</body>
</html>