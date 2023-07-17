<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
body{
	margin:0;
	padding:0;
/* 	font-family:'맑은 고딕', verdana; */
}

a, a:hover{
	text-decoration:none;
	color : black;
}

p{
	white-space: nowrap;
}

ul, li{
	margin:0; 
	padding:0; 
	list-style-type: none;
}

main{
	width: 100%;
    min-height: 100vh;
    padding: 30px 20px 50px 0px;
	position: absolute;
	display: flex;
	flex-direction: column;
}

.headerTitle{
	margin: 30px 0 0 50px;
}

/*필터(사이트메뉴)*/
.side-bar{
	width: 200px;
	min-height: 90%;
	position: absolute;
	left: -180px;
	top: 30px;
	transition: left 0.5s;
	z-index: 1;
}

.side-bar:hover {
	left: 0;
}

.side-bar .boardFilter{
	width: 200px;
	padding-left: 5px;
	background: #d3d3d3;
	border-radius: 20px;
	position: sticky;
	margin-top: 70px;
	top: 4px;
	max-height: 500px;
	overflow-y: auto;
}

.side-bar .boardFilter:hover {
  opacity: 1;
}

.no_scroll {
  -ms-overflow-style: none;
  scrollbar-width: none;
}

.no_scroll::-webkit-scrollbar{
	display: none !important; 
}

.boardFilter img{
	float: right;
	margin: 5px 1px 0px 0px;
	transition: opacity 0.1s;
	opacity: 1;
}

.side-bar:hover .boardFilter img {
  opacity: 0;
}

.side-bar .boardFilter li a{
	color : black;
}

.side-bar .boardFilter li:hover{
	font-weight: bold;
}

input[type="radio"] {
    display: none;
 }

.side-bar .boardFilter input[type="radio"]:checked + label {
    font-weight: bold;
}

label {
    cursor: pointer;
}

.side-bar .moneyFilter input{
	width: 34%;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.side-bar .filterBtn{
	width : 80%;
	margin : 10px;
	border-radius: 10px;
	background: #F0F8FF;
}

#deal_region{
	border: none;
	outline: none;
}

/*글쓰기&정렬*/
.itemMenu {
	width: 100%;
	padding-bottom: 30px;
	display: flex;
	justify-content: space-between;
	padding: auto 10%;
}

.itemSort{
	text-align: right;
	justify-content: space-between;
}

.itemSort select{
	border: none;
	outline: none;
}

#writeBtn{
	margin: 0 30px;
}


#loadBtn{
	font-size: small;
	font-weight: bold;
}

/* 메인 */
.itemContainer{
	width: 80%;
	gap: 50px;
	margin: 0 auto;
	display: flex; 
	justify-content: center;
}

.innerItemContainer{
	width: 100%;
	margin: 0 auto;
	display: flex; 
	justify-content: flex-start;
	flex-wrap: wrap;
}

.sellingItemsContainer{
	width: 100%;
	display: flex; 
	flex-wrap: wrap;
	justify-content: flex-start;
	text-align: center;
	margin-left: 50px;
}

.sellingItems{
	width: 260px;
	float: left;
	margin: 10px;
}

.sellingItems .itemImage{
	width: 100%;
	height: 200px;
	overflow: hidden;
	margin: 0 auto;
	border-radius: 10%;
	text-align: center;
}

.sellingItems .itemImage a img{
	width: 100%;
	height: 100%;
}

.sellingItems .itemContent{
	padding : 5px;
}

.sellingItem{
	display: none;
}

.noList{
  display: flex;
  margin: 0 auto;
  height: auto;
  padding-top: 10%;
}

/*더보기 토글*/
.category{
	display: none;
}

/*업*/
.go-btn {
	position: fixed;
	width: 40px;
	bottom: 20px;
	right: 25px;
	z-index: 2;
	cursor: pointer;
}

#listMoreBtn {
  width: 100%;
  text-align: center;
  margin: 20px 0;
  background: none;
  border: none;
  font-size: large;
  font-weight: bold;
}

#listMoreBtn:hover{
	color: blue;
}
</style>

</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<header>
	<div class="headerTitle"><h4><b>중고거래</b></h4></div>
</header>
<main>
	<aside class="side-bar">
		<div class="boardFilter no_scroll">
			<img width="18px" src="resources/img/sidebar.png" alt="" />
			<p align="center"><b>Filters</b></p>
			<form id="filterForm" action="boardSelectAll.do" method="GET">
				<span><b>Category</b></span>
       		 	<ul  class="categoryList">
