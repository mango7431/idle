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
    padding: 30px 20px 50px 20px;
	position: absolute;
	display: flex;
	flex-direction: column;
/* 	z-index: 1; */
}

.headerTitle{
	margin: 30px 0 0 50px;
}

/*필터(사이트메뉴)*/
aside{
	width: 15%;
/* 	border: 1px solid black;	 */
	min-height: 100vh;
/* 	position: sticky; */
	position: absolute;
	display: flex;
	flex-direction: column;
	margin-top: 4%;
/* 	z-index: 1; */
/* 	position: sticky; */
/*     align-self: flex-start; */
/*     top: 0; */
}

aside .boardFilter{
	width : 100%;
	border: 1px solid black;
	margin: 0 10px;
	padding-left: 5px;
	background: #f8f8ff;
}

aside .boardFilter li a{
	color : black;
}

aside .boardFilter li:hover{
	font-weight: bold;
}

input[type="radio"] {
    display: none;
 }

aside .boardFilter input[type="radio"]:checked + label {
    font-weight: bold;
}

label {
    cursor: pointer;
}

aside .moneyFilter input{
	width: 34%;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

aside .filterBtn{
	width : 80%;
	margin : 10px;
	border-radius: 10px;
	background: #F0F8FF;
}

.itemMenu{
	padding-bottom: 30px;
}

.itemshow button{
	width : 15%;
	margin : 10px;
	border-radius: 10px;
	background: #F0F8FF;
}

.itemshow {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.itemshow > button:last-child {
  margin-left: auto;
  margin-right: 25px;
  width : 10%;
  height : 35px;
  border-radius: 20px;
  background: silver;
}

.itemSort {
  float: right;
  margin-right: 10px;
}

/* 메인 */
.itemContainer{
	width: 82%;
/* 	border: 1px solid black;	 */
	gap: 50px;
	flex-direction: row;
	flex-wrap: wrap;
	margin: 0 0 0 17%;
/* 	position: relative; */
/* 	height: 100%; */
}

.sellingItemsContainer{
	margin-left: 2%;
}

.sellingItems{
	width: 236px;
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
/* 	object-fit: cover; */
/* 	display: block; */
/*  	margin: 0 auto; */
}

.sellingItems .itemContent{
	padding : 5px;
}

.noList{
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

/*토글*/
.category{
	display: none;
}
</style>

</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<header>
	<div class="headerTitle"><h4><b>중고거래</b></h4></div>
</header>
<main>
	<aside>
		<div class="boardFilter">
			<p align="center"><b>Filters</b></p>
			<p><b>Category</b></p>
			<form id="filterForm" action="boardSelectAll.do" method="GET">
       		 	<ul  class="categoryList">
       		 		<li><a href="boardSelectAll.do?category=all">전체(${fn:length(vos)})</a></li>
       		 		<li><input type="radio" id="category1" name="category" value="디지털기기"/><label for="category1">디지털기기</label></li>
       		 		<li><input type="radio" id="category2" name="category" value="생활가전"/><label for="category2">생활가전</label></li>
       		 		<li><input type="radio" id="category3" name="category" value="가구"/><label for="category3">가구</label></li>
       		 		<li><input type="radio" id="category4" name="category" value="주방용품"/><label for="category4">주방용품</label></li>
       		 		<li><input type="radio" id="category5" name="category" value="유아동"/><label for="category5">유아동</label></li>
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
       		 	<br />
			<p><b>Price</b></p>
			<div class="moneyFilter">
				<input type="number" name="minPrice" min="0"/>원~
				<input type="number" name="maxPrice" min="0"/>원
			</div>
        	<button type="submit" onclick="applyFilters()" class="filterBtn">Apply Filters</button><br />
        	<button type="reset" onclick="resetFilters()" class="filterBtn">Clear Filter</button>
    	</form>
		</div>
	</aside>
	
	<div class="itemContainer">
		<div>
			<div class="itemMenu">
			<div class="itemshow">
				<button onclick="showAllBoards()">전체</button>
				<button onclick="showSellBoards()">팔아요</button>
				<button onclick="showBuyBoards()">구해요</button>
				<button onclick="location.href='boardInsert.do'">글쓰기</button>
			</div>
				
			<div  class="itemSort">
				Sort By: <select id="sortType" onchange="sortChange()">
					<option value="latest">최신순</option>
					<option value="views">인기순</option>
				</select>
			</div>
			</div>
			<!-- 상품리스트들 -->
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
				                <span>♡ ${vo.likecount}</span>
				              </a>
				            </div>
				          </div>
				        </div>
				      </c:if>
				    </c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">

	//최신순,조회수순
	function sortChange() {
		 var sortType = document.getElementById("sortType").value;
		location.href = "boardSelectAll.do?sortType=" + sortType;
	 }
	
	//필터버튼
	function applyFilters() {
		  document.getElementById("filterForm").submit();
		}

	function resetFilters() {
		 document.getElementById("filterForm").reset();
		 applyFilters(); 
	}
	
	//팔아요,구해요
	function showAllBoards() {
   		 window.location.href = "boardSelectAll.do";
 	 }
	
	function showSellBoards() {
	    window.location.href = "boardSelectAll.do?board_type=2";
	  }

	 function showBuyBoards() {
	   window.location.href = "boardSelectAll.do?board_type=1";
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