<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>중고거래(관리자)</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<script type="text/javascript">
	var result = '<'
</script>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<section style="padding-left: 100px; padding-right: 100px;">
		<h1>중고거래(관리자)</h1>
		<p>게시글 총 갯수 : <label id="total">${total}</label></p>
		
		<form action="boardSearchList.do">
			<select name="searchKey" id="searchKey">
			<option value="board_title">제목</option>
			<option value="writer">작성자</option>
			</select> 
			<input type="text" name="searchWord" value="제목" id="searchWord"/>
			<input type="hidden" name="page" value="1" id="page"/>
			<input type="submit" value="검색">
		</form>
		
		<table class="table">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">메인사진</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">가격</th>
					<th scope="col">경고횟수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody class="table-group-divider" id="vos">
				<c:forEach var="vo" items="${vos }">
					<tr onClick="location.href='boardSelectOne.do?board_num=${vo.board_num}'" onmouseover="this.style.background='silver'" onmouseout="this.style.background='white'">
						<td>${vo.board_num }</td>
						<td><img width="35px" src="resources/img/${vo.board_savename1}"></td>
						<td>${vo.board_title }</td>
						<td>${vo.writer }</td>
						<td>${vo.price }</td>
						<td>${vo.board_report }</td>
						<td>${vo.board_date }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot id="pages">
				<tr>
					<c:if test="${empty param.searchKey}">
						<td colspan="6" align="center">
							<c:if test="${page.prev}">
								<li class="list-inline-item prev pagenate_button">
									<a href="boardSelectAll.do?pageNum=${page.startPage -1}">&laquo;</a>
								</li>
							</c:if> 
								<c:forEach begin="${page.startPage}" end="${page.endPage}" var="num">
									<li class="list-inline-item ${page.cri.pageNum == num ? "active":""}">
										<a href="boardSelectAll.do?pageNum=${num}">${num}</a>
									</li>
								</c:forEach> 
							<c:if test="${page.next}">
								<li class="list-inline-item next pagenate_button">
									<a href="boardSelectAll.do?pageNum=${page.endPage + 1}">&raquo;</a>
								</li>
							</c:if>
						</td>
					</c:if>
					<c:if test="${not empty param.searchKey}">
						<td colspan="6" align="center">
							<c:if test="${page.prev}">
								<li class="list-inline-item prev pagenate_button">
									<a href="boardSearchList.do?searchKey=${param.searchKey}&searchWord=${param.searchWord}&pageNum=${page.startPage -1}">&laquo;</a>
								</li>
							</c:if> 
								<c:forEach begin="${page.startPage}" end="${page.endPage}" var="num">
									<li class="list-inline-item ${page.cri.pageNum == num ? "active":""}">
										<a href="boardSearchList.do?searchKey=${param.searchKey}&searchWord=${param.searchWord}&pageNum=${num}">${num}</a>
									</li>
								</c:forEach> 
							<c:if test="${page.next}">
								<li class="list-inline-item next pagenate_button">
									<a href="boardSearchList.do?searchKey=${param.searchKey}&searchWord=${param.searchWord}&pageNum=${page.endPage + 1}">&raquo;</a>
								</li>
							</c:if>
						</td>
					</c:if>
				</tr>
			</tfoot>
		</table>
	</section>
</body>
</html>
