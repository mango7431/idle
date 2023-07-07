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
	$(function() {
		console.log('onload....');

		$('#insert_form').submit(
				function() {
					console.log("insert_form!", $("#idCheck_flag").val(), $(
							"#idCheck_flag").val() === '1');
					if ($("#idCheck_flag").val() === '1') {
						alert("회원가입 완료되었습니다!");
						return true;
					}
					alert("ID중복검사버튼을 눌러 사용가능한 아이디인지 확인해주세요!");
					return false;
				});

		$('#btn_idCheck').click(function() {
			console.log("btn_idCheck!");

			idCheck();

			return false;
		});
	});

	function idCheck() {
		console.log('idCheck()....');

		console.log('id:', $("#id").val());
		$.ajax({
			url : "jsonIdCheck.do",
			data : {
				id : $("#id").val()
			},
			method : 'GET',
			dataType : 'json',
			success : function(response) {
				console.log('ajax...success:', response);

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
</script>

</head>

<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<form action="memberInsertOK.do" method="post"
		enctype="multipart/form-data" id="insert_form">
		<h3>회원가입</h3>
		<input type="hidden" id="idCheck_flag" value="0">

		<div class="form-group">
			<label for="id">아이디</label> <br> <input type="text" id="id"
				name="id" value="tester" placeholder="ID" required>
			<button type="button" id="btn_idCheck" class="myButton">ID중복검사</button>
			<br> <span id="demo"></span>
		</div>

		<div>
			<label for="pw">비밀번호</label> <br> <input type="password" id="pw"
				name="pw" placeholder="PASSWORD" required value="hi11">
		</div>

		<div>
			<label for="name">이름</label> <br> <input type="text" id="name"
				name="name" placeholder="Name" required value="lee">
		</div>

		<div>
			<label for="address">주소 </label> <br> <input type="text"
				id="address" name="address" placeholder="Address" required
				value="서울">
		</div>

		<div>
			<label for="multipartFile">프로필 사진</label> <br> <input
				type="file" id="multipartFile" name="multipartFile">
		</div>

		<div>
			<input type="submit" class="myButton">
		</div>
	</form>
</body>
</html>