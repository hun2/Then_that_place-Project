package com.FirstProject.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.FirstProject.common.FileManagerServices;
import com.FirstProject.interceptor.PermissionInterceptor;
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		//웹주소 url 형식
		.addResourceHandler("/images/**")
		// 실제 파일위치 경로
		/*.addResourceLocations("file:///" + FileManagerServices.FILE_UPLOAD_PATH);*/
		
		
		//리눅스 인경우 
		.addResourceLocations("file://" + FileManagerServices.FILE_UPLOAD_PATH);
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")
		.excludePathPatterns("/favicon.ico", "/error", "/logout", "/static/**")
		;
	}
	
}
