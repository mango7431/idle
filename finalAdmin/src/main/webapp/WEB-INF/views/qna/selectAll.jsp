<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Q&A 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous"></script>

<jsp:include page="../css.jsp"></jsp:include>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	console.log('onload..');
	var pageNum = $('input[name="pageNum"]').val();
	var amount = $('input[name="amount"]').val();
	
	$.ajax({
		url : "jsonQnaSelectAll.do",
		data: {
			pageNum : pageNum,
	 		amount : amount
		},
		method : 'GET',
		dataType: 'json',
		success: function(arr){
			console.log('ajax...success:', arr);
			
			let tag_vos = '';
			
			$.each(arr,function(index,vo){
	 			console.log(index,vo);
// 	 			console.log(vo.qna_num,vo.qna_status,vo.qna_category,vo.qna_title,vo.writer,vo.qna_date);
				
	 			let qna_status =``;
	 			if (vo.qna_status == 1) {
					qna_status = `미답변`;
			  } else if (vo.qna_status == 2) {
					qna_status = `답변완료`;
			  }
	 			let qna_category =``;
	 			if (vo.qna_category == 1) {
					qna_category = `계정문의`;
			  } else if (vo.qna_category == 2) {
				  qna_category = `채팅,알림문의`;
			  }else if (vo.qna_category == 3) {
				  qna_category = `거래문의`;
			  }else if (vo.qna_category == 4) {
				  qna_category = `광고문의`;
			  }else if (vo.qna_category == 5) {
				  qna_category = `기타문의`;
			  }
	 			
	 			tag_vos += `
	 				<tr>
				      <td><a href="qnaSelectOne.do?qna_num=\${vo.qna_num}">\${vo.qna_num}</td>
				      <td> \${qna_status}</td>
				      <td>\${qna_category}</td>
				      <td>\${vo.qna_title}</td>
				      <td>\${vo.writer}</td>
				      <td>\${vo.qna_date}</td>
			    	</tr>
	 				`;
			});//end $.each
			$("#vos").html(tag_vos);
			showPagination(pageNum, amount);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
		
	});//end $.ajax
	
	$("#vos").on("click", "tr", function() {
	    var id = $(this).find("td:nth-child(2)").text();
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
	
});//end onload


function showPagination(pageNum, amount) {
	console.log("showPagination()...");
	
	$.ajax({
		url: "jsonQnaSelectCount.do",
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
<style type="text/css">
.reportContainer{
	width: 60%;
	margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	
	<div class="reportContainer">
	<h3>Q&A목록</h3>
	<table id="boardList">
		<thead>
			<tr>
				<th>질문번호</th>
				<th>답변상태</th>
				<th>구분</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일자</th>
			</tr>
		</thead>
		<tbody id="vos">
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	<nav class="text-center">
		<ul class="list-inline" id="pagination">
		</ul>
	</nav>
		<form id="actionForm" action="qnaSelectAll.do" method="get">
				<input type="hidden" name="pageNum" value="${cri.pageNum}">
				<input type="hidden" name="amount" value="${cri.amount}">
		</form> 
	</div>
</body>
</html>