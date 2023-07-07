<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
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
			console.log('onload...');
			pageLoad();
		}); 
		
		
		function pageLoad(){
			$.ajax({
				url: "jsonQnaSelectOne.do",
				data: {qna_num : ${param.qna_num}},
				method: 'GET',
				dataType: 'json',
				success: function(vo2){
					console.log('ajax...success:', vo2);
					
					let qna_num = `질문번호: \${vo2.qna_num}`;
					$('#qna_num').html(qna_num);
					
					let qna_status = ``;
					if (vo2.qna_status == 1) {
						qna_status = `미답변 제목: \${vo2.qna_title}`;
				  } else if (vo2.qna_status == 2) {
					  qna_status = `답변완료 제목: \${vo2.qna_title}`;
				  }
					$('#qna_status').html(qna_status);

					let qna_category = `구분: \${vo2.qna_category}`;
					if (vo2.qna_category == 1) {
						qna_category = `구분: 계정문의`;
				  } else if (vo2.qna_category == 2) {
					  qna_category = `구분: 채팅,알림문의`;
				  }else if (vo2.qna_category == 3) {
					  qna_category = `구분: 거래문의`;
				  }else if (vo2.qna_category == 4) {
					  qna_category = `구분: 광고문의`;
				  }else if (vo2.qna_category == 5) {
					  qna_category = `구분: 기타문의`;
				  }
					$('#qna_category').html(qna_category);
					
					let qna_date = `작성일: \${vo2.qna_date}`;
					$('#qna_date').html(qna_date);
					
					let qna_content = `\${vo2.qna_content}`;
					$('#qna_content').html(qna_content);
				},
				error: function(xhr, status, error) {
					console.log('xhr.status:', xhr.status);
				}
			});//end $.ajax
		}//end pageLoad()
		
		function selectAll(qnareply_num=0){
			console.log('selectAll()....qnareply_num:',qnareply_num);
			$.ajax({
				url : "jsonQnaReplySelectAll.do",
				data:{
					qna_num:${param.qna_num}
				},
				method:'GET',
				dataType:'json',
				success : function(vos) {
					console.log('ajax...success:', vos);
					let tag_txt = '';
					
					$.each(vos,function(index,vo){
						let tag_td = `<td>\${vo.qnareply_content}</td>`;
						if(qnareply_num==vo.qnareply_num){
							tag_td = `<td><input type="text" value=\${vo.qnareply_content} id="input_content">
							<button onclick="updateOK(\${vo.qnareply_num})">수정완료</button></td>`;
						}
						let tag_div = ``;
							tag_div = `
							<div>
								<button onclick="selectAll(\${vo.qnareply_num})">답글수정</button>
								<button onclick="deleteOK(\${vo.qnareply_num})">답글삭제</button>
							</div>`;
						tag_txt += `
							<tr>
								<td>답글번호: </td>
								<td>\${vo.qnareply_num}</td>
								<td></td>
							</tr>
							<tr>
								<td>작성일: </td>
								<td>\${vo.qnareply_date}</td>
								<td></td>
							</tr>
							<tr>
								\${tag_td}
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td>\${tag_div}</td>
								<td></td>
							</tr>
						`;
					});
					$('#qnareply_list').html(tag_txt);
				},
				error:function(xhr,status,error){
					console.log('xhr.status:', xhr.status);
				}
			});
			
		}//end selectAll	
		
		function insertOK(){
			console.log('insertOK()....');
			$.ajax({
				url : "jsonQnaReplyInsertOK.do",
				data:{
					//qna_num은 답글상태를 변하기위해 필요
					qna_num:${param.qna_num},
					qnareply_content:$('#reply_content').val()
					
				},
				method:'GET',
				dataType:'json',
				success : function(obj) {
					console.log('ajax...success:', obj);
					if(obj.result==1) {
						pageLoad();
						selectAll();
					}
				},
				error:function(xhr,status,error){
					console.log('xhr.status:', xhr.status);
				}
			});
			
		}//end insertOK
		
		function updateOK(qnareply_num=0){
			console.log('updateOK()....',qnareply_num);
			console.log($('#input_content').val());
			
			$.ajax({
				url : "jsonQnaReplyUpdateOK.do",
				data:{
					qnareply_num:qnareply_num,
					qnareply_content:$('#input_content').val()
				},
				method:'GET', 
				dataType:'json', 
				success : function(obj) {
					console.log('ajax...success:', obj);
					if(obj.result==1) selectAll();
				},
				error:function(xhr,status,error){
					console.log('xhr.status:', xhr.status);
				}
			});
			
		}//end updateOK
		
		function deleteOK(qnareply_num=0){
			console.log('deleteOK()....',qnareply_num,${param.qna_num});
			
			$.ajax({
				url : "jsonQnaReplyDeleteOK.do",
				data:{
 					//qnareply_num 은 답글을 삭제하기위해 필요
					//qna_num은 답글상태를 변하기위해 필요
					qna_num:${param.qna_num},
					qnareply_num:qnareply_num
				},
				method:'GET',
				dataType:'json',
				success : function(obj) {
					console.log('ajax...success:', obj.result);
					alert("답글을 삭제하시겠습니까?");
					if(obj.result==1) {
						pageLoad();
						selectAll();
					}
				},
				error:function(xhr,status,error){
					console.log('xhr.status:', xhr.status);
				}
			});
			
		}//end deleteOK
		
		
	</script>

</head>
<body onload="selectAll()">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="col-md-8">
		<div>
			<h4 id="qna_num"></h4>
			<h4 id="qna_status"></h4>
			<p id="qna_category"></p>
			<p id="qna_date"></p>
			<textarea class="form-control" id="qna_content" style="height: 150px"
				readonly></textarea>
		</div>
	</div>
	<hr>
	<h4>답글</h4>
	<div>
		<p>작성자: 관리자</p>
		<div id="qnareply_list"></div>
	</div>
	<hr>
	<h5>답글 작성</h5>
	<div>
		<textarea id="reply_content" rows="10" cols="70">답글입니다.</textarea>
		<div>
			<button onclick="insertOK()">작성완료</button>
		</div>
	</div>
</body>
</html>