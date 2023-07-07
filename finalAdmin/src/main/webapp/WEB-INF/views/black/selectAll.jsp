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
<script type="text/javascript">
$(function(){
	$.ajax({
		url : "jsonBlackSelectAll.do",
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
						boardBtn = `<button onclick="removeBoard('\${vo.board_num}', '\${vo.targetid}')">영구삭제</button>`;						
					}
				}else if(vo.black_type === 1){
					report = '<span>회원신고</span>';
					memberReport = `<p><b>경고횟수 : </b>\${vo.member_report}</p>`;
					if (vo.targetid !== null){
						memberBtn = `<button onclick="removeMember('\${vo.targetid}')">영구탈퇴</button>`;						
					}
				}

				const date = new Date(vo.black_date).toISOString().replace(/T/,' ').replace(/\..+/,'');
				
				const categories = {1: "광고", 2: "거래금지품목", 3: "정보부족", 4: "사기", 5: "기타", 6: "사용자신고"};
					
				tag_vos += `
					<tr>
						<td><a href="#" class="ReportOne">\${vo.black_num}</a></td>
						<td>\${report}</td>
						<td>\${vo.reporterid}</td>
						<td>
						<span><b>신고대상 :</b> \${vo.targetid}</span><br />
						<span><b>신고일자 :</b> \${date}</span><br />
						<span><b>게시글명 : </b>\${vo.board_title}</span><br />
						<span><b>신고유형 :</b> \${categories[vo.black_category]}</span><br />
						<span><b>사유 : </b>\${vo.comments}</span>
						<td>
							\${boardReport}
							\${memberReport}
							\${(vo.black_type === 2 && vo.board_title === null) ? '삭제완료' : ((vo.black_type === 2 && vo.board_title !== null) ? '<button onclick="reportUp(\''+vo.black_num+'\', \''+vo.black_type+'\', \''+vo.board_num+'\', \''+vo.targetid+'\')">경고+</button>' : '')}
							\${(vo.black_type === 1 && vo.targetid === null) ? '탈퇴완료' : ((vo.black_type === 1 && vo.targetid !== null) ? '<button onclick="reportUp(\''+vo.black_num+'\', \''+vo.black_type+'\', \''+vo.board_num+'\', \''+vo.targetid+'\')">경고+</button>' : '')}
							\${boardBtn}
							\${memberBtn}
						</td>
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
	

</script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	/* 	font-family:'맑은 고딕', verdana; */
}

a, a:hover {
	text-decoration: none;
	color: black;
}

p {
	white-space: nowrap;
}

ul, li {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

main {
	width: 100%;
	min-height: 100vh;
	display: flex;
}

.headerTitle {
	margin: 30px 0 0 50px;
}

.reportContainer{
	width: 60%;
	margin: 0 auto;
}

table{
	width: 100%;
	border-top: 1px solid black;
    border-collapse: collapse;
}

th, td {
    border-bottom: 1px solid black;
    border-left: 1px solid #444444;
    padding: 10px;
}

th:first-child, td:first-child{
	border-left: none;
	text-align: center;
}

th{
	text-align: center;
}

/* td:nth-child(3){ */
/* 	width: 30%; */
/* 	border-left: none; */
/* } */


.ReportOne:hover{
	color : highlight;
	font-size: 20px;
}
</style>
</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<header>
		<div>
			<h4>
				<b>신고목록</b>
			</h4>
		</div>
	</header>

	<main>
		<div class="reportContainer">
			<h5>신고목록</h5>
			<hr />
			<table>
				<thead>
					<tr>
						<th>신고번호</th>
						<th>신고구분</th>
						<th>신고자</th>
						<th colspan="2">신고내용</th>
					</tr>
				</thead>
				<tbody id="vos">

				</tbody>
				<tfoot>
				
				</tfoot>
			</table>
		</div>
	</main>
	
</body>
</html>