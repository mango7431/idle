<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<jsp:include page="../css.jsp"></jsp:include>
	
	<script type="text/javascript">
	let userId = '';
	
	$(function(){
		$.ajax({
			url: "jsonMemberSelectOne.do",
			data: {id : "${param.id}"},
			method: 'GET',
			dataType: 'json',
			success: function(vo){
				console.log('ajax...success:', vo);
				
				userId = vo.id;
					
				let tag_vo = `
		      <tr>
		        <th scope="col">프로필</th>
		        <td><img width="200px" src="resources/uploadimg/\${vo.member_savename}"></td>
		      </tr>
		      <tr>
		        <th scope="col">ID</th>
		        <td>\${vo.id}</td>
		      </tr>
		      <tr>
		        <th scope="col">비밀번호</th>
		        <td>\${vo.pw}</td>
		      </tr>
		      <tr>
		        <th scope="col">이름</th>
		        <td>\${vo.name}</td>
		      </tr>
		      <tr>
		      	<th scope="col">주소</th>
		      	<td>\${vo.address}</td>
		      </tr>
		      <tr>
		      	<th scope="col">신고</th>
		      	<td>\${vo.member_report}</td>
		      </tr>
			  `;
				
				$("#vo").html(tag_vo);
			},
			error: function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});
	}); //load

	function memberDelete() {
	  	var confirmDelete = confirm(userId + "님을 정말 탈퇴시키겠습니까?");
	  	if (confirmDelete) {
      	window.location.href = "memberDeleteOK.do?id="+userId;
      }
	}
	</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="container">
		<div class="breadcrumb fs-5 fw-bold px-4">회원정보</div>
		<div class="row justify-content-center">
			<div class="col-8">
			  <table class="table table-sm table-bordered" id="vo">

			  </table>
			</div>
		</div>
		<div class="row justify-content-center">
		  <div class="col-8">
		    <button>신고 증가</button>
		    <button>신고 감소</button>
		    <button onclick="memberDelete()">회원 탈퇴</button>
		  </div>
		</div>

	</div>
</body>
</html>
