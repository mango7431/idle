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
	margin: 30px 0 0 50px;
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
}

.boardStatus{
	color: blue;
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
	color: blue;
}

.tabContent {
	display: none;
}
.active {
    display: block;
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
	background: #F0FFFF;
	width: 150%;
}

.dropMenuSell{
	display: none;
	position: absolute;
	background: #F0FFFF;
	width: 150%;
}

.dropMmenu a {
	display: block;
	padding: 5px 10px;
	text-decoration: none;
	color: #333;
}

.dropdown-menu a:hover {
	background-color: #ddd;
}
</style>
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
				    <c:choose>
					  <c:when test="${empty buyvos}">
					    <p>작성된 구매게시글이 없습니다.</p>
					  </c:when>
					  <c:otherwise>
					    <c:forEach var="buyvo" items="${buyvos}" varStatus="buyStatus">
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
								    <span>${buyvo.board_title}</span>
								    </p>
						            <p>가격: ${buyvo.price}원</p>
						            <p>지역 : ${buyvo.deal_region}</p>
						            <p>♡4 채팅2 <span>조회 ${buyvo.view_count}</span></p>
							        <c:if test="${empty buyvos}">
							            <p>작성된 구매게시글이 없습니다.</p>
							        </c:if>
					        	</div>
					        	<div class="dropdown">
								  <button class="dropBtn" onclick="dropdownBuy(${buyStatus.index})" style="font-weight: bold;">...</button>
								  <div id="dropdownBuy_${buyStatus.index}" class="dropMenuBuy">
								    <a href="#">상위로 이동</a><br />
								    <a href="#">비공개</a><br />
								    <a href="#">구매완료</a><br />
								    <a href="#">삭제</a>
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
					    	<option value="1">판매중</option>
					    	<option value="2">판매완료</option>
					    	<option value="3">비공개</option>
					    </select>
				    </div>
					<c:choose>
					  <c:when test="${empty sellvos}">
					    <p>작성된 판매게시글이 없습니다.</p>
					  </c:when>
					  <c:otherwise>
					    <c:forEach var="sellvo" items="${sellvos}" varStatus="sellStatus">
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
					            <span>${sellvo.board_title}</span>
					            </p>
					            <p>가격: ${sellvo.price}원</p>
					            <p>지역 : ${sellvo.deal_region}</p>
					            <p>♡4 채팅2 <span>조회 ${sellvo.view_count}</span></p>
				        	</div>
				        	<div class="dropdown">
							  <button class="dropBtn" onclick="dropdownSell(${sellStatus.index})" style="font-weight: bold;">...</button>
							  <div id="dropdownSell_${sellStatus.index}" class="dropMenuSell">
							    <a href="#">상위로 이동</a><br />
							    <a href="#">비공개</a><br />
							    <a href="#">판매완료</a><br />
							    <a href="#">삭제</a>
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
}

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
}

function dropdownBuy(buyIndex) {
  dropdownMenu(buyIndex, "dropMenuBuy");
}

function dropdownSell(sellIndex) {
  dropdownMenu(sellIndex, "dropMenuSell");
}

//거래중,거래완료,비공개 필터
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
  });
	$('select[name="boardStatusFilters"]').trigger('change'); //페이지로드 시 기본필터
});
</script>
</body>
</html>