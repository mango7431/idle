<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>중고링</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<jsp:include page="css.jsp"></jsp:include>
<style type="text/css">
.sellingItemsContainer {
	margin-left: 2%;
	float: left;
/* 	background-image: */
/* 		url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQgYL6VmQR5PdxDoQh-p27Cnvb4q8WH34NgQ&usqp=CAU'); */
/* 	background-size: cover; */
	margin-bottom: 50px;
}

.sellingItems {
	width: 236px;
	float: left;
	margin: 10px;
	border: 1px solid silver;
	border-radius: 10%;
	background-color: white;
}

.sellingItems .itemImage {
	width: 100%;
	height: 200px;
	overflow: hidden;
	margin: 0 auto;
	border-radius: 10%;
	text-align: center;
}

.sellingItems .itemImage img {
	width: 100%;
	height: 100%;
	
	/* 	object-fit: cover; */
	/* 	display: block; */
	/*  	margin: 0 auto; */
}

.sellingItems .itemContent {
	padding: 5px;
}

.noList {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.noticehover:hover {
	background: silver;
}

.mainbody {
/* 	background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShtZB3PI-VBlkjuHZZGzoe3ujz0c0MtI_w7w&usqp=CAU'); */
/*  	background-size: cover; */
}

</style>
</head>
<body class="mainbody">
	<jsp:include page="top_menu.jsp"></jsp:include>
	<section style="padding-left: 100px; padding-right: 100px;">
		<div>
			<div style="margin: 50px;">
				<h3>
					공지사항<a href="noticeSelectAll.do" style="float: right;" class="plushover">더보기</a>
				</h3>
				<table class="table" id="ntable">
					<thead>
						<tr>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody class="table-group-divider" id="vos">
						<c:forEach var="vo" items="${nvos }">
							<tr
								onClick="location.href='noticeSelectOne.do?notice_num=${vo.notice_num}'"
								class="noticehover">
								<td>${vo.notice_title }</td>
								<td>관리자</td>
								<td>${vo.notice_date }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
				<div class="sellingItemsContainer">
					<h3 class="hover">
						최근 중고거래<a href="boardSelectAll.do" style="float: right;" class="plushover">더보기</a>
					</h3>
					<c:choose>
						<c:when test="${empty vos}">
							<div class="noList">
								<h4>
									<b>등록된 중고거래 게시글이 없습니다.</b>
								</h4>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="vo" items="${vos}">
								<c:if test="${vo.board_status != 3}">
									<div class="sellingItems">
										<!-- 상품각각 -->
										<div class="sellingItem" id="boardhover"
											onClick="location.href='boardSelectOne.do?board_num=${vo.board_num}'">
											<div class="itemImage">
												<img src="resources/img/${vo.board_savename1}" alt="" />
											</div>
											<div class="itemContent">
												<c:choose>
													<c:when test="${vo.board_type eq 2}">
														<c:choose>
															<c:when test="${vo.board_status eq 1}">
																<span style="background: #d3d3d3; border-radius: 3px;">판매중</span>
															</c:when>
															<c:when test="${vo.board_status eq 2}">
																<span style="background: #d3d3d3; border-radius: 3px;">판매완료</span>
															</c:when>
														</c:choose>
													</c:when>
													<c:when test="${vo.board_type eq 1}">
														<c:choose>
															<c:when test="${vo.board_status eq 1}">
																<span style="background: #d3d3d3; border-radius: 3px;">구매중</span>
															</c:when>
															<c:when test="${vo.board_status eq 2}">
																<span style="background: #d3d3d3; border-radius: 3px;">구매완료</span>
															</c:when>
														</c:choose>
													</c:when>
												</c:choose>
												<span>${vo.board_title}</span><br /> <span><fmt:formatNumber
														value="${vo.price}" pattern="#,###" />원</span><br /> <span>${vo.deal_region}</span><br />
												<span><img width="25px"
													src="resources/img/view_count.png" alt="" /></span><span>${vo.view_count}</span>
												<span>♡ ${vo.likecount}</span>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="sellingItemsContainer">
					<h3>
						최근 팔아요<a href="boardSelectAll.do?board_type=2"
							style="float: right;" class="plushover">더보기</a>
					</h3>
					<c:choose>
						<c:when test="${empty vos}">
							<div class="noList">
								<h4>
									<b>등록된 중고거래 게시글이 없습니다.</b>
								</h4>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="vo" items="${sellvos}">
								<c:if test="${vo.board_status != 3}">
									<div class="sellingItems">
										<!-- 상품각각 -->
										<div class="sellingItem" id="boardhover"
											onClick="location.href='boardSelectOne.do?board_num=${vo.board_num}'">
											<div class="itemImage">
												<img src="resources/img/${vo.board_savename1}" alt="" />
											</div>
											<div class="itemContent">
												<c:choose>
													<c:when test="${vo.board_type eq 2}">
														<c:choose>
															<c:when test="${vo.board_status eq 1}">
																<span style="background: #d3d3d3; border-radius: 3px;">판매중</span>
															</c:when>
															<c:when test="${vo.board_status eq 2}">
																<span style="background: #d3d3d3; border-radius: 3px;">판매완료</span>
															</c:when>
														</c:choose>
													</c:when>
													<c:when test="${vo.board_type eq 1}">
														<c:choose>
															<c:when test="${vo.board_status eq 1}">
																<span style="background: #d3d3d3; border-radius: 3px;">구매중</span>
															</c:when>
															<c:when test="${vo.board_status eq 2}">
																<span style="background: #d3d3d3; border-radius: 3px;">구매완료</span>
															</c:when>
														</c:choose>
													</c:when>
												</c:choose>
												<span>${vo.board_title}</span><br /> <span><fmt:formatNumber
														value="${vo.price}" pattern="#,###" />원</span><br /> <span>${vo.deal_region}</span><br />
												<span><img width="25px"
													src="resources/img/view_count.png" alt="" /></span><span>${vo.view_count}</span>
												<span>♡ ${vo.likecount}</span>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="sellingItemsContainer">
					<h3>
						최근 구해요<a href="boardSelectAll.do?board_type=1"
							style="float: right;" class="plushover">더보기</a>
					</h3>
					<c:choose>
						<c:when test="${empty vos}">
							<div class="noList">
								<h4>
									<b>등록된 중고거래 게시글이 없습니다.</b>
								</h4>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="vo" items="${buyvos}">
								<c:if test="${vo.board_status != 3}">
									<div class="sellingItems">
										<!-- 상품각각 -->
										<div class="sellingItem" id="boardhover"
											onClick="location.href='boardSelectOne.do?board_num=${vo.board_num}'">
											<div class="itemImage">
												<img src="resources/img/${vo.board_savename1}" alt="" />
											</div>
											<div class="itemContent">
												<c:choose>
													<c:when test="${vo.board_type eq 2}">
														<c:choose>
															<c:when test="${vo.board_status eq 1}">
																<span style="background: #d3d3d3; border-radius: 3px;">판매중</span>
															</c:when>
															<c:when test="${vo.board_status eq 2}">
																<span style="background: #d3d3d3; border-radius: 3px;">판매완료</span>
															</c:when>
														</c:choose>
													</c:when>
													<c:when test="${vo.board_type eq 1}">
														<c:choose>
															<c:when test="${vo.board_status eq 1}">
																<span style="background: #d3d3d3; border-radius: 3px;">구매중</span>
															</c:when>
															<c:when test="${vo.board_status eq 2}">
																<span style="background: #d3d3d3; border-radius: 3px;">구매완료</span>
															</c:when>
														</c:choose>
													</c:when>
												</c:choose>
												<span>${vo.board_title}</span><br /> <span><fmt:formatNumber
														value="${vo.price}" pattern="#,###" />원</span><br /> <span>${vo.deal_region}</span><br />
												<span><img width="25px"
													src="resources/img/view_count.png" alt="" /></span><span>${vo.view_count}</span>
												<span>♡ ${vo.likecount}</span>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
	</section>
</body>

</html>
