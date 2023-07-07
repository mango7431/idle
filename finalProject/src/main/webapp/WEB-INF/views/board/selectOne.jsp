<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="test.com.idle.vo.BoardVO"%>
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
					board_title = `거래중 \${vo2.board_title}`;
				}else if(vo2.board_status==2){
					board_title = `거래완료 \${vo2.board_title}`;
				}else{
					board_title = `숨기기 \${vo2.board_title}`;
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
				
				let count = `♥(찜) \${vo2.likecount} 채팅 \${vo2.chatcount} 조회 \${vo2.view_count}`;
				$('#count').html(count);
				
				if('${user_id}'!=vo2.writer){
					let buttons = `
						<button onclick="likeButton()">찜</button>
						<button onclick="chat('\${vo2.writer}')">채팅</button>
						<button id="reportBtn">신고하기</button>
						`;
						$('#buttons').html(buttons);
				}
				
				let m_img = `<img src="resources/img/thumb_\${vo2.member_savename }" class="d-block w-100">`;
				$('#m_img').html(m_img);
				
				let m_name = `\${vo2.name}`;
				$('#m_name').html(m_name);
				
				let m_address = `\${vo2.address}`;
				$('#m_address').html(m_address);
				
				let board_content = `\${vo2.board_content}`;
				$('#board_content').html(board_content);
				
				if('${user_id}'==vo2.writer){
					let udbutton = `
						<a href="boardUpdate.do?board_num=\${vo2.board_num}">수정</a>
						<a href="boardDeleteOK.do?board_num=\${vo2.board_num}" onclick="return deleteOK()">삭제</a>
						`;
						$('#udbutton').html(udbutton);
						
					let board_status = `
						 <div class="dropdown">
				          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				            거래상태
				          </a>
				          <ul class="dropdown-menu text-small">
				            <li><button onclick="changeStatus(1)" class="dropdown-item">거래중</button></li>
				            <li><button onclick="changeStatus(2)" class="dropdown-item">거래완료</button></li>
				            <li><hr class="dropdown-divider"></li>
				            <li><button onclick="changeStatus(3)" class="dropdown-item">숨기기</button></li>
				          </ul>
				        </div>
					`;
					
					$('#board_status').html(board_status);
				}
				
				//수정 팀원 기능
				$(document).on('click', '#reportBtn', function() {
	                $('#reportModal').show();
	            });

	            $(document).on //수정 팀원 기능end
				
			},
			error:function(xhr,status,error){
				console.log('xhr:',xhr.status);
			}
		});
	});
	
	function likeButton(){
		console.log("likeButton()");
		$.ajax({
			url:"jsonLikeSelectOne.do",
			data:{
				id:'${user_id}',
				board_num:${param.board_num}
			},
			method:'GET',
			dataType:'json',
			success: function(obj){
				console.log(obj);
				
				if(obj.result=='OK'){
					console.log('찜하기');
					
					$.ajax({
						
						url:"jsonLikeInsert.do",
						data:{
							id:'${user_id}',
							board_num:${param.board_num}
						},
						method:'GET',
						dataType:'json',
						success: function(result){
							if(result==1){
								location.href = 'boardSelectOne.do?board_num=${param.board_num}';
							}
						},
						error:function(xhr,status,error){
							console.log('xhr:',xhr.status);
						}
						
					});
					
				}else{
					console.log('찜해제');
					$.ajax({
						
						url:"jsonLikeDelete.do",
						data:{
							likes_num:obj.LikesVO.likes_num
						},
						method:'GET',
						dataType:'json',
						success: function(result){
							if(result==1){
								location.href = 'boardSelectOne.do?board_num=${param.board_num}';
							}
						},
						error:function(xhr,status,error){
							console.log('xhr:',xhr.status);
						}
						
					});
				}
			},
			error:function(xhr,status,error){
				console.log('xhr:',xhr.status);
			}
		});
		
	}
	
	function chat(writer){
		console.log("chat()");
		console.log(writer);
		
		$.ajax({
			url:"jsonRoomInsert.do",
			data:{
				board_num:${param.board_num},
				buyer:'${user_id}',
				seller:writer
			},
			method:'GET',
			dataType:'json',
			success: function(result){
				console.log(result);
				if(result==1){
					location.href = 'roomSelectAll.do';
				}
			},
			error:function(xhr,status,error){
				console.log('xhr:',xhr.status);
			}
			
			
		});
		
	}
	
	function changeStatus(status){
		console.log("changeStatus",status);
		
		$.ajax({
			url:"jsonChangeStatus.do",
			data:{
				board_status:status,
				board_num:${param.board_num}
			},
			method:'GET',
			dataType:'json',
			success: function(result){
				console.log(result);
				if(result==1){
					location.href = 'boardSelectOne.do?board_num=${param.board_num}';
				}
			},
			error:function(xhr,status,error){
				console.log('xhr:',xhr.status);
			}
		});
	}
	
	function deleteOK() {
		  if (confirm("정말로 삭제하시겠습니까? 다시 되돌릴수 없습니다.")) {
		    return true; // 예(확인)를 클릭하면 링크가 진행되어 삭제됨
		  } else {
		    return false; // 아니요(취소)를 클릭하면 링크가 취소되어 삭제되지 않음
		  }
		}
	
