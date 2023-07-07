<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Q&A 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

<jsp:include page="../css.jsp"></jsp:include>
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
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
			
		<c:forEach var="vo" items="${vos}">
			<tr>
			
				<td><a href="qnaSelectOne.do?qna_num=${vo.qna_num}">${vo.qna_num}</a></td>
				
			  	<td>
				  <c:choose>
				  <c:when test="${vo.qna_status eq 1}">
				    <span style="color:#FF0000">미답변</span><br />
				  </c:when>
				  <c:when test="${vo.qna_status eq 2}">
				    <span style="color:#000000">답변완료</span><br />
				  </c:when>
				</c:choose>
			  	</td>
				
				<td>
				  <c:choose>
				  <c:when test="${vo.qna_category eq 1}">
				    <span style="background:#FAECC5;border-radius:4px;">계정문의</span><br />
				  </c:when>
				  <c:when test="${vo.qna_category eq 2}">
				    <span style="background:#E4F7BA;border-radius:4px;">채팅,알림문의</span><br />
				  </c:when>
				  <c:when test="${vo.qna_category eq 3}">
				    <span style="background:#D4F4FA;border-radius:4px;">거래문의</span><br />
				  </c:when>
				  <c:when test="${vo.qna_category eq 4}">
				    <span style="background:#E8D9FF;border-radius:4px;">광고문의</span><br />
				  </c:when>
				  <c:when test="${vo.qna_category eq 5}">
				    <span style="background:#EAEAEA;border-radius:4px;">기타문의</span><br />
				  </c:when>
				</c:choose>
			  	</td>
		
				<td>${vo.qna_title}</td>
				<td>${vo.writer}</td>
				<td>${vo.qna_date}</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>



