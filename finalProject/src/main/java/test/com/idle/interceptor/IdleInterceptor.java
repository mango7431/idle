package test.com.idle.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class IdleInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.info("preHandle()...");
		
		String sPath = request.getServletPath();
		log.info("sPath : {}",sPath);
		
		String user_id = (String)session.getAttribute("user_id");
		log.info("user_id : {}",user_id);
		
		if(sPath.equals("/boardInsert.do")||sPath.equals("/boardInsertOK.do")||sPath.equals("/boardUpdate.do")
				||sPath.equals("/boardUpdateOK.do")||sPath.equals("/boardDeleteOK.do")||sPath.equals("/jsonChangeStatus.do")
				||sPath.equals("/jsonLikeSelectOne.do")||sPath.equals("/jsonLikeInsert.do")||sPath.equals("/jsonLikeDelete.do")
				||sPath.equals("/roomSelectAll.do")||sPath.equals("/jsonRoomInsert.do")||sPath.equals("/jsonRoomDelete.do")
				||sPath.equals("/jsonRoomCheck")||sPath.equals("/jsonMessageSelectAll.do")||sPath.equals("/readCheck.do")
				||sPath.equals("/jsonReadCount.do")||sPath.equals("/jsonBuyRequest.do")||sPath.equals("/jsonBuyInsert.do")
				||sPath.equals("/jsonSellInsert.do")||sPath.equals("/blackInsertOK.do")||sPath.equals("/buySelectAll.do")
				||sPath.equals("/sellSelectAll.do")||sPath.equals("/qnaSelectAll.do")||sPath.equals("/memberSelectOne.do")
				||sPath.equals("/memberUpdate.do")||sPath.equals("/memberUpdateOK.do")||sPath.equals("/jsonMemberSelectOne.do")
				||sPath.equals("/jsonQnaSelectAll.do")||sPath.equals("/jsonQnaSelectCount.do")||sPath.equals("/jsonQnaSelectOne.do")
				||sPath.equals("/qnaSelectOne.do")||sPath.equals("/myLikeSelectAll.do")||sPath.equals("/myWriteBuySelectAll.do")) {
			if(user_id==null) {
				response.sendRedirect("login.do");
				return false;
			}
		}
		
		return true;
	}

}