<%--        		 		<li><a href="boardSelectAll.do?category=all">전체(${fn:length(vos)})</a></li> --%>
       		 		<li><input type="radio" id="category1" name="category" value="디지털기기"/><label for="category1">디지털기기</label></li>
       		 		<li><input type="radio" id="category2" name="category" value="생활가전"/><label for="category2">생활가전</label></li>
       		 		<li><input type="radio" id="category3" name="category" value="가구"/><label for="category3">가구</label></li>
       		 		<li class="category"><input type="radio" id="category4" name="category" value="주방용품"/><label for="category4">주방용품</label></li>
       		 		<li class="category"><input type="radio" id="category5" name="category" value="유아동"/><label for="category5">유아동</label></li>
       		 		<li class="category"><input type="radio" id="category6" name="category" value="의류"/><label for="category6">의류</label></li>
       		 		<li class="category"><input type="radio" id="category7" name="category" value="잡화"/><label for="category7">잡화</label></li>
       		 		<li class="category"><input type="radio" id="category8" name="category" value="미용"/><label for="category8">미용</label></li>
       		 		<li class="category"><input type="radio" id="category9" name="category" value="스포츠"/><label for="category9">스포츠</label></li>
       		 		<li class="category"><input type="radio" id="category10" name="category" value="게임/음반/도서"/><label for="category10">게임/음반</label></li>
       		 		<li class="category"><input type="radio" id="category11" name="category" value="도서"/><label for="category11">도서</label></li>
       		 		<li class="category"><input type="radio" id="category12" name="category" value="상품권/티켓"/><label for="category12">상품권/티켓</label></li>
       		 		<li class="category"><input type="radio" id="category13" name="category" value="가공식품"/><label for="category13">가공식품</label></li>
       		 		<li class="category"><input type="radio" id="category14" name="category" value="반려동물"/><label for="category14">반려동물</label></li>
       		 		<li class="category"><input type="radio" id="category15" name="category" value="식물"/><label for="category15">식물</label></li>
       		 	</ul>
       		 	 <a href="#" id="loadBtn"> 더 보기</a>
       		 	 
<!-- 			<br /><b>Type  </b> -->
<!-- 			<select id="board_type" name="board_type"> -->
<!-- 				<option value="">전체</option> -->
<!-- 				<option value="2">팔아요</option> -->
<!-- 				<option value="1">구해요</option> -->
<!-- 			</select> -->
				
				<br /><span><b>Type</b></span>
	    		<ul>
			    	<li><input type="radio" id="board_type1" name="board_type" value=""/><label for="board_type1">전체</label></li>
			    	<li><input type="radio" id="board_type2" name="board_type" value="2"/><label for="board_type2">팔아요</label></li>
			    	<li><input type="radio" id="board_type3" name="board_type" value="1"/><label for="board_type3">구해요</label></li>
	     		</ul>
			
				<span><b>Region  </b></span>
				<select id="deal_region" name="deal_region">
					<option>선택</option>
					<option>서울</option>
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
				</select><br />
				
				<span><b>Price</b></span>
				<div class="moneyFilter">
					<input type="number" name="minPrice" id="minPrice" min="0" placeholder="0"/>원~<input type="number" name="maxPrice" id="maxPrice" min="0" placeholder="999,999,999"/>원
				</div><br />
