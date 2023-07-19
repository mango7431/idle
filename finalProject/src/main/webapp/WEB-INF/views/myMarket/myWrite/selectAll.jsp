<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

a, a:hover {
	text-decoration: none;
	color: black;
}

p {
	white-space: nowrap;
}

ul, li {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

main {
	width: 100%;
	min-height: 100vh;
	display: flex;
}

.headerTitle {
	margin: 30px 0 0 65px;
}

.reportContainer{
	width: 70%;
	margin: 0 auto;
}

.contenList{
	bolder : 1px solid blue;
	margin-bottom: 50px;
}

.contents {
	width : 85%;
	display: flex;
	flex-direction: row;
	border: 1px solid gray;
	margin: 5px auto;
}

.contentImg{
	width: 30%;
}

.contentImg img {
  max-width: 90%;
  height: 100%;
}

.contentTitle{
	width: 50%;
	align-self: center;
}

.boardStatus{
	color: #33A1FD;
}

.selectStatus{
	text-align: right;
	margin-bottom: 10px;
}

/*판매tab 구매tab 클릭 시*/
.listBtn{
	background: transparent;
	border: none;
	padding: 20px 30px 0px 30px;
	font-weight: bold;
	font-size: large;
	color : black;
}

.listBtn:focus, .listBtn.selected {
	color: #33A1FD;
}

.tabContent {
	display: none;
}
.active {
    display: block;
}

#noContentsMessageSell, #noContentsMessageBuy{
	text-align: center;
	font-size: large;
}

/*...드롭다운메뉴*/
.dropdown{
	width: auto;
	margin-left: auto;
}

.dropBtn{
	background: none;
	margin-left: 0;
	margin-right: 40px;
	border : none;
}

.dropMenuBuy{
	display: none;
	position: absolute;
	background: white;
	border: 1px solid #33A1FD;
	width: 150%;
}

.dropMenuSell{
	display: none;
	position: absolute;
	background: white;
	border: 1px solid #33A1FD;
	width: 150%;
}

.dropMenuBuy a:hover,.dropMenuSell a:hover{
	text-decoration: none;
	font-weight: bold;
}

/*거래완료 모달창*/
#doneModal, #doneSellModal {
	display: flex;
	align-items: center;
	justify-content: center;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 250px;
	background-color: #fff;
	border-radius: 4px;
	padding: 30px 20px;
	border : 1px solid #33A1FD;
}

.doneModal button, .doneSellModal button{
	background-color: #33A1FD;
	border: none;
	color: white;
	border-radius: 5px;
}