</script>
<style type="text/css">
#reportModal{
	width: 30%;
	margin: 0 auto;
	border: 1px solid black;
	background: white;
	position: fixed;
  	left: 50%;
  	top: 50%;
	transform: translate(-50%, -50%);
   	padding: 30px;
   	border-radius: 20px;
}

#reportWarning{
	color : red;
}

.close {
	float: right;
}

.modalBtn{
	text-align: center;
}

.modalContent input[type="radio"] {
    display: none;
 }

.modalContent input[type="radio"]:checked + label {
    font-weight: bold;
}

.modalContent label {
    cursor: pointer;
}

.modalContent label:hover{
	font-weight: bold;
}

.reportBoard{
	height: auto;
	margin-bottom: 15px;
}
.reportBoard label{
	margin-bottom: 18px;
}
</style>
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
					<p class="card-text" id="udbutton"></p>
					<p class="card-text" id="buttons" align="right"></p>
					<p class="card-text" id="board_status"></p>
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
<!-- 수정 팀원 기능: 신고하기 -->
<div id="reportModal"  style="display: none;">
	<button class="close"><span>X</span></button>
	<h2>신고하기</h2>
	<p>아래 신고 사유를 선택해주세요</p>
	<hr>
	<div class="modalContent">
		<form action="blackInsertOK.do" method="post" onsubmit="return blackInsertForm()">
			<div class="reportBoard">
				<input type="hidden" name="targetid" value="${vo2.writer}"/>
				<%-- <input type="hidden" name="reporterid" value="${userId}"/> --%>
				<input type="hidden" name="reporterid" value="tester3"/>
				<input type="hidden" name="board_num" value="${vo2.board_num}"/>
				<input type="hidden" name="black_type" value=""/>
				<input type="radio" name="black_category" id="black_category1" value="1"/><label for="black_category1">광고성 게시글이에요</label><br />
				<input type="radio" name="black_category" id="black_category2" value="2"/><label for="black_category2">거래금지품목(술,약류,담배 등)을 팔아요</label><br />
				<input type="radio" name="black_category" id="black_category3" value="3"/><label for="black_category3">상품정보가 부정확해요</label><br />
				<input type="radio" name="black_category" id="black_category4" value="4"/><label for="black_category4">사기인 것 같아요</label><br />
				<input type="radio" name="black_category" onclick="toggleText(this.value)" id="black_category5" value="5"/><label for="black_category5">기타 사유 입력</label><br />
				<textarea rows="3" cols="40" name="comments" id="comments1" style="display: none;" placeholder="게시글 신고 내용을 작성해주세요."></textarea>	
				<input type="radio" name="black_category" onclick="toggleText(this.value)" id="black_category6" value="6"/><label for="black_category6">'${vo2.name}'님을 신고할래요</label><br />	
				<textarea rows="3" cols="40" name="comments" id="comments2" style="display: none;" placeholder="사용자 신고 내용을 작성해주세요."></textarea>	
			</div>
			<hr />
			<div class="modalBtn">
			<button type="submit">신고등록</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
//신고모달창 show&hide
$(document).ready(function() {
  $('input[name="black_category"]').on('change', function() {
    var value = $(this).val();
    
    if (value === '5') {
      $('#comments1').show();
      $('#comments2').hide();
    } else if (value === '6') {
      $('#comments1').hide();
      $('#comments2').show();
    } else {
      $('#comments1').hide();
      $('#comments2').hide();
    }
  });
  
  var categoryChecked = $('input[name="black_category"]:checked').val();
  if (categoryChecked === '5') {
    $('#comments1').show();
  } else if (categoryChecked === '6') {
    $('#comments2').show();
  }
});

//신고모달창 show&hide
$(function(){
   $('.close').click(function() {
      $('#reportModal').hide();
   });
});

//신고모달창 black_type
$(function() {
   $('input[name="black_category"]').on('change', function() {
     var value = $(this).val();
     if (value >= 1 && value <= 5) {
       $('input[name="black_type"]').val(1);
      } else if (value == 6) {
        $('input[name="black_type"]').val(2);
     }
   });
});

//신고하기 버튼 눌렀을 때
function blackInsertForm() {
  const blackCategoryChecked = document.querySelector('input[name="black_category"]:checked');
   if (!blackCategoryChecked) {
    alert('신고 사유를 선택해주세요.');
      return false; // 폼 전송 막기
    }
   
  const reportConfirm = confirm('허위신고 시 중고링 이용이 제한될 수 있습니다. 정말로 신고하시겠습니까?');
   if (!reportConfirm) {
     return false;
   }
   
 alert('신고가 등록되었습니다.');
 return true;
}
</script>
</body>
</html>