<%-- 				<input type="hidden" id="sortTypeInput" name="sortType" value="${param.sortType}" /> --%>
	        	<button type="submit" onclick="applyFilters()" class="filterBtn">Apply Filters</button>
	        	<button type="reset" onclick="resetFilters()" class="filterBtn">Clear Filter</button>
    		</form>
		</div>
	</aside>
	
	<div class="itemContainer">
		<div class="innerItemContainer">	
			<!-- 상품리스트들 -->
			<div class="itemMenu">
			<a href="boardSelectAll.do?category=all" style="margin-left: 10px; font-weight: bold;" id="allcount">전체(${fn:length(countVos)})</a><br />
			<div  class="itemSort">
				Sort By: <select id="sortType" onchange="sortChange()">
					<option value="latest" ${param.sortType == 'latest' ? 'selected' : ''}>최신순</option>
					<option value="views" ${param.sortType == 'views' ? 'selected' : ''}>인기순</option>
				</select>
			<a href="boardInsert.do" id="writeBtn"><img width="25px" src="resources/img/write.png" alt="" />글쓰기</a>
			</div>
			</div>
			<div class="sellingItemsContainer">
			<c:choose>
				<c:when test="${empty vos}">
					<div class="noList">
					<h4><b>등록된 중고거래 게시글이 없습니다.</b></h4>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="vo" items="${vos}">
				      <c:if test="${vo.board_status != 3}">
				        <div class="sellingItems">
				          <!-- 상품각각 -->
				          <div class="sellingItem">
				            <div class="itemImage">
				            <a href="boardSelectOne.do?board_num=${vo.board_num}">
				                <img src="resources/img/${vo.board_savename1}" alt="" />
				              </a>
				            </div>
				            <div class="itemContent">
				              <a href="boardSelectOne.do?board_num=${vo.board_num}">
				             	<c:choose>
								  <c:when test="${vo.board_type eq 2}">
								     <c:choose>
                                        <c:when test="${vo.board_status eq 1}">
                                         <span style="background:#d3d3d3;border-radius:3px;">판매중</span>
                                        </c:when>
                                        <c:when test="${vo.board_status eq 2}">
                                         <span style="background:#d3d3d3;border-radius:3px;">판매완료</span>
                                        </c:when>
                                     </c:choose>
								  </c:when>
								  <c:when test="${vo.board_type eq 1}">
								    <c:choose>
                                     <c:when test="${vo.board_status eq 1}">
                                       <span style="background:#d3d3d3;border-radius:3px;">구매중</span>
                                      </c:when>
                                      <c:when test="${vo.board_status eq 2}">
                                       <span style="background:#d3d3d3;border-radius:3px;">구매완료</span>
                                      </c:when>
                                    </c:choose>
								  </c:when>
								</c:choose>
				                <span>${vo.board_title}</span><br />
				                <span><fmt:formatNumber value="${vo.price}" pattern="#,###" />원</span><br />
				                <span>${vo.deal_region}</span><br />
				                <span><img width="25px" src="resources/img/view_count.png" alt="" /></span><span>${vo.view_count}</span>
				                <span>♡${vo.likecount} </span>
				                <span><img width="18px" src="resources/img/chat.png" alt=""/></span><span> ${vo.chatcount}</span>
				              </a>
				            </div>
				          </div>
				        </div>
				      </c:if>
				    </c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
			<button id="listMoreBtn">더보기</button>
		</div>
		<div class="go-btn" onclick="window.scrollTo(0, 0);">
			<span><img width="25px" src="resources/img/up.png" alt="" /></span>
		</div>
	</div>
</main>

<script type="text/javascript">
//게시글목록 더보기
$(function(){
    $(".sellingItem").slice(0, 12).show(); // 초기갯수
    $("#listMoreBtn").click(function(e){
        e.preventDefault();

        $(".sellingItem:hidden").slice(0, 12).show(); //몇개씩 보여줄건지

        if ($(".sellingItem:hidden").length === 0) { //남은 숨겨진 아이템이 없는 경우
            $("#listMoreBtn").hide();
        }
    });
});

//최신순,인기순
function sortChange() {
	applyFilters();
 }
 
//필터버튼
function applyFilters() {
       var sortType = document.getElementById("sortType").value;
       //현재 URL을 가져옴.
       var currentURL = window.location.href;
       var filteredURL = updateStringParam(currentURL, 'sortType', sortType);
       window.location.href = filteredURL;
   }

   // URL의 문자열에 파라미터값 업데이트..
   function updateStringParam(currentURL, key, sortType) {
       var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
       var separator = currentURL.indexOf('?') !== -1 ? "&" : "?";
       if (currentURL.match(re)) {
           return currentURL.replace(re, '$1' + key + "=" + sortType + '$2');
       }
       else {
           return currentURL + separator + key + "=" + sortType;
       }
   }

function resetFilters() {
	 document.getElementById("filterForm").reset();
	 location.href= "boardSelectAll.do?category=all";
}
 
 //카테고리 더보기 토글
$(function(){
    $("#loadBtn").click(function(e){
        e.preventDefault();
        $(".category:hidden").slice(0, 5).show(); // 클릭시 더보기 갯수 지저정
        if($(".category:hidden").length == 0){
        	$(this).hide();
        }
    });
});
</script>
</body>
</html>