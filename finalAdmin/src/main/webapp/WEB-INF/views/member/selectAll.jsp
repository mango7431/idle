<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<jsp:include page="../css.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(function(){
			var pageNum = $('input[name="pageNum"]').val();
			var amount = $('input[name="amount"]').val();
			
			$.ajax({
				url: "jsonMemberSelectAll.do",
				data: {
					pageNum : pageNum,
			 		amount : amount
				},
				method: 'GET',
				dataType: 'json',
				success: function(vos){
					console.log('ajax...success:', vos);				
					let tag_vos = '';
					$.each(vos, function(index, vo) {
						tag_vos += `
					    <tr>
					      <td scope="row" class="text-center align-middle">
					      	<img width="35px" src="resources/uploadimg/\${vo.member_savename}">
					      </td>
					      <td scope="row" class="text-center align-middle">\${vo.id}</td>
					      <td scope="row" class="text-center align-middle">\${vo.name}</td>
					      <td scope="row" class="text-center align-middle">\${vo.address}</td>
					      <td scope="row" class="text-center align-middle">\${vo.member_report}</td>
				    	</tr>
					  `;
					});
					
					$("#vos").html(tag_vos);
					showPagination(pageNum, amount);
				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
			
			$("#vos").on("click", "tr", function() {
			    var id = $(this).find("td:nth-child(2)").text();
			    goToDetailPage(id);
			});
			
			var actionForm = $("#actionForm");
			
			$(document).on("click", ".pagenate_button a", function(e) {
				e.preventDefault();
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(document).on("click", ".page-num a", function(e) {
				e.preventDefault();
				
				actionForm.find("input[name='pageNum']").val($(this).text());
				actionForm.submit();
			});
			
		}); //onload
		
		function goToDetailPage(id) {
			var detailPageUrl = "memberSelectOne.do?id="+id
			window.location.href = detailPageUrl;
		}
		
		function searchList() {
			console.log("searchList()...");
			
			$.ajax({
				url: "jsonMemberSearchList.do",
				data: {
					searchKey: $('#searchKey').val(),
					searchWord: $('#searchWord').val()					
				},
				method: 'GET',
				dataType: 'json',
				success: function(vos){
					console.log('ajax...success:', vos);				
					let tag_vos = '';
					$.each(vos, function(index, vo) {
						tag_vos += `
					    <tr>
					      <td scope="row" class="text-center align-middle">
					      	<img width="50px" src="resources/uploadimg/\${vo.member_savename}">
					      </td>
					      <td scope="row" class="text-center align-middle">\${vo.id}</td>
					      <td scope="row" class="text-center align-middle">\${vo.name}</td>
					      <td scope="row" class="text-center align-middle">\${vo.address}</td>
					      <td scope="row" class="text-center align-middle">\${vo.member_report}</td>
				    	</tr>
					  `;
					});
					
					$("#vos").html(tag_vos);
				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
		}
		
		function showPagination(pageNum, amount) {
			console.log("showPagination()...");
			
			$.ajax({
				url: "jsonMemberSelectCount.do",
				data: {
					pageNum : pageNum,
					amount : amount					
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

					for (let num = vo.startPage; num <= vo.endPage; num++) {
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
				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="container">
		<div class="breadcrumb fs-5 fw-bold px-4">회원목록</div>
		
		<div class="row justify-content-md-end align-items-center">
		  <div class="col-md-2 col-sm-4 mt-2">
		    <select class="form-select form-select" id="searchKey" required aria-label="select example">
		      <option selected>선택</option>
		      <option value="id">아이디</option>
		      <option value="name">이름</option>
		    </select>
		  </div>
		  <div class="col-md-4 col-sm-8 mt-2">
		    <div class="input-group">
		      <input type="text" class="form-control form-control" id="searchWord">
		      <button type="button" class="btn btn-primary btn" onclick="searchList()">검색</button>
		    </div>
		  </div>
		</div>

		<hr>
		<div class="row">
			<table class="table table-sm">
			  <thead>
			    <tr>
			      <th scope="col" class="col text-center py-3">프로필</th>
			      <th scope="col" class="col text-center py-3">ID</th>
			      <th scope="col" class="col text-center py-3">이름</th>
			      <th scope="col" class="col text-center py-3">주소</th>
			      <th scope="col" class="col text-center py-3">신고</th>
			    </tr>
			  </thead>
			  <tbody id="vos">
	
			  </tbody>
			</table>
			
			<nav class="text-center">
			  <ul class="list-inline" id="pagination">
			  
			  </ul>
			</nav>  
				
			<form id="actionForm" action="memberSelectAll.do" method="get">
				<input type="hidden" name="pageNum" value="${cri.pageNum}">
				<input type="hidden" name="amount" value="${cri.amount}">
				<!-- 유저 정보 수정하기 -->
			</form> 
		</div>
	</div>
</body>
</html>
