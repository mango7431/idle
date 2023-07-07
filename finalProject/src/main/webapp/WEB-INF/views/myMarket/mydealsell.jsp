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
<title>내 거래 목록</title>
<jsp:include page="../css.jsp"></jsp:include>


</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<h1>내 거래 목록 - 팔아요</h1>
	<a href="buySelectAll.do" class="myButton" style="float: left;">구해요</a>
	
	<table id="noticeList">
	<thead>
		<tr>	
			<th>판매 번호</th>
			<th>게시글 번호</th>
			<th>상대방 ID</th>
			<th>삭제하기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td>${vo.sell_num}</td>
				<td><a href="boardSelectOne.do?board_num=${vo.board_num}">${vo.board_num}</a></td>
				<td>${vo.id}</td>
				<td>
				<a href="sellDeleteOK.do?sell_num=${vo.sell_num}" class="myButton" style="display: inline-block">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4">
				<c:forEach var="i" begin="1"
							end="${totalPageCount }" step="1">
							<a href="sellSelectAll.do?cpage=${i }${params}">${i }</a>&nbsp;
				</c:forEach>
			</td>
		</tr>
	</tfoot>
	</table>

</body>
</html>