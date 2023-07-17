<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		
		let fileInput = document.getElementById('multipartFiles');
		let max = 3;
		
		fileInput.addEventListener('change',function(event){
			if(event.target.files.length > max){
				alert('최대 '+max+'개 까지만 선택할 수 있습니다.');
				fileInput.value='';
			}
		});
	});

		

	function check() {
		if (document.getElementById("board_title").value == "") {
			alert("제목을 입력하세요.");
			return;
		}
		if (document.getElementById("price").value == "") {
			alert("가격을 입력하세요");
			return;
		}
		board_form.submit();
	}
</script>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
<section style="padding-left: 100px; padding-right: 100px;">
	<h1 id="board_type" style="margin-left: 60px">상품 등록</h1>
<div style="max-width: 1000px; margin: 0 auto;">
	<form class="row g-3" action="boardUpdateOK.do" method="post" enctype="multipart/form-data" name="board_form">
		<div class="col-12">
			<label for="board_title" class="form-label">제목</label> 
			<input type="text" name="board_title" class="form-control" id="board_title" placeholder="제목을 입력하세요" value="${vo2.board_title }">
		</div>
		<div class="col-12">
			<label for="price" class="form-label">가격</label> 
			<input type="number" name="price" class="form-control" id="price" placeholder="가격을 입력하세요" value="${vo2.price }">
		</div>
		<div class="col-12">
			<label for="writer" class="form-label">작성자</label> 
			<input type="text" name="writer" class="form-control" id="writer" value="tester1" readonly value="${vo2.writer }">
		</div>
		<div class="col-12">
			<label for="board_content" class="form-label">내용</label> 
			<textarea rows="20" cols="40" name="board_content" class="form-control" id="board_content" placeholder="내용을 작성하세요">${vo2.board_content }</textarea>
		</div>
		<div class="col-md-4">
			<label for="category" class="form-label">카테고리</label> 
			<select id="category" name="category" class="form-select">
				<option <c:if test="${vo2.category == '디지털기기'}">selected</c:if>>디지털기기</option>
				<option <c:if test="${vo2.category == '생활가전'}">selected</c:if>>생활가전</option>
				<option <c:if test="${vo2.category == '가구'}">selected</c:if>>가구</option>
				<option <c:if test="${vo2.category == '주방용품'}">selected</c:if>>주방용품</option>
				<option <c:if test="${vo2.category == '유아동'}">selected</c:if>>유아동</option>
				<option <c:if test="${vo2.category == '의류'}">selected</c:if>>의류</option>
				<option <c:if test="${vo2.category == '잡화'}">selected</c:if>>잡화</option>
				<option <c:if test="${vo2.category == '미용'}">selected</c:if>>미용</option>
				<option <c:if test="${vo2.category == '스포츠'}">selected</c:if>>스포츠</option>
				<option <c:if test="${vo2.category == '게임/음반'}">selected</c:if>>게임/음반</option>
				<option <c:if test="${vo2.category == '도서'}">selected</c:if>>도서</option>
				<option <c:if test="${vo2.category == '티켓'}">selected</c:if>>티켓</option>
				<option <c:if test="${vo2.category == '가공식품'}">selected</c:if>>가공식품</option>
				<option <c:if test="${vo2.category == '반려동물'}">selected</c:if>>반려동물</option>
				<option <c:if test="${vo2.category == '식물'}">selected</c:if>>식물</option>
			</select>
		</div>

		<div class="col-md-4">
			<label for="deal_region" class="form-label">거래지역</label> 
			<select id="deal_region" name="deal_region" class="form-select">
				<option <c:if test="${vo2.deal_region == '서울'}">selected</c:if>>서울</option>
				<option <c:if test="${vo2.deal_region == '부산'}">selected</c:if>>부산</option>
				<option <c:if test="${vo2.deal_region == '대구'}">selected</c:if>>대구</option>
				<option <c:if test="${vo2.deal_region == '인천'}">selected</c:if>>인천</option>
				<option <c:if test="${vo2.deal_region == '광주'}">selected</c:if>>광주</option>
				<option <c:if test="${vo2.deal_region == '대전'}">selected</c:if>>대전</option>
				<option <c:if test="${vo2.deal_region == '울산'}">selected</c:if>>울산</option>
				<option <c:if test="${vo2.deal_region == '강원'}">selected</c:if>>강원</option>
				<option <c:if test="${vo2.deal_region == '경기'}">selected</c:if>>경기</option>
				<option <c:if test="${vo2.deal_region == '경남'}">selected</c:if>>경남</option>
				<option <c:if test="${vo2.deal_region == '경북'}">selected</c:if>>경북</option>
				<option <c:if test="${vo2.deal_region == '전남'}">selected</c:if>>전남</option>
				<option <c:if test="${vo2.deal_region == '전북'}">selected</c:if>>전북</option>
				<option <c:if test="${vo2.deal_region == '제주'}">selected</c:if>>제주</option>
				<option <c:if test="${vo2.deal_region == '충남'}">selected</c:if>>충남</option>
				<option <c:if test="${vo2.deal_region == '충북'}">selected</c:if>>충북</option>
			</select>
		</div>
		<div class="col-12">
			<input type="radio" name="board_type" id="board_type" value="1" />구해요
			<input type="radio" name="board_type" id="board_type" value="2" checked="checked" />팔아요
		</div>
		
		<div class="col-12">
			<label for="multipartFiles" class="form-label">이미지사진</label> 
			<input type="file" name="multipartFiles" id="multipartFiles" multiple="multiple" />
		</div>
		
		<div class="col-12">
			<input type="radio" name="board_status" id="board_status" value="1" checked="checked" />거래중
			<input type="radio" name="board_status" id="board_status" value="2" />거래완료
			<input type="radio" name="board_status" id="board_status" value="3" />숨기기
		</div>
		
		<div class="col-12">
			<input type="hidden" name="board_num" class="form-control" id="board_num" value="${vo2.board_num }">
			<input type="hidden" name="board_savename1" class="form-control" id="board_savename1" value="${vo2.board_savename1}">
			<input type="hidden" name="board_savename2" class="form-control" id="board_savename2" value="${vo2.board_savename2}">
			<input type="hidden" name="board_savename3" class="form-control" id="board_savename3" value="${vo2.board_savename3}">
		</div>

		<div class="col-12">
			<input type="button" class="btn btn-primary" value="수정완료" onclick="check()"/>
		</div>
	</form>
	</div>
</section>
</body>
</html>