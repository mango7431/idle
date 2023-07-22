<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/blackSelectAll.css">
<script type="text/javascript">
$(function(){
	$.ajax({
		url : "jsonBlackSelectAll.do",
		data: {
			 pageNum : ${pageVO.cri.pageNum},
			 amount : ${pageVO.cri.amount}
			},
		method : 'GET',
		dataType: 'json',
		success: function(arr){
			console.log('ajax...success:', arr);
			
			let tag_vos = '';
			
			$.each(arr,function(index,vo){
				console.log(index,vo);
				
				var memberReport = '';
				var boardReport = '';
				var memberBtn = '';
				var boardBtn = '';
				var report = '';
				
				if(vo.black_type === 2){
					report = '<span>게시글신고</span>';
					boardReport = `<p><b>경고횟수 : </b>\${vo.board_report}</p>`;
					if (vo.board_title !== null){
						boardBtn = `<button onclick="removeBoard('\${vo.board_num}', '\${vo.targetid}')" class="delBtn">영구삭제</button>`;						
					}
				}else if(vo.black_type === 1){
					report = '<span>회원신고</span>';
					memberReport = `<p><b>경고횟수 : </b>\${vo.member_report}</p>`;
					if (vo.targetid !== null){
						memberBtn = `<button onclick="removeMember('\${vo.targetid}')" class="delBtn">영구탈퇴</button>`;						
					}
				}

				const date = new Date(vo.black_date).toISOString().replace(/T/,' ').replace(/\..+/,'');
				
				const categories = {1: "광고", 2: "거래금지품목", 3: "정보부족", 4: "사기", 5: "기타", 6: "사용자신고"};
				const comments = vo.comments !== null ? `<span><b>사유 : </b>\${vo.comments}</span>` : "";
				const targetid = vo.targetid !== null ? vo.targetid : "탈퇴한 회원";
				const boardTitle = vo.board_title !== null ? vo.board_title : "삭제된 게시글";	
				
				const statusBtn = vo.black_status === 2 ? '<p>처리완료</p>' : '<button onclick="changeStatus(\'' + vo.black_num + '\')" class="statusBtn">미처리</button>';

				tag_vos += `
					<tr>
						<td>\${vo.black_num}</td>
						<td>\${report}</td>
						<td>\${vo.reporterid}</td>
						<td>
						<span><b>신고대상 :<a href="memberSelectOne.do?id=\${vo.targetid}" class="ReportOne"></b> \${targetid}</span></a><br />
						<span><b>신고일자 :</b> \${date}</span><br />
						<span><b>게시글명 :<a href="boardSelectOne.do?board_num=\${vo.board_num}" class="ReportOne"></b> \${boardTitle}</span></a><br />
						<span><b>신고유형 :</b> \${categories[vo.black_category]}</span><br />
						\${comments}
						<td>
							\${boardReport}
							\${memberReport}
							\${(vo.black_type === 2 && vo.board_title === null) ? '삭제완료' : ((vo.black_type === 2 && vo.board_title !== null) ? '<button onclick="reportUp(\''+vo.black_num+'\', \''+vo.black_type+'\', \''+vo.board_num+'\', \''+vo.targetid+'\')" class="warningBtn">경고+</button>' : '')}
							\${(vo.black_type === 1 && vo.targetid === null) ? '탈퇴완료' : ((vo.black_type === 1 && vo.targetid !== null) ? '<button onclick="reportUp(\''+vo.black_num+'\', \''+vo.black_type+'\', \''+vo.board_num+'\', \''+vo.targetid+'\')" class="warningBtn">경고+</button>' : '')}
							\${boardBtn}
							\${memberBtn}
						</td>
						<td>\${statusBtn}</td>
					</tr>
				`;
			});//end each
			$("#vos").html(tag_vos);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
		
	});//end selectAll ajax
});//end $function

	// 경고버튼 이벤트
	function reportUp(black_num, black_type, board_num, targetid) {
	$.ajax({
	    url: "reportUp.do",
	    method: "GET",
	    data: {
	        black_num: black_num,
	        black_type: black_type,
	        board_num: board_num,
	        targetid: targetid
	    },
	    success: function(response) {
			alert("경고횟수가 추가되었습니다");
			location.reload();
	    },
	    error: function(xhr, status, error) {
	        console.log('xhr.status:', xhr.status);
	    }
	   });
	}//end function reportUp()

	// 게시글 영구삭제
	function removeBoard(board_num,targetid) {
		$.ajax({
			url: "removeBoard.do/"+board_num + "?targetid=" + targetid,
			method: "GET",
			success: function(response) {
				alert("신고된 게시글이 삭제되었습니다.");
				location.reload();
			},
			error: function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});
	}//end function removeBoard

	// 회원 영구탈퇴
	function removeMember(targetid) {
		$.ajax({
			url: "removeMember.do/"+targetid,
			method: "GET",
			success: function(response) {
				alert("신고된 회원이 탈퇴되었습니다.");
				location.reload();
			},
			error: function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});
	}//end function removeMember 
	
	//신고처리버튼
	function changeStatus(black_num){
		$.ajax({
			url : "changeStatus.do",
			method: "GET",
			data: {black_num: black_num},
			success: function(response){
				location.reload();
			},
			error: function(xhr, status, error) {
			  console.log('xhr.status:', xhr.status);
			}
		});
	}//end changeStatus
</script>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<header>
		<div class="headerTitle">
			<h4>
				<b>신고목록</b>
			</h4>
		</div>
	</header>

	<main>
		<div class="reportContainer">
			<div><p>미처리 신고수: <span id="totalCount">${totalCount}</span></p></div>
			<table>
				<thead>
					<tr>
						<th>신고번호</th>
						<th>신고구분</th>
						<th>신고자</th>
						<th colspan="2">신고내용</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody id="vos">

				</tbody>
			</table>
			<div class="go-btn" onclick="window.scrollTo(0, 0);">
				<span><img width="25px" src="resources/img/up.png" alt="" /></span>
			</div>
			<div class="pagination">
			<!-- 이전버튼 -->
			<c:choose>
				<c:when test="${1 == pageVO.cri.pageNum}">
					<a href="#"></a>
				</c:when>
				<c:otherwise>
					<a href="blackSelectAll.do?pageNum=${pageVO.cri.pageNum-1}"><</a>
				</c:otherwise>
			</c:choose>
			<!-- 페이지번호 -->
	       	<c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
	       		<c:choose>
					<c:when test="${pageVO.cri.pageNum == num}">
						<a href="#" class="pageOn"><span>${num}</span></a> 
					</c:when>
					<c:otherwise>
						<a href="blackSelectAll.do?pageNum=${num}&amount=${pageVO.cri.amount}">${num}</a>
					</c:otherwise>
				</c:choose>
	       	</c:forEach>
	       	<!-- 다음버튼 -->
	       	<c:choose>
				<c:when test="${pageVO.cri.pageNum == pageVO.endPage}">
					<a href="#"></a> 
				</c:when>
				<c:otherwise>
					<a href="blackSelectAll.do?pageNum=${pageVO.cri.pageNum+1}">></a>
				</c:otherwise>
			</c:choose>		
	      </div>
		</div>
	</main>
</body>
</html>