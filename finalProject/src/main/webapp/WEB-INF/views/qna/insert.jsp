<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Q&A 작성</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<jsp:include page="../css.jsp"></jsp:include>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(function(){	
			//Q&A 폼 유효성 검사
			$('.submit-btn').click(function() {				
				if($('#category').val() === '카테고리') {
						event.preventDefault();
						alert("카테고리를 선택해주세요.");
				} else if ($('#title').val() === '') {
						event.preventDefault();
						alert("제목을 입력해주세요.");
				} else if ($('#content').val() === '') {
						event.preventDefault();
						alert("문의할 내용을 작성해주세요.");
				}
			});
			

		}); //load
		
		//textarea 바이트 수 체크하는 함수
		function fn_checkByte(obj){
		    const maxByte = 3000;
		    const text_val = obj.value; //입력한 문자
		    const text_len = text_val.length; //입력한 문자수
		    
		    let totalByte=0;
		    for(let i=0; i<text_len; i++){
		    	const each_char = text_val.charAt(i);
		        const uni_char = escape(each_char); //유니코드 형식으로 변환
		        if(uni_char.length>4){
		        	// 한글 : 3Byte
	            totalByte += 3;
		        }else{
		        	// 영문,숫자,특수문자 : 1Byte
	            totalByte += 1;
		        }
		    }
		    
		    if(totalByte>maxByte){
		    	alert('최대 3000Byte까지만 입력가능합니다.');
        	document.getElementById("nowByte").innerText = totalByte;
        	document.getElementById("nowByte").style.color = "red";
        }else{
        	document.getElementById("nowByte").innerText = totalByte;
        	document.getElementById("nowByte").style.color = "green";
        }
		}
		
	</script>
	
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>

	<div class="container">
		<div class="breadcrumb fs-5 fw-bold px-4">내 Q&A 목록</div>
 		<div class="row my-3">
     	<div class="col-md-3 col-lg-2">     
		    <ul class="mypage-floating-menu px-0">
		    	<li><a href="#">마이페이지</a></li>
		    	<li><a href="#">회원정보수정</a></li>
		    	<li><a href="#">찜목록</a></li>
		    	<li><a href="#">내 거래 목록</a></li>
		    	<li><a href="#">내동네설정</a></li>
		    	<li class="fw-bold"><a href="qnaSelectAll.do">내 Q&A 목록</a></li>
		    </ul>
   		</div>
   		<div class="col-md-9 col-lg-10 px-5">
      	<div class="row">
      		<div class="col fs-5 fw-bold">Q&A 작성</div>
     			<hr class="mt-3">
      	</div>
      	<form action="qnaInsertOK.do" method="get">
			    <div class="row align-items-start justify-content-center">
		        <input type="hidden" name="writer" value="tester1">
		        <div class="col-md-5 col-lg-3 mb-3 mb-md-0">
		            <select id="category" name="qna_category" class="form-select" aria-label="Default select example">
		                <option>카테고리</option>
		                <option value="1">계정문의</option>
		                <option value="2">채팅, 알림문의</option>
		                <option value="3">거래문의</option>
		                <option value="4">광고문의</option>
		                <option value="5">기타문의</option>
		            </select>
		        </div>
		        <div class="col-md-7 col-lg-9">
		            <input type="text" id="title" name="qna_title" class="form-control" 
		            maxlength="33" placeholder="제목">
		        </div>
			    </div>
			    <div class="row my-3">
		        <div class="col">
		            <textarea id="content" name="qna_content" 
		            	onkeyup="fn_checkByte(this)"
		            	class="form-control" placeholder="내용을 입력해주세요" style="height: 200px"></textarea>
		        </div>
			    </div>
			    <div class="row">
			    	<div class="col">
			    		<sup>(<span id="nowByte">0</span>/3000bytes)</sup>	
			    	</div>
		        <div class="col d-flex justify-content-end">
		            <button type="submit" class="submit-btn">작성하기</button>
		        </div>
			    </div>
				</form>	
  		</div>      
  	</div>
	</div>
</body>
</html>
