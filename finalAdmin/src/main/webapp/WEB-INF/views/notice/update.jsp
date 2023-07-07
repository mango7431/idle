<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<h1>공지사항 수정</h1>
	
	<form action="noticeUpdateOK.do" method="post">
		<table id="noticeList">
			<tr>
				<td><label for="notice_num">번호</label></td>
				<td>${vo2.notice_num}
				<input type="hidden" id="notice_num" name="notice_num" value="${vo2.notice_num}">
				</td>
			</tr>
			<tr>
				<td><label for="notice_title">제목</label></td>
				<td><input type="text" id="notice_title" name="notice_title" value="${vo2.notice_title}"></td>
			</tr>
			<tr>
				<td><label for="notice_content">내용</label></td>
				<td><textarea rows="10" cols="100" name="notice_content">${vo2.notice_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	
	</form>
</body>
</html>