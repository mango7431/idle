<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<title>공지사항</title>
<jsp:include page="../css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>공지사항</h1>
	<a href="noticeInsert.do?notice_num=${param.notice_num}" class="myButton" style="float: right;">글쓰기</a>
	
	<div style="float:right;">
		<form action="noticeSearchList.do">
			<select name="searchKey" id=searchKey">
				<option value="notice_title">제목</option>
				<option value="notice_content">내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" placeholder="키워드를 입력하세요.">
			<input type="submit" value="검색">
		</form>
	</div>
	
	<table id="noticeList">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td><a href="noticeSelectOne.do?notice_num=${vo.notice_num}">${vo.notice_num}</a></td>
				<td>${vo.notice_title}</td>
				<td>${vo.notice_content}</td>
				<td>${vo.notice_date}</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
					<c:forEach var="i" begin="1"
							end="${totalPageCount }" step="1">
							<a href="noticeSelectAll.do?cpage=${i }${params}">${i }</a>&nbsp;
					</c:forEach>
			</td>
		</tr>
	</tfoot>
	</table>
</body>
</html>