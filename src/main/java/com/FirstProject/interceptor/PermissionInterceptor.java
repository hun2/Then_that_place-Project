package com.FirstProject.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.FirstProject.login.model.User;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		//세션가져오기
		HttpSession session = request.getSession();
		User user =  (User) session.getAttribute("loginUser");
		//검색 url 가져오기
		String uri = request.getRequestURI();
		log.info("[########################prehandle] uri:{}",uri);
		
		//비로그인으로 main 페이지 접근시 로그인페이지로
		if( user == null && uri.startsWith("/main")) {
			response.sendRedirect("/login");
			return false;
		}
		if( user == null && uri.startsWith("/mypage")) {
			response.sendRedirect("/login");
			return false;
		}
		//로그인으로 로그인 페이지 접근시 메인페이지로
		if (user != null && uri.startsWith("/login")) {
			response.sendRedirect("/main");
			return false;
		}
		
		
		return true;
	}
	
}
