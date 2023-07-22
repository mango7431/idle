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
// 		console.log("onload....","${param.id}");
		if('${user_id}'===''){
// 			console.log('널입니다.');
			location.href = 'login.do';
		}
		$.ajax({
			url : "jsonMemberSelectOne.do",
			data:{id:"${param.id}"},
			method:'GET',
			dataType:'json',
			success : function(vo2) {
				let tag_vo2 =  `
					 <tr>
				      <td>
				     		<div><img width="200px" src="resources/img/\${vo2.member_savename}"></div>
					        <div>이름: \${vo2.name}</div><br>
					        <div>주소: \${vo2.address}</div><br>
					        <div>
					        <span>상품구매: \${vo2.buy_count}회</span>
					        <span>상품판매: \${vo2.sell_count}회</span>
					        <span>신고누적: \${vo2.member_report}회</span>
					        </div>
					
				      </td>
				    </tr>
				`;
				
				$("#vo2").html(tag_vo2);
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...
		
	});//end onload..

</script>
<style type="text/css">
/*
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
*/

/* 마우스 오버(마우스 올렸을때) */
.myPageSidenav a:hover {
	opacity: 0.8;
}

.myPageBigContainer {
	width: 60%;
	margin: 0 auto;
}

.myPagetable {
	border: 3px solid #f1f1f1;
	width: 80%;
}

.myPageInfo{
	font-size: 20px;

}

</style>

</head>
<body>

	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="myPageBigContainer">
		<div class="breadcrumb fs-5 fw-bold px-4">마이페이지</div>
		<div class="row my-3">
			<div class="col-md-3 col-lg-2">
				<div class="myPageSidenav">
					<ul class="mypage-floating-menu px-0">
						<li class="fw-bold"><a
							href="memberSelectOne.do?id=${user_id}">마이페이지</a></li>
						<li><a href="memberUpdate.do?id=${user_id}">회원정보수정</a></li>
						<li><a href="qnaSelectAll.do?writer=${user_id}">내 Q&A 목록</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-9 col-lg-10 px-5">
				<div class="row">
						<h4>${user_id}님 마이페이지</h4>
					<div class="myPagetable">
						<table>
							<thead>
							</thead>
							<tbody id="vo2" class="myPageInfo">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>