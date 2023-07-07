<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Q&A 목록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<jsp:include page="../css.jsp"></jsp:include>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			//매개변수 가져오기
			var urlParams = new URLSearchParams(window.location.search);
			var parameterCategory = urlParams.get('qna_category') || 0;
					
			var selectedCategory = convertNumToCategory(parseInt(parameterCategory));
		  $("#q-category-" + convertCategoryToEng(selectedCategory)).addClass('selected');
		  
		  console.log("parameterCategory", parameterCategory);
		  
		  renderQnAListPagination(parameterCategory);
		  
		  $(".q-category").on("click", function(){
				$(".q-category").removeClass('selected');
				var btnCategory = $(this).text();
				
			 	$("#q-category-" + convertCategoryToEng(btnCategory)).addClass('selected');
				
				parameterCategory = convertCategoryToNum(btnCategory);
				urlParams.set('qna_category', convertCategoryToNum(btnCategory));
			  urlParams.set('pageNum', 1);
			  $('input[name="pageNum"]').val(1);
				
		    var newUrl = window.location.pathname + '?' + urlParams.toString();
		    
			  renderQnAListPagination(parameterCategory);
		    //window.history.replaceState({}, '', newUrl);
		    window.location.href = newUrl;
			});
		  
			//페이징 처리
			var actionForm = $("#actionForm");
			
			$(document).on("click", ".pagenate_button a", function(e) {
			  $('input[name="qna_category"]').val(parameterCategory);
				e.preventDefault();
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(document).on("click", ".page-num a", function(e) {
			  $('input[name="qna_category"]').val(parameterCategory);
				e.preventDefault();
				
				actionForm.find("input[name='pageNum']").val($(this).text());
				actionForm.submit();
			});
			
			//상세 페이지
			$(document).on("click", ".page-detail", function(e) {
				$('input[name="qna_category"]').val(parameterCategory);
				var qnaNum = $(this).closest("tr").find(".qna-num").text().trim();
				console.log(qnaNum);
				//e.preventDefault();
				var url = "qnaSelectOne.do?qna_num=" + qnaNum
						+"&pageNum=" + $('input[name="pageNum"]').val()
						+"&amount=" + $('input[name="amount"]').val()
						+"&qna_category=" + $('input[name="qna_category"]').val()
						+"&writer=tester1";
				//사용자 정보 수정하기
				
				$(this).attr("href", url);
			});
		}); //load
		
		// Q&A 리스트 ajax
		function renderQnAList(initCategory=0){
			console.log("initCategory:" , initCategory);
			$.ajax({
				url: "jsonQnaSelectAll.do",
				data: {writer: "tester1", //사용자 정보 수정하기
							 qna_category: initCategory,
							 pageNum : $('input[name="pageNum"]').val(),
							 amount : $('input[name="amount"]').val()
				},
				method: 'GET',
				dataType: 'json',
				success: function(vos){
					console.log('ajax...success:', vos);	
				  let tag_vos = '';
					let status = '';
					let txtCategory = '';
					let date = '';
					
					$("#vos").empty();
					
					if(vos.length === 0) {
						tag_vos = `
							<tr>
					      <td scope="row" class="text-center align-middle py-4 my-1" colspan="2">
					      	관련 데이터가 존재하지 않습니다.
					      </td>
					    </tr>
						`;
						$("#vos").html(tag_vos);
					} else {
						$.each(vos, function(index, vo) {						
							if (vo.qna_status === 1) {
								status = '미답변';
						  } else if (vo.qna_status === 2) {
							  status = '답변완료';
						  }
							status = vo.qna_status === 1 ? '미답변' : '답변완료';
							
							txtCategory = convertNumToCategory(vo.qna_category);
							
							date = new Date(vo.qna_date);
							let formattedDate = date.toLocaleString();
							
						  tag_vos += `
						    <tr>
						      <td scope="row" class="text-center align-middle fw-bold qna-num">\${vo.qna_num}</th>
						      <td class="py-4 my-1">
						      	<a href="" class="page-detail">
							        <div class="fs-5"><span class="q-status fw-bold me-2">\${status}</span>\${vo.qna_title}</div>
							        <div class="mt-3">\${txtCategory}</div>
							        <div class="mt-2">\${formattedDate}</div>
							      </a>
						      </td>
						    </tr>
						  `;
							
							$("#vos").html(tag_vos);
						});
					}
				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
		}
		
		// Q&A 리스트 pagination ajax
		function renderQnAListPagination(initCategory=0) {
			$.ajax({
				url: "jsonQnaSelectCount.do",
				data: {writer: "tester1", //사용자 정보 수정하기
							 qna_category: initCategory,
							 pageNum : $('input[name="pageNum"]').val(),
							 amount : $('input[name="amount"]').val()
				},
				method: 'GET',
				dataType: 'json',
				success: function(vo){
					console.log('ajax...success:', vo);					
					$("#pagination").empty();
					
					let tag_page = `   					
						<li class="list-inline-item prev pagenate_button">
			      	<a href="\${vo.startPage-1}"><span>&laquo;</span></a>
			    	</li>
		    	`;

					for (let num = vo.startPage; num <= vo.endPage+1; num++) {
						tag_page += `
							<li class="list-inline-item \${vo.cri.pageNum == num ? "active":""} page-num">
								<a class="page-link" href="">\${num}</a>
							</li>
					  `;
					}
					
					tag_page += `
				    <li class="list-inline-item next pagenate_button">
				      <a href="\${vo.endPage+1}"><span aria-hidden="true">&raquo;</span></a>
				    </li>
					`;
	
					$("#pagination").html(tag_page);
					
					if(vo.prev) {
						$(".prev").show();
					} else {
						$(".prev").hide();
					}
					
					if(vo.next) {
						$(".next").show();
					} else {
						$(".next").hide();
					}
					
					renderQnAList(initCategory);

				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
		}
		
		function convertNumToCategory(num) {
			var category = '';
			if (num === 1) {
		    category = '계정문의';
		  } else if (num === 2) {
		    category = '채팅, 알림문의';
		  } else if (num === 3) {
		    category = '거래문의';
		  } else if (num === 4) {
		    category = '광고문의';
		  } else if (num === 5) {
		    category = '기타문의';
		  } else if (num === 0) {
		    category = '전체';
		  }
			return category;
		}
		
		function convertCategoryToEng(name) {
			var category = '';
			if (name === '계정문의') {
				category = 'account';
		  } else if (name === '채팅, 알림문의') {
			  category = 'chat';
		  } else if (name === '거래문의') {
			  category = 'trade';
		  } else if (name === '광고문의') {
			  category = 'ad';
		  } else if (name === '기타문의'){
			  category = 'etc';
		  } else if (name === '전체') {
		    category = 'all';
		  }
			return category;
		}
		
		function convertCategoryToNum(txt){
			var num = '';
			if (txt === '계정문의') {
				num = 1;
		  } else if (txt === '채팅, 알림문의') {
			  num = 2;
		  } else if (txt === '거래문의') {
			  num = 3;
		  } else if (txt === '광고문의') {
			  num = 4;
		  } else if (txt === '기타문의'){
			  num = 5;
		  } else if (txt === '전체') {
			  num = 0;
		  }
			return num;
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
		    	<li class="fw-bold"><a href="qnaSelectAll.do?writer=tester1">내 Q&A 목록</a></li>
		    	<!-- 사용자 정보 수정하기 -->
		    </ul>
   		</div>
   		<div class="col-md-9 col-lg-10 px-5">
      	<div class="row">
      		<div class="col-md-6 fs-5 fw-bold">Q&A 목록</div>
      		<div class="col-md-6 text-end"><a href="qnaInsert.do">글쓰기</a></div>
     			<hr class="mt-3">
      		<ul class="list-inline q-filter-btn">
      			<li class="list-inline-item px-3 py-2 q-category" id="q-category-all">전체</li>
      			<li class="list-inline-item px-3 py-2 q-category" id="q-category-account">계정문의</li>
      			<li class="list-inline-item px-3 py-2 q-category" id="q-category-chat">채팅, 알림문의</li>
      			<li class="list-inline-item px-3 py-2 q-category" id="q-category-trade">거래문의</li>
      			<li class="list-inline-item px-3 py-2 q-category" id="q-category-ad">광고문의</li>
      			<li class="list-inline-item px-3 py-2 q-category" id="q-category-etc">기타문의</li>	      			
      		</ul>
      	</div>
        <table class="table table-sm">
				  <thead>
				    <tr>
				      <th scope="col" class="col-3 text-center py-3">글번호</th>
				      <th scope="col" class="col-9 text-center py-3">내용</th>
				    </tr>
				  </thead>
				  <tbody id="vos">
				  </tbody>
				</table>
			
				<nav class="text-center">
				  <ul class="list-inline" id="pagination">
				  
				  </ul>
				</nav>  
				
				<form id="actionForm" action="qnaSelectAll.do" method="get">
					<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">
					<input type="hidden" name="qna_category" value="">
					<input type="hidden" name="writer" value="tester1">
					<!-- 유저 정보 수정하기 -->
				</form>  
  		</div>      
	  </div>
	</div>
</body>
</html>
