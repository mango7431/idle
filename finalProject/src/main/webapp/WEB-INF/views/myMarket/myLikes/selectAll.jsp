<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜목록</title>
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
	width : 75%;
	display: flex;
	flex-direction: row;
	border: 1px solid gray;
	margin: 5px auto;
	align-items: center;
	 position: relative;
}

/* .contentImg{ */
/* 	width: 30%; */
/* } */

.contentImg img {
  max-width: 80%;
/*   height: 100%; */
}

.contentTitle{
	width: 50%;
}

.contentTitle p{
	margin-bottom: 10px;
}

.boardStatus{
	color: blue;
}

.selectStatus{
	text-align: right;
	margin-bottom: 10px;
}

.listBtn{
	background: transparent;
	border: none;
	padding: 20px 30px 0px 30px;
	font-weight: bold;
	font-size: large;
	color: blue;
}

.heartdiv {
    position: absolute;
    top: 0;
    right: 0;
    margin: 5px 5px 0 0;
}

.heartlink img:hover{
	width: 35px;
}

/*사이드메뉴*/
.sideMarket{
	width : 150px;
	height : 170px;
	border: 1px solid gray;
	background: #f8f8ff;
	margin: 60px 0px 60px 60px;
	padding: 15px;
}

.sideMarket p a{
	font-size: 15px;
}

/*토글*/
.ingStatus{
	display: flex;
    align-items: center;
    justify-content: flex-end;
    margin-bottom: 20px;
}

.ingStatus span {
    margin-right: 5px;
}

#toggle-slider {
    display: none;
}

#toggleLabel {
    text-indent: -999em; 
    cursor: pointer;
    width: 40px;
    height: 20px;
    background-color: #e0e0e0;
    border-radius: 25px;
    position:relative;
    transition: 0.5s ease-out;
}

#toggleLabel::after {
    content: ''; 
    width: 15px; 
    height: 15px;
    background-color: #fff;
    position: absolute;
    border-radius: 50%;
    top: 3px;
    left: 3px;
    transition: 0.5s ease-out;
}

#toggle-slider:checked + #toggleLabel {
    background-color: #4B89DC;
}

#toggle-slider:checked + #toggleLabel::after {
    left:calc(100% - 19px);
    background-color: #fff;
}

.hidden {
    display: none;
}

#nolistP{
	text-align: center;
	font-size: large;
}

</style>
<script type="text/javascript">
window.onload = function(){
// 	console.log('selectAll()....');
	
	$(function(){
		$.ajax({
			url : "jsonLikeSelectAll.do",
			method: 'GET',
			dataType: 'json',
			success: function(arr){
// 				console.log('jsonLikeSelectAll:',arr);
				let tag_vos = '';
				
	 	 		$.each(arr,function(index,vo){
// 					console.log(index,vo);
					
					let boardStatus = '';
						if (vo.board_status == 1) {
						    if (vo.board_type == 1) {
						        boardStatus = "구매중";
						    } else if (vo.board_type == 2) {
						        boardStatus = "판매중";
						    }
						}else if(vo.board_status == 2){
						    if (vo.board_type == 1) {
						        boardStatus = "구매완료";
						    } else if (vo.board_type == 2) {
						        boardStatus = "판매완료";
						    }
						}else {
						    boardStatus = "비공개";
						}
	                
					tag_vos += ` 
				        <div class="contents \${vo.board_status == 1 ? 'trade-available' : 'trade-completed'}">
			        	<div class="contentImg">
			        		<a href="\${vo.board_status !== 3 ? 'boardSelectOne.do?board_num=' + vo.board_num : 'javascript:showAlert();'}">
					          <img src="resources/img/\${vo.board_savename1}" alt="" />
					        </a>
			        	</div>
			        	<div class="contentTitle">
			        		<p>
				        	<span class="boardStatus">
				        		<b>` + boardStatus + `</b>
				        	</span>
				        	<a href="\${vo.board_status !== 3 ? 'boardSelectOne.do?board_num=' + vo.board_num : 'javascript:showAlert();'}">
						    <span>\${vo.board_title}</span>
						    </a>
						    </p>
				            <p>가격: \${vo.price}원</p>
				            <p>지역 : \${vo.deal_region}</p>
				            <p>♡\${vo.likecount} 채팅\${vo.chatcount} <span> 조회 \${vo.view_count}</span></p>
			        	</div>
			        	<div class="heartdiv">
			        	<a href="javascript:void(0);" onclick="likeButton(\${vo.likes_num})" class="heartlink"><img width="25px" src="resources/img/heart.png" alt="" /></a>
			        	</div>
			        </div>
						`;
				});
	 	 		if(tag_vos === ''){
					$("#lvos").html("<p id='nolistP'>찜한 게시글이 존재하지 않습니다.</p>");	 	 			
	 	 		}else{
					$("#lvos").html(tag_vos);	 	 				 	 			
	 	 		}
	 	 		
	 	 		// 토글 기능
                $("#toggle-slider").on("change", function() {
                    if ($(this).is(":checked")) {
                        $(".contents.trade-completed").addClass("hidden");
                    } else {
                        $(".contents.trade-completed").removeClass("hidden");
                    }
                });
			},
			error : function(xhr,status,error){
				console.log('xhr.status:',xhr.status);
			}
		});//end ajax
	});//end function
};//end onload

//찜기능
function likeButton(likes_num){
// 	console.log('찜해제');
	$.ajax({
		url:"jsonLikeOnlyDelete.do?likes_num="+likes_num,
		method:'GET',
		date:{
			likes_num: likes_num
		},
		dataType:'json',
		success: function(result){
			if(result==1){
				window.location.href = "myLikeSelectAll.do";
			}
		},
		error:function(xhr,status,error){
			console.log('xhr:',xhr.status);
		}
		
	});
};

function showAlert() {
	  alert('비공개 게시글입니다.');
	}
</script>
</head>
<body>
	<jsp:include page="../../top_menu.jsp"></jsp:include>
	<header>
		<div class="headerTitle">
			<h4>
				<b>내 찜 목록</b>
			</h4>
		</div>
	</header>
	
	<main>
		<!--사이드메뉴 -->
		<div class="sideMarket">
			<p><b>내 상점</b></p>
			<p><a href="buySelectAll.do">내 거래 목록</a></p>
			<p><a href="myWriteBuySelectAll.do">내가 쓴 글</a></p>
			<p><a href="myLikeSelectAll.do">내 찜 목록</a></p>
		</div>
		
		<div class="reportContainer">
		    <div>
		        <button class="listBtn">찜목록</button>
		    </div>
		    <hr />
		    <div class="contenList">
    			<div class="ingStatus">
    				<span>거래가능상품</span>
				    <input type="checkbox" id ="toggle-slider"/>
				    <label for="toggle-slider" id="toggleLabel"></label>
		    	</div>
			  	<div id="lvos">
			  	
			  	</div>
		    </div>
    	</div>
	</main>
</body>
</html>