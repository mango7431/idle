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
	console.log("onload....");

	$('#update_form').submit(
		function() {
			if(!validationPw()){
                return false;
            }else if(!validationName()){
                return false;
            }alert('회원정보수정 성공하셨습니다!');
            return true;
	});//function(),#update_form.submit
	
	//비밀번호를 체크하는 함수
    function validationPw(){
        box = document.getElementById('pw');
        if(!pwRegExp.test(box.value)){
            alert('비밀번호를 정확하게 적어주세요.');
            box.value = "";
            box.focus();
            return false;
        }else if(box.value == document.getElementById('id').value){
            alert('비밀번호는 아이디와 같을 수 없습니다.')
            box.value = "";
            box.focus();
            return false;
        }
        return true;
    }
	
  //이름체크하는 함수
    function validationName(){
        box = document.getElementById('name');
        if(!nameRegExp.test(box.value)){
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
 .sidenav {
  z-index: 1;
  top: 20px;
  left: 10px;
  background: #F6FFCC;
  overflow-x: hidden;
  padding: 8px 0;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 18px;
  color: black;
  display: block;
}

 /* 마우스 오버(마우스 올렸을때) */
.sidenav a:hover {
  color: #064579;
  background: #D2E5A8;
}

/* 마우스 클릭하고있을때 */
.sidenav a:active{
 background-color: #D2E5A8;
 }

</style>

</head>
<body>

	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="container">
		<div class="breadcrumb fs-5 fw-bold px-4">회원정보수정</div>
		<div class="row my-3">
			<div class="col-md-3 col-lg-2">
				<div class="sidenav">
					<ul class="mypage-floating-menu px-0">
						<li><a href="memberSelectOne.do?id=${user_id}">마이페이지</a></li>
						<li><a class="fw-bold" href="memberUpdate.do?id=${user_id}">회원정보수정</a></li>
						<li><a href="#">내 Q&A 목록</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-9 col-lg-10 px-5">
				<div class="row">
					<h4>${user_id}님 회원정보수정</h4>
					<hr>
					<form action="memberUpdateOK.do" method="post"
						enctype="multipart/form-data" id="update_form">

						<div>
							<label for="id">아이디</label> <br>
							<td><span id="span_id">${vo2.id}</span></td> <input type="hidden"
								id="id" name="id" value="${vo2.id}" placeholder="ID" required>
						</div>

						<div>
							<label for="pw">비밀번호</label> <br> <input type="password"
								id="pw" name="pw" placeholder="PASSWORD" required
								value="${vo2.pw}">
						</div>
						<div>
							<label for="name">이름</label> <br> <input type="text"
								id="name" name="name" placeholder="Name" required
								value="${vo2.name}">
						</div>

						<div>
							<label for="address">주소 </label> <br> <select id="address"
								name="address">
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

						<div>
							<label for="multipartFile">프로필 사진</label> <br> <input
								type="file" id="multipartFile" name="multipartFile"> <input
								type="hidden" id="member_savename" name="member_savename"
								value="${vo2.member_savename}">
						</div>

						<div>
							<input type="submit" value="회원수정완료">
						</div>
						<hr>
						<h5>회원탈퇴</h5>
						<p>회원 탈퇴시 모든 정보가 삭제되며 되돌릴 수 없습니다.</p>
						<p>정말 탈퇴하시겠습니까?</p>
						<a href="memberDeleteOK.do?id=${param.id}">회원탈퇴하기</a>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>