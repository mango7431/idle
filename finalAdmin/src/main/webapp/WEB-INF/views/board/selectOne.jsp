<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		console.log('onload...');
		
		$.ajax({
			url:"jsonBoardSelectOne.do",
			data:{board_num:${param.board_num}},
			method:'GET',
			dataType:'json',
			success: function(vo2){
				console.log('ajax success:',vo2);
				
				let board_type = ``;
				if(vo2.board_type==1){
					board_type = `구해요`;
				}else{
					board_type = `팔아요`;
				}
				$('#board_type').html(board_type);
				
				let img1 = `<img src="resources/img/\${vo2.board_savename1 }" height="300px" class="d-block w-100">`;
				let img2 = `<img src="resources/img/\${vo2.board_savename2 }" height="300px" class="d-block w-100">`;
				let img3 = `<img src="resources/img/\${vo2.board_savename3 }" height="300px" class="d-block w-100">`;
				
				$('#img1').html(img1);
				$('#img2').html(img2);
				$('#img3').html(img3);
				
				let board_title = ``;
				if(vo2.board_status==1){
					board_title = `판매중 \${vo2.board_title}`;
				}else{
					board_title = `판매완료 \${vo2.board_title}`;
				}
				$('#board_title').html(board_title);
				
				let date = new Date(vo2.board_date).toLocaleString();
				
				let board_date = `작성날짜 : \${date}`;
				$('#board_date').html(board_date);
				
				let price = `가격 : \${vo2.price}원`;
				$('#price').html(price);
				
				let category = `카테고리 : \${vo2.category}`;
				$('#category').html(category);
				
				let deal_region = `거래지역 : \${vo2.deal_region}`;
				$('#deal_region').html(deal_region);
				
				let count = `찜 \${vo2.likecount} 채팅 \${vo2.chatcount} 조회 \${vo2.view_count}`;
				$('#count').html(count);
				
				let report_count = `경고횟수 : \${vo2.board_report}`;
				$('#report_count').html(report_count);
				
				
				let m_img = `<img src="resources/img/\${vo2.member_savename }" class="d-block w-100">`;
				$('#m_img').html(m_img);
				
				let m_name = `\${vo2.name}`;
				$('#m_name').html(m_name);
				
				let m_address = `\${vo2.address}`;
				$('#m_address').html(m_address);
				
				let board_content = `\${vo2.board_content}`;
				$('#board_content').html(board_content);
				
				let udbutton = `
				<a href="boardReportUp.do?board_num=\${vo2.board_num}">경고증가</a>
				<a href="boardReportDown.do?board_num=\${vo2.board_num}">경고감소</a>
				<a href="boardDeleteOK.do?board_num=\${vo2.board_num}" onclick="return deleteOK()">삭제</a>
				`;
				$('#udbutton').html(udbutton);
				
			},
			error:function(xhr,status,error){
				console.log('xhr:',xhr.status);
			}
		});
		
	});
	
	function deleteOK() {
		  if (confirm("정말로 삭제하시겠습니까? 작성자가 울수도 있습니다.")) {
		    return true; // 예(확인)를 클릭하면 링크가 진행되어 삭제됨
		  } else {
		    return false; // 아니요(취소)를 클릭하면 링크가 취소되어 삭제되지 않음
		  }
		}
	
</script>
</head>
<body>
 <section style="padding-left: 100px; padding-right: 100px;">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1 id="board_type" ></h1>
	<div class="card mb-3" style="max-width: 100%; ">
		<div class="row g-2">
			<div class="col-md-4">
				<div id="carouselExampleControls" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" id="img1">
							
						</div>

						<div class="carousel-item" id="img2">
							
						</div>
						<div class="carousel-item" id="img3">
							
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card-body">
					<h4 class="card-title" id="board_title"></h4>
					<p class="card-text" id="board_date"></p>
					<p class="card-text" id="price"></p>
					<p class="card-text" id="category"></p>
					<p class="card-text" id="deal_region"></p>
					<p class="card-text" id="count"></p>
					<p class="card-text" id="report_count"></p>
					<p class="card-text" id="udbutton"></p>
				</div>
			</div>
		</div>
	</div>
	<div class="card mb-3" style="max-width: 200px;">
		<div class="row g-0">
			<div class="col-md-4" id="m_img"></div>
			<div class="col-md-8">
				<div class="card-body">
					<p class="card-text" id="m_name"></p>
					<p class="card-text" id="m_address"></p>
				</div>
			</div>
		</div>
	</div>
	<hr>
		<div class="form-floating">
			<textarea class="form-control" id="board_content" style="height: 400px" readonly></textarea>
		</div>
	</section>
</body>
</html>
