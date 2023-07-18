<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
	<header class="p-3 mb-3 border-bottom">
	    <div class="container">
	      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
	          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
	        </a>
	
	        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	          <li><a href="home.do" class="nav-link px-2 link-secondary">중고링</a></li>
	          <li><a href="noticeSelectAll.do" class="nav-link px-2 link-dark">공지사항</a></li>
	          <li><a href="boardSelectAll.do" class="nav-link px-2 link-dark">중고거래</a></li>
	          <li><a href="roomSelectAll.do" class="nav-link px-2 link-dark">채팅목록</a></li>
	        </ul>
	
	        <form action="b_searchList.do" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
	          <input type="search" name="searchWord" id="searchWord" class="form-control" placeholder="Search..." aria-label="Search">
	        </form>
	        
	        <div>
	        	<a id="login" href="login.do">로그인</a>
	        	<a id="memberInsert" href="memberInsert.do">회원가입</a>
	        </div>
	        
	        <div class="dropdown text-end">
	          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
	          </a>
	          <ul class="dropdown-menu text-small">
	            <li><a class="dropdown-item" href="buySelectAll.do">내 상점</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="memberSelectOne.do?id=${user_id}">마이페이지</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li id="logout"><a class="dropdown-item" href="logout.do">로그아웃</a></li>
	          </ul>
	        </div>
	        <div class="dropdown-center">
		        <button type="button" class="notification-btn position-relative" data-bs-toggle="dropdown" aria-expanded="false">
				  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
					  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
					</svg>
					<span class="badge"> </span>
				</button>
				<ul class="dropdown-menu mt-2 py-3" style="width: 350px;" id="vos">
	
				</ul>
	        </div>
	        
	      </div>
	    </div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript">
		if ('${user_id}' === '') {//섹션 없을떄(로그인정보 없을때)
			$('#login').show();
			$('#memberInsert').show();
			$('#logout').hide();
			$('.dropdown').hide();
			$('.dropdown-center').hide();

		} else {//섹션 있을떄(로그인정보 있을때)
			$('#login').hide();
			$('#memberInsert').hide();
			$('#logout').show();
			$('.dropdown').show();
			$('.dropdown-center').show();
			sseConnect();
		}
		
		//검색
		document.getElementById("searchWord").addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            var searchWord = document.getElementById("searchWord").value;
            var url = "b_searchList.do?searchWord=" + encodeURIComponent(searchWord);
            window.location.href = url;
        }
    });
    
    //알림 내역 갖고 오기
		$.ajax({
			url: "jsonNotificationSelectAll.do",
			data: {id: "${user_id}"},
			method: 'GET',
			dataType: 'json',
			success: function(vos){
				console.log('ajax...success:', vos);	
			  	let tag_vos = '';
				
				if(vos.length === 0) {
					tag_vos = `
						<li class="px-3">
				  			수신된 알람이 없습니다.
					 	</li>
					    <hr>
						<li style="color:#737373;" class="px-3">
							알림은 최대 5개까지만 표시됩니다.
						</li>
					`;
					$("#vos").html(tag_vos);
				} else {
					$.each(vos, function(index, vo) {						
						date = new Date(vo.notification_date);
						let formattedDate = date.toLocaleString();
						
						if (vo.notification_type === 1) { // 채팅
							tag_vos += `
								<li class="px-3 notification-link">
								 	<a href="#">
								 		\${vo.notification_title}
								 		\${vo.notification_content}
								 		<span class="alarm-time" style="color:#737373;">\${formattedDate}</span>
									</a>
								</li>
								<hr>
							`;	
						} else if (vo.notification_type === 2) {
							tag_vos += `
								<li class="px-3 notification-link">
								 	<a href="#">
								 		\${vo.notification_title}
								 		질문에 대한 답변이 왔습니다.
								 		<span class="alarm-time" style="color:#737373;">\${formattedDate}</span>
									</a>
								</li>
								<hr>
							`;	
						}				    
					}); //each
					
					tag_vos += `
						<li style="color:#737373;" class="px-3">
							알림은 최대 5개까지만 표시됩니다.
						</li>
					`;
					$("#vos").html(tag_vos);
					
					//클릭 표시 
					$(document).on('click', '.notification-link', function() {
					    $(this).addClass('visited-link');
					});
					
				}
			},
			error: function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});
		
		
		//sse 연결 (클라이언트 -> 서버)
		function sseConnect() {	
	        const eventSource = new EventSource('/idle/subscribe.do?memberId=${user_id}');
	
	        eventSource.addEventListener("message", function (event) {
	            console.log(event.data);
	
	            const data = JSON.parse(event.data);
	
	            (async () => {
	                // 브라우저 알림
	                const showNotification = () => {
	                    
	                    const notification = new Notification(data.title, {
	                        body: data.content
	                        //icon:
	                    });
	                    
	                    setTimeout(() => {
	                        notification.close();
	                    }, 5 * 1000);
	                    
	                    notification.addEventListener('click', () => {
	                        window.open(data.url, '_blank');
	                    });
	                }
	
	                // 브라우저 알림 허용 권한
	                let granted = false;
	
	                if (Notification.permission === 'granted') {
	                    granted = true;
	                } else if (Notification.permission !== 'denied') {
	                    let permission = await Notification.requestPermission();
	                    granted = permission === 'granted';
	                }
	
	                // 알림 보여주기
	                if (granted) {
	                    showNotification();
	                }
	            })();
	        });
    	}
	</script>
</header>