.doneModal .close, .doneSellModal .close{
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

.doneModal .close:hover, .doneSellModal .close:hover{
	font-weight: bold;
}


.doneModal-content{
	text-align: center;
}

.doneSellModal-content{
	text-align: center;
}

.doneModal-content label,.doneSellModal-content label{
	cursor: pointer;
}

.doneModal-content input[type="radio"] {
    display: none;
 }
 
.doneSellModal-content input[type="radio"] {
    display: none;
 }
  
.doneModal-content input[type="radio"]:checked + label {
    font-weight: bold;
    color: #33A1FD;
}

.doneSellModal-content input[type="radio"]:checked + label {
    font-weight: bold;
    color: #33A1FD;
}

/*사이드메뉴*/
.sideMarket{
 width : 170px;
 height : 140px;
 margin: 70px 0px 60px 60px;
 padding: 15px;
 background-color: #fffff;
 border: 2px solid #33A1FD;
}

.sideMarket p a{
	font-size: 15px;
}
</style>
<script type="text/javascript">
//상위로이동
function updateBoardDate(board_num){
	$.ajax({
		url: 'jsonBoardDateUpdate.do',
		type: 'get',
		data: {board_num: board_num},
		dataType: 'json',
		success: function(result){
			alert('게시글이 최신글로 변경되었습니다.');
			location.reload();
		},
		error: function(xhr,status,error){
			alert('게시글을 최신글로 변경할 수 없습니다. 에러:'+ error);
		}
	});//end ajax
}//end updateBoardDate

//비공개 //구매중
function updateStatus(board_num,board_status){
	$.ajax({
		url: 'jsonStatusUpdate.do',
		type: 'get',
		data: {board_num: board_num, board_status: board_status},
		dataType: 'json',
		success: function(result){
			alert('게시글이 상태가 변경되었습니다.');
			location.reload();
		},
		error: function(xhr,status,error){
			alert('게시글 상태를 변경할 수 없습니다. 에러:'+ error);
		}
	});//end ajax
}//end updateBoardDate

//삭제
function deleteMyBoard(board_num){
	$.ajax({
		url: 'jsonMyBoardDelete.do',
		type: 'get',
		data: {board_num: board_num},
		dataType: 'json',
		success: function(result){
			alert('게시글이 삭제되었습니다.');
			location.reload();
		},
		error: function(xhr,status,error){
			alert('해당 게시글을 삭제할 수 없습니다. 에러:'+ error);
		}
	});//end ajax
}//end deleteMyBoard

//구매완료 모달창 열기
function openModal(board_num, seller) {
	$('#board_num').val(board_num);
	//seller 분리
	var sellers = seller.split(', ');
	//초기화
	$('#sellerLabel').html(''); 
  	$('#seller_select').empty();
	//분리한 seller 루프돌림
  	sellers.forEach(function(s) {
	    $('#sellerLabel').append('<input type="radio" name="seller" id="seller_select_' + s + '" value="' + s + '">');
	    $('#sellerLabel').append('<label for="seller_select_' + s + '">' + s + '</label><br />');
	    $('#seller_select').append('<option value="' + s + '">' + s + '</option>');
    });
	$('#doneModal').show();
}

//판매완료 모달창 열기
function openSellModal(board_num, buyer) {
	 $('#board_num').val(board_num);
	 var buyers = buyer.split(', ');
  
	$('#buyerLabel').html(''); 
	$('#buyer_select').empty();
	
	buyers.forEach(function(s) {
		$('#buyerLabel').append('<input type="radio" name="buyer" id="buyer_select_' + s + '" value="' + s + '">');
		$('#buyerLabel').append('<label for="buyer_select_' + s + '">' + s + '</label><br />');
		$('#buyer_select').append('<option value="' + s + '">' + s + '</option>');
	});

	$('#doneSellModal').show();
}

// 모달 창 닫기
function closeModal() {
  $('#doneModal').hide();
  $('#doneSellModal').hide();
}

//거래자 선택 후 버튼클릭
function completeBuyModalSubmit(event) {
	event.preventDefault();
	
	var selectedSeller = $('input[name="seller"]:checked').val();
	
	$.ajax({
	  url: 'doneBuyInsertOK.do',
	  type: 'post',
	  data: { 
		  board_num: $('#board_num').val(),
		  seller: selectedSeller
		  },
	  dataType: 'json',
	  success: function(result) {
	    alert('구매완료로 변경되었습니다.');
	    location.reload();
	    closeModal();
	  },
	  error: function(xhr, status, error) {
	    alert('구매완료로 변경할 수 없습니다. 에러: ' + error);
	  }
	});
}

function completeSellModalSubmit(event) {
	event.preventDefault();
	
	var selectedBuyer = $('input[name="buyer"]:checked').val();
	
	$.ajax({
	  url: 'doneSellInsertOK.do',
	  type: 'post',
	  data: { 
		  board_num: $('#board_num').val(),
		  buyer: selectedBuyer
		  },
	  dataType: 'json',
	  success: function(result) {
	    alert('판매완료로 변경되었습니다.');
	    location.reload();
	    closeModal();
	  },
	  error: function(xhr, status, error) {
	    alert('판매완료로 변경할 수 없습니다. 에러: ' + error);
	  }
	});
}
</script>
</head>
<body>
	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<header>
		<div class="headerTitle">
			<h4>
				<b>내가 쓴 글</b>
			</h4>
		</div>
	</header>
	
	<main>
		<!--사이드메뉴 -->
		<div class="sideMarket">
			<p><a href="buySelectAll.do">내 거래 목록</a></p>
			<p><a href="myWriteBuySelectAll.do" style="font-weight: bold;">내가 쓴 글</a></p>
			<p><a href="myLikeSelectAll.do">내 찜 목록</a></p>
		</div>
		
		<div class="reportContainer">
		    <div class="listBtns">
		        <button onclick="openTab('buy')" class="listBtn selected" id="buyBtn">구해요</button><button onclick="openTab('sell')" class="listBtn" id="sellBtn">팔아요</button>
		    </div>
		    <hr />
		    <div class="contenList">
				
			    <div id="buy" class="tabContent active">
				    <div class="selectStatus">
					    <select name="boardStatusFilters">
					    	<option value="1" selected>구매중</option>
					    	<option value="2">구매완료</option>
					    	<option value="3">비공개</option>
					    </select>
				    </div>  
					<div id="noContentsMessageBuy">
					  <p>작성한 구매 게시글이 없습니다.</p>
					</div>
				    <c:choose>
					<c:when test="${empty buyvos}">
<!-- 				        <p>작성된 구매게시글이 없습니다.</p> -->
				    </c:when>
					  <c:otherwise>
					    <c:forEach var="buyvo" items="${buyvos}" varStatus="buyStatus">
					     <!-- 구매완료 모달창 -->
						<div id="doneModal" class="doneModal" style="display: none;">
							<span class="close" onclick="closeModal()">X</span>
							<form id="doneForm" onsubmit="completeBuyModalSubmit(event)">
								<div class="doneModal-content">
									<p><b>판매자를 선택하세요</b></p>
									<input type="hidden" name="board_num" id="board_num" value= "${buyvo.board_num}">
									<input type="radio" name="seller" id="seller_select" value="${buyvo.seller}">
									<label for="seller_select" id="sellerLabel"></label><br />
									<input type="radio" name="seller" id="seller_select2" value="null">
									<label for="seller_select2">선택하지않음</label><br /><br />
									<button type="submit">완료</button>
								</div>
							</form>
						</div>
					        <div class="contents">
					        	<div class="contentImg">
						        	<a href="boardSelectOne.do?board_num=${buyvo.board_num}">
							          <img src="resources/img/${buyvo.board_savename1}" alt="" />
							        </a>
					        	</div>
					        	<div class="contentTitle">
					        		<p>
						        	 <span class="boardStatus" data-status="${buyvo.board_status}">
								        <c:choose>
								            <c:when test="${buyvo.board_status == 1}">
								                <b>구매중</b>
								            </c:when>
								            <c:when test="${buyvo.board_status == 2}">
								                <b>구매완료</b>
								            </c:when>
								            <c:when test="${buyvo.board_status == 3}">
								                <b>비공개</b>
								            </c:when>
								        </c:choose>
								    </span>
								    <a href="boardSelectOne.do?board_num=${buyvo.board_num}">
								    <span>${buyvo.board_title}</span>
								    </a>
								    </p>
						            <p>가격: ${buyvo.price}원</p>
<%-- 						            <p>판매자: ${buyvo.seller}</p> --%>
						            <p>지역 : ${buyvo.deal_region}</p>
						            <p>♡${buyvo.likecount} 채팅${buyvo.chatcount} <span>조회 ${buyvo.view_count}</span></p>
					        	</div>
					        	<div class="dropdown">
								  <button class="dropBtn" onclick="dropdownBuy(${buyStatus.index})" style="font-weight: bold;">...</button>
								  <div id="dropdownBuy" class="dropMenuBuy">
								     <c:choose>
					                    <c:when test="${buyvo.board_status == 1}">
					                        <a href="#" onclick="updateBoardDate(${buyvo.board_num})">상위로 이동</a><br />
					                        <a href="#" onclick="openModal(${buyvo.board_num}, '${buyvo.seller}'); event.preventDefault();">구매완료</a><br />
					                        <a href="#" onclick="updateStatus(${buyvo.board_num},3)">비공개</a><br />
					                        <a href="#" onclick="deleteMyBoard(${buyvo.board_num})">삭제</a>
					                    </c:when>
					                    <c:when test="${buyvo.board_status == 2}">
					                        <a href="#" onclick="updateStatus(${buyvo.board_num},1)">구매중</a><br />
					                        <a href="#" onclick="updateStatus(${buyvo.board_num},3)">비공개</a><br />
					                        <a href="#" onclick="deleteMyBoard(${buyvo.board_num})">삭제</a>
					                    </c:when>
					                    <c:when test="${buyvo.board_status == 3}">
					                        <a href="#" onclick="updateStatus(${buyvo.board_num},1)">구매중</a><br />
					                        <a href="#" onclick="openModal(${buyvo.board_num}, '${buyvo.seller}'); event.preventDefault();">구매완료</a><br />
					                        <a href="#" onclick="deleteMyBoard(${buyvo.board_num})">삭제</a>
					                    </c:when>
					                </c:choose>
								  </div>
								</div>
					        </div>
			         </c:forEach>
					  </c:otherwise>
					</c:choose>
			    </div>
			    
			    <div id="sell" class="tabContent">
			    	<div class="selectStatus">
					    <select name="boardStatusFilters">
					    	<option value="1" selected>판매중</option>
					    	<option value="2">판매완료</option>
					    	<option value="3">비공개</option>
					    </select>
				    </div>			 
					<div id="noContentsMessageSell">
					  <p>작성한 판매 게시글이 없습니다.</p>
					</div>
					<c:choose>
					    <c:when test="${empty sellvos}">
<!-- 				        	<p>작성된 판매게시글이 없습니다.</p> -->
				   		</c:when>
					  <c:otherwise>
					    <c:forEach var="sellvo" items="${sellvos}" varStatus="sellStatus">
					     <!-- 판매완료 모달창 -->
						<div id="doneSellModal" class="doneSellModal" style="display: none;">
							<span class="close" onclick="closeModal()">X</span>
							<form id="doneSellForm" onsubmit="completeSellModalSubmit(event)">
								<div class="doneSellModal-content">
									<p><b>구매자를 선택하세요</b></p>
									<input type="hidden" name="board_num" id="board_num" value= "${sellvo.board_num}">
									<input type="radio" name="buyer" id="buyer_select" value="${sellvo.buyer}">
									<label for="buyer_select" id="buyerLabel"></label><br />
									<input type="radio" name="buyer" id="buyer_select2" value="null">
									<label for="buyer_select2">선택하지않음</label><br /><br />
									<button type="submit">완료</button>
								</div>
							</form>
						</div>
					      <div class="contents">
				        	<div class="contentImg">
					        	<a href="boardSelectOne.do?board_num=${sellvo.board_num}">
						          <img src="resources/img/${sellvo.board_savename1}" alt="" />
						        </a>
				        	</div>
				        	<div class="contentTitle">
				        		<p>
					            <span class="boardStatus" data-status="${sellvo.board_status}">
					            	 <c:choose>
							            <c:when test="${sellvo.board_status == 1}">
							                <b>판매중</b>
							            </c:when>
							            <c:when test="${sellvo.board_status == 2}">
							                <b>판매완료</b>
							            </c:when>
							            <c:when test="${sellvo.board_status == 3}">
							                <b>비공개</b>
							            </c:when>
							        </c:choose>
					            </span>
					            <a href="boardSelectOne.do?board_num=${sellvo.board_num}">
					            <span>${sellvo.board_title}</span>
					            </a>
					            </p>
					            <p>가격: ${sellvo.price}원</p>
<%-- 					            <p>구매자: ${sellvo.buyer}</p> --%>
					            <p>지역 : ${sellvo.deal_region}</p>
					           <p>♡${sellvo.likecount} 채팅${sellvo.chatcount} <span>조회 ${sellvo.view_count}</span></p>
				        	</div>
				        	<div class="dropdown">
							  <button class="dropBtn" onclick="dropdownSell(${sellStatus.index})" style="font-weight: bold;">...</button>
							  <div id="dropdownSell_${sellStatus.index}" class="dropMenuSell">
						    	<c:choose>
				                    <c:when test="${sellvo.board_status == 1}">
				                        <a href="#" onclick="updateBoardDate(${sellvo.board_num})">상위로 이동</a><br />
				                        <a href="#" onclick="openSellModal(${sellvo.board_num}, '${sellvo.buyer}'); event.preventDefault();">판매완료</a><br />
				                        <a href="#" onclick="updateStatus(${sellvo.board_num},3)">비공개</a><br />
				                        <a href="#" onclick="deleteMyBoard(${sellvo.board_num})">삭제</a>
				                    </c:when>
				                    <c:when test="${sellvo.board_status == 2}">
				                        <a href="#" onclick="updateStatus(${sellvo.board_num},1)">판매중</a><br />
				                        <a href="#" onclick="updateStatus(${sellvo.board_num},3)">비공개</a><br />
				                        <a href="#" onclick="deleteMyBoard(${sellvo.board_num})">삭제</a>
				                    </c:when>
				                    <c:when test="${sellvo.board_status == 3}">
				                        <a href="#" onclick="updateStatus(${sellvo.board_num},1)">판매중</a><br />
				                        <a href="#" onclick="openSellModal(${sellvo.board_num}, '${sellvo.buyer}'); event.preventDefault();">판매완료</a><br />
				                        <a href="#" onclick="deleteMyBoard(${sellvo.board_num})">삭제</a>
				                    </c:when>
				                </c:choose>
							  </div>
							</div>
			       		 </div>
					    </c:forEach>
					  </c:otherwise>
					</c:choose>
			    </div>
		    </div>
    	</div>
	</main>
	
<script type="text/javascript">
//탭이동에 따라 block & 버튼색깔변경
function openTab(tabName) {
	var tabContent = document.getElementsByClassName("tabContent");
	
	for (var i = 0; i < tabContent.length; i++) {
	  tabContent[i].style.display = tabContent[i].id === tabName ? "block" : "none";
	}
	
	var tabButtons = document.getElementsByClassName("listBtn");
	for (var i = 0; i < tabButtons.length; i++) {
	  tabButtons[i].classList.toggle("selected", tabButtons[i].id === tabName + "Btn");
	}
	 
	if (tabName === "sell") {
	    $('select[name="boardStatusFilters"]').val('1');
	    showFilteredContent();
	}else if (tabName === "buy") {
	    showFilteredContent();
	}
}

//탭을 오갈때 목록들과 select박스가 일치하지않음. 탭이동하면 무조건 구매중/판매중으로 보이게 함.
function showFilteredContent() {
  var selectedStatus = parseInt($('select[name="boardStatusFilters"]').val());
  var tabName = $('.listBtn.selected').attr('id');

  $('.contents').each(function() {
    var boardStatus = parseInt($(this).find('.boardStatus').data('status'));

    if (tabName === "buyBtn") {
      if (selectedStatus === 0 || boardStatus === selectedStatus) {
        $(this).show();
      } else {
        $(this).hide();
      }
    } else if (tabName === "sellBtn") {
      if (selectedStatus === 1 && boardStatus === 1) {
        $(this).show();
      } else {
        $(this).hide();
      }
    }
  });
 //게시글이 없을 때 메시지 처리
  var visibleContents = $('.contents:visible');
  if (visibleContents.length === 0) {
  	$('#noContentsMessageSell').show();
	$('#noContentsMessageBuy').show();
  } else {
	  $('#noContentsMessageSell').hide();
  	$('#noContentsMessageBuy').hide();
  }
}
	
//거래중,거래완료,비공개 필터 변경시 목록도 변경
$(document).ready(function() {
	$('select[name="boardStatusFilters"]').val('1'); //페이지로드시 구매중으로 시작
	$('select[name="boardStatusFilters"]').change(function() {
	  var selectedStatus = parseInt($(this).val());

    $('.contents').each(function() {
      var boardStatus = parseInt($(this).find('.boardStatus').data('status'));

      if (selectedStatus === 0 || boardStatus === selectedStatus) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  //게시글 없을때
    var visibleContents = $('.contents:visible');
    if (visibleContents.length === 0) {
    	$('#noContentsMessageSell').show();
    	$('#noContentsMessageBuy').show();
    } else {
    	$('#noContentsMessageSell').hide();
    	$('#noContentsMessageBuy').hide();
    }
  });
	$('select[name="boardStatusFilters"]').trigger('change'); //페이지로드 시 기본필터
});

// 구매 및 판매 드롭다운 메뉴
function dropdownMenu(index, menuClass) {
	var dropdownMenus = document.getElementsByClassName(menuClass);
	
	for (var i = 0; i < dropdownMenus.length; i++) {
	  if (i === index) {
	    var display = dropdownMenus[i].style.display;
	    dropdownMenus[i].style.display = display === "block" ? "none" : "block";
	  } else {
	    dropdownMenus[i].style.display = "none";
	  }
	}
}//end dropdwonMenu

function dropdownBuy(buyIndex) {
  dropdownMenu(buyIndex, "dropMenuBuy");
}

function dropdownSell(sellIndex) {
  dropdownMenu(sellIndex, "dropMenuSell");
}

//드롭다운 외 공간 클릭시 none
document.addEventListener('click', function(event) {
	var dropdownMenus = document.querySelectorAll('.dropMenuBuy, .dropMenuSell');
	
	if (!event.target.matches('.dropBtn')) {
	  for (var i = 0; i < dropdownMenus.length; i++) {
	    var dropdownMenu = dropdownMenus[i];
	
	    if (!dropdownMenu.contains(event.target)) {
	      dropdownMenu.style.display = 'none';
	    }
	  }
	}
});
</script>
</body>
</html